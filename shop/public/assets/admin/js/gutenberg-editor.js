
    const categories = Laraberg.wordpress.blocks.getCategories();
    const {registerBlockType} = Laraberg.wordpress.blocks;
    const {useState, useEffect} = Laraberg.wordpress.element;
    const {apiFetch} = Laraberg.wordpress;


    Laraberg.wordpress.blocks.setCategories( [
        ...categories,
        {slug: 'custom-category', title: 'Custom category', icon: 'admin-generic'}
    ] );

    for ( const [key, value] of Object.entries( gutenberg_blocks ) ) {
        const el = Laraberg.wordpress.element.createElement;
        const iconEl = el('svg', { width: 20, height: 20 },
            el('path', { d: "M12.5,12H12v-0.5c0-0.3-0.2-0.5-0.5-0.5H11V6h1l1-2c-1,0.1-2,0.1-3,0C9.2,3.4,8.6,2.8,8,2V1.5C8,1.2,7.8,1,7.5,1 S7,1.2,7,1.5V2C6.4,2.8,5.8,3.4,5,4C4,4.1,3,4.1,2,4l1,2h1v5c0,0-0.5,0-0.5,0C3.2,11,3,11.2,3,11.5V12H2.5C2.2,12,2,12.2,2,12.5V13 h11v-0.5C13,12.2,12.8,12,12.5,12z M7,11H5V6h2V11z M10,11H8V6h2V11z" } )
        );
        Laraberg.registerBlockType( value.slug, {
            title: value.title,
            //icon: value.icon,
            icon: iconEl,
            category: value.category,
            supports: {
                inserter: true,
                reusable: true,
                html: false,
                lock: {move: true, remove: true}
            },
            attributes: {
                fields: {type: 'object', default: {}}
            },
            edit: function ( props ) {
                const [html, setHtml] = Laraberg.wordpress.element.useState( 'Loading...' );
                Laraberg.wordpress.element.useEffect( () => {
                    let csrfToken = document.querySelector( 'meta[name="csrf-token"]' ).getAttribute( 'content' );
                    fetch( `/admin/gutenberg/block`,
                        {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': csrfToken,
                            },
                            body: JSON.stringify( {
                                slug: value.slug,
                                attributes: props.attributes,
                                id: props.clientId
                            } )
                        } )
                        .then( response => response.text() )
                        .then( html => {
                            setHtml( html );
                            const targetNode = document.querySelector( `[data-block="` + props.clientId + `"]` );
                            targetNode.querySelectorAll( 'script' ).forEach( script => {
                                const newScript = document.createElement( 'script' );
                                if ( script.src ) {
                                    newScript.src = script.src;
                                } else {
                                    newScript.textContent = script.textContent;
                                }
                                document.body.appendChild( newScript );
                            } );
                            init_block_fields( props.clientId );
                        } )
                        .catch( ( error ) => {
                            console.error( 'Error:', error );
                        } );
                }, [] );

                const updateAttributes = ( event ) => {
                    let newFields = {...props.attributes.fields};
                    let value;
                    if (event.target.multiple) {
                        value = Array.from(event.target.selectedOptions).map(o => o.value);
                    } else {
                        value = event.target.value.trim();
                    }
                    // Проверяем, есть ли `name` и `value` не пусто
                    if (event.target.dataset.name && event.target.dataset.name !== 'null' && value !== "") {
                        newFields[event.target.dataset.name] = value;
                    } else {
                        delete newFields[event.target.dataset.name];
                    }
                    props.setAttributes( {fields: newFields} );
                };

                return Laraberg.wordpress.element.createElement( 'div', {
                    dangerouslySetInnerHTML: {__html: html},
                    onInput: updateAttributes
                } );

            },
            save: function ( props ) {
                return null;
            }
        } );

    }
