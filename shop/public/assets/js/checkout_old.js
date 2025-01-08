setInterval(() => {
    fetch(urlCheckoutItems, {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    })
        .then(response => response.text())
        .then(data => $('.shipping-cart-subtotal').html(data))
        .catch(error => console.error('Error:', error));
}, 3000);

$(document).ready(function () {

    $('#phoneInput').mask('+38 (999) 999-99-99', {autoclear: false});

    var offices = [];
    const suggestionsBox = $('#suggestions');
    const suggestionsInput = $('#suggestionsInput');
    const officesBox = $('#offices');
    const officesInput = $('#officesInput');

    $(document).on('click', (event) => {
        toggleVisibility(suggestionsBox, suggestionsInput, event);
        toggleVisibility(officesBox, officesInput, event);
    });

    function toggleVisibility(box, input, event) {
        if (!box[0].contains(event.target) && !input[0].contains(event.target)) {
            box.hide();
        } else if (input[0].contains(event.target)) {
            box.show();
        }
    }

    function getNp(type, query) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: urlNp,
                method: 'POST',
                contentType: 'application/json',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: JSON.stringify({ query: query, type: type }),
                success: function (data) {
                    resolve(Object.entries(data));
                },
                error: function (xhr, status, error) {
                    reject(error);
                }
            });
        });
    }
    // Обработка ввода текста в поле адреса

    function getSuggestions(query, show = true){
        getNp( 'suggestions', query )
            .then( data => {
                if ( show ){
                    // Очищаем старые варианты и показываем контейне
                    suggestionsBox.empty().show();
                }

                if ( data.length > 0 ) {
                    data.forEach( ( [key, item] ) => {
                        const $li = $( '<li>' )
                            .addClass( 'list-group-item list-group-item-action' )
                            .text( item ) // Отображаем название для пользователя
                            .on( 'click', function () {
                                suggestionsInput.val( item );
                                suggestionsBox.hide();
                                $( '#suggestionsKey' ).val( key ).trigger( 'change' );
                            } );

                        suggestionsBox.append( $li );
                    } );
                } else {
                    suggestionsBox.html( '<li class="list-group-item text-muted">Ничего не найдено</li>' );
                }
            } )
            .catch( error => {
                suggestionsBox.html( '<li class="list-group-item text-muted">Ничего не найдено</li>' );
            } );
    }

    suggestionsInput.on( 'input', function () {
        officesReset();
        const query = $( this ).val();
        if ( query.length > 2 ) {
            getSuggestions(query);
        } else {
            suggestionsBox.hide();
        }
    } );

    function getOffices( suggestion, show = true, filter = false, query ){
        getNp( 'offices', suggestion )
            .then( data => {
                if ( data.length > 0 ) {
                    offices = data;
                    if( show ){
                        officesBox.empty().show()
                    }
                    if( filter ){
                        setOffices(filterOffices(query));
                    }else{
                        setOffices(offices)
                    }

                } else {
                    officesBox.html( '<li class="list-group-item text-muted">Ничего не найдено</li>' );
                }
            } )
            .catch( error => {
                officesBox.html( '<li class="list-group-item text-muted">Ничего не найдено</li>' );
            } );
    }

    $( '#suggestionsKey' ).on( 'change', function () {
        officesReset();
        var suggestion = $( this ).val();

        $( '#officesKey' ).val( '' );
        if ( suggestion != '' && suggestion != undefined ) {
            getOffices(suggestion);
        }
    })

    officesInput.on( 'input', function () {
        $( '#officesKey' ).val( '' );
        officesBox.empty().show();
        setOffices(filterOffices($( this ).val()));
    })

    function filterOffices(query) {

        if(query.length > 0){
            console.log(offices, query);
            return offices.filter(([key, office]) => office.toLowerCase().includes(query.toLowerCase()))
        }else{
            return offices;
        }
    }

    function setOffices(offices_items){
        offices_items.forEach( ( [key, item] ) => {
            const $li = $( '<li>' )
                .addClass( 'list-group-item list-group-item-action' )
                .text( item )
                .on( 'click', function () {
                    officesInput.val( item );
                    $( '#officesKey' ).val( key );
                    officesBox.hide();
                } );

            officesBox.append( $li );
        } );
    }

    function officesReset(){
        officesBox.empty();
        offices = [];
        officesInput.val( '' );
        $( '#officesKey' ).val( '' );
    }

    if ( suggestionsInput.val() !== '' && suggestionsInput.val() !== undefined && suggestionsInput.val().length > 2) {
        getSuggestions(suggestionsInput.val(), false)
    }
    if( $( '#suggestionsKey' ).val() !== '' && $( '#suggestionsKey' ).val() !== undefined && $( '#suggestionsKey' ).val().length > 2 ){
        let office_code_old = $('#officesKey').val();
        let office_old = $('#officesInput').val();
        let show = false;
        let filter = false;
        if( office_old !== '' && office_old !== undefined && ( office_code_old === '' || office_code_old == undefined)){
            filter = true;
            show = true;
        }

        getOffices( $( '#suggestionsKey' ).val(), show, filter, office_old );
    }

});
