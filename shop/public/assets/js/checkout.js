// Обновление корзины каждые 3 секунды


$(document).ready(function () {
    if ( $( '.shipping-cart-subtotal' ).length > 0 ) {
        setInterval( () => {
            fetch( urlCheckoutItems, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': $( 'meta[name="csrf-token"]' ).attr( 'content' )
                }
            } )
                .then( response => response.text() )
                .then( data => $( '.shipping-cart-subtotal' ).html( data ) )
                .catch( error => console.error( 'Error:', error ) );
        }, 3000 );
    }

    const suggestionsBox = $('#suggestions');
    const suggestionsInput = $('#suggestionsInput');
    const officesBox = $('#offices');
    const officesInput = $('#officesInput');
    let offices = [];

    // Закрытие выпадающих списков при клике вне их области
    $(document).on('click', (event) => {
        toggleVisibility(suggestionsBox, suggestionsInput, event);
        toggleVisibility(officesBox, officesInput, event);
    });

    // AJAX-запрос к серверу
    function fetchNpData(type, query) {
        return $.ajax({
            url: urlNp,
            method: 'POST',
            contentType: 'application/json',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: JSON.stringify({ query, type })
        });
    }

    // Универсальная функция отображения выпадающего списка
    function renderDropdown(box, data, inputField, hiddenField, show = true) {
        box.empty();
        if( show ){
            box.show();
        }
        if (data.length) {
            data.forEach(([key, value]) => {
                $('<li>')
                    .addClass('list-group-item list-group-item-action')
                    .text(value)
                    .on('click', function () {
                        inputField.val(value);
                        hiddenField.val(key).trigger('change');
                        box.hide();
                    })
                    .appendTo(box);
            });
        } else {
            box.html('<li class="list-group-item text-muted">Ничего не найдено</li>');
        }
    }

    // Обработка ввода для Suggestions
    suggestionsInput.on('input', function () {
        officesReset();
        const query = $(this).val();
        if (query.length > 2) {
            fetchNpData('suggestions', query)
                .then((data) => renderDropdown(suggestionsBox, Object.entries(data), suggestionsInput, $('#suggestionsKey')))
                .catch(() => suggestionsBox.html('<li class="list-group-item text-muted">Ничего не найдено</li>'));
        } else {
            suggestionsBox.hide();
            suggestionsBox.empty();
            $('#suggestionsKey').val('');
        }
    });

    // Обработка изменений в поле Suggestions
    $('#suggestionsKey').on('change', function () {
        officesReset();
        const suggestion = $(this).val();
        if (suggestion) {
            fetchOffices(suggestion);
        }
    });

    // Обработка ввода для Offices
    officesInput.on('input', function () {
        const query = $(this).val();
        $('#officesKey').val('');
        officesBox.empty().show();
        setOffices(filterOffices(query));
    });

    // Запрос отделений
    function fetchOffices(suggestion, show = true, filter = false) {
        fetchNpData('offices', suggestion)
            .then((data) => {
                offices = Object.entries(data);
                let render_offices = offices;
                if ( filter ){
                    render_offices = filterOffices(filter);
                }
                renderDropdown(officesBox, render_offices, officesInput, $('#officesKey'), show);
            })
            .catch(() => {
                if( render ){
                    officesBox.html('<li class="list-group-item text-muted">Ничего не найдено</li>')
                }
            });
    }

    // Фильтрация отделений
    function filterOffices(query) {
        if (query.length > 0) {
            return offices.filter(([key, office]) => office.toLowerCase().includes(query.toLowerCase()));
        }
        return offices;
    }

    // Отображение отфильтрованных отделений
    function setOffices(filteredOffices) {
        renderDropdown(officesBox, filteredOffices, officesInput, $('#officesKey'));
    }

    // Сброс данных для Offices
    function officesReset() {
        officesBox.empty();
        offices = [];
        officesInput.val('');
        $('#officesKey').val('');
    }

    // Проверка значений при загрузке страницы и их обработка
    function initializePage() {
        const suggestionsInputVal = suggestionsInput.val();
        const suggestionsKeyVal = $('#suggestionsKey').val();
        const officesInputVal = officesInput.val();
        const officesKeyVal = $('#officesKey').val();

        // Проверка поля для Suggestions
        if (suggestionsInputVal?.length > 2) {
            let show = false;
            if( !suggestionsKeyVal ) {
                show = true;
            }
            fetchNpData('suggestions', suggestionsInputVal)
                .then((data) => renderDropdown(suggestionsBox, Object.entries(data), suggestionsInput, $('#suggestionsKey'), show));
        }

        // Если Suggestions Key уже выбран, фильтруем офисы
        if (suggestionsKeyVal?.length > 0) {
            if ( officesKeyVal ) {
                fetchOffices(suggestionsKeyVal, false);
            } else if( officesInputVal?.length > 0 ) {
                fetchOffices(suggestionsKeyVal, true, officesInputVal);
            }
        }
    }

    // Вызов функции инициализации при загрузке страницы
    initializePage();

    // Функция переключения видимости бокса
    function toggleVisibility(box, input, event) {
        if (!box[0].contains(event.target) && !input[0].contains(event.target)) {
            box.hide();
        } else if (input[0].contains(event.target)) {
            box.show();
        }
    }
});