function init_block_fields( block_id ) {

    let block = document.querySelector( `[data-block="` + block_id + `"]` );

    // mce editor
    let t_editor = window.voyagerTinyMCE.getConfig();
    block.querySelectorAll( '.mce-editor' ).forEach( fields_editor => {
        t_editor.selector = '#' + fields_editor.id;
        t_editor.setup = function ( editor ) {
            editor.on( 'input change', function () {
                let input = document.getElementById( fields_editor.id );
                let content = this.getContent();
                input.value = content;
                Object.getOwnPropertyDescriptor( HTMLInputElement.prototype, 'value' ).set.call( input, content );
                requestAnimationFrame( () => {
                    input.dispatchEvent( new Event( 'input', {bubbles: true} ) );
                    input.dispatchEvent( new Event( 'change', {bubbles: true} ) );
                } )
            } );
        };
        window.TinyMCE.init( t_editor );
    } )
    // end mce editor

    // select2
    block.querySelectorAll('.select2').forEach(select => {
        $(select).select2().on('select2:select select2:unselect', function () {
            let input = this;
            let content = $(this).val() || [];
            for (let option of input.options) {
                option.selected = content.includes(option.value);
            }

            requestAnimationFrame(() => {
                input.dispatchEvent(new Event('input', { bubbles: true }));
                input.dispatchEvent(new Event('change', { bubbles: true }));
            });
        });
    });
    // end select2
    // repeater
    block.querySelectorAll( '.repeatable-block' ).forEach( repeatableBlock => {
        let rowHtml = JSON.parse( repeatableBlock.dataset.row );
        let addButton = repeatableBlock.querySelector( ".add-row-button" );
        let input_list = repeatableBlock.querySelector( ".repeater-values" );
        let fields = repeatableBlock.querySelector( ".fields" );
        addButton.addEventListener( "click", function () {
            console.log( 'add button' );
            const row = document.createElement( "div" );
            row.classList.add( "row-item" );
            row.insertAdjacentHTML( "beforeend", rowHtml );
            fields.appendChild( row );
        } );

        fields.addEventListener( "input", function ( event ) {
            let data = [];
            fields.querySelectorAll( '.row-item' ).forEach( ( row ) => {
                let row_data = {};
                row.querySelectorAll( "input, textarea, select" ).forEach( ( input ) => {
                    if ( input.getAttribute( "data-item-name" ) && input.value.trim() !== '' ) {
                        row_data[input.getAttribute( "data-item-name" )] = input.value;
                    }
                } );
                data.push( row_data );
            } );
            data = JSON.stringify( data );
            input_list.value = data;
            Object.getOwnPropertyDescriptor( HTMLInputElement.prototype, 'value' ).set.call( input_list, data );
            input_list.dispatchEvent( new Event( 'input', {bubbles: true} ) );
        } );
    } );
    // end repeater
}
// upload files in blocks
function updateFileInput( input, content ) {
    Object.getOwnPropertyDescriptor( HTMLInputElement.prototype, 'value' ).set.call( input, content );
    input.dispatchEvent( new Event( 'input', {bubbles: true} ) );
    input.dispatchEvent( new Event( 'change', {bubbles: true} ) );
}

function loadFile( input ) {
    let parent = input.closest( ".file-block" );
    let uploadedImages = parent.querySelector( ".uploaded_images" );
    let hiddenInput = parent.querySelector( 'input.file-input' );
    if ( input.files.length === 0 ) {
        uploadedImages.innerHTML = "";
        hiddenInput.value = "";
        updateFileInput( hiddenInput, '' );
        return;
    }

    let file = input.files[0];
    let formData = new FormData();
    formData.append( "file", file );
    let csrfToken = document.querySelector( 'meta[name="csrf-token"]' ).getAttribute( 'content' );

    fetch( "/admin/gutenberg/upload", {
        method: "POST",
        body: formData,
        headers: {
            "X-CSRF-TOKEN": csrfToken
        }
    } )
        .then( response => response.json() )
        .then( data => {
            if ( data.success ) {

                let img = document.createElement( "img" );
                img.src = data.file_asset;
                img.style.maxWidth = "100%";
                img.style.maxHeight = "100%";

                uploadedImages.innerHTML = "";
                uploadedImages.appendChild( img );

                hiddenInput.value = data.file_path;
                updateFileInput( hiddenInput, data.file_path );
            } else {
                console.error( "File download error:", data.message );
                alert( "File download error!" );
            }
        } )
        .catch( ( error ) => {
            console.error( 'Error:', error );
        } );
}

// end upload files in blocks
