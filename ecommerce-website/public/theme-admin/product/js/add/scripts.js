document.addEventListener('DOMContentLoaded', e => {

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content'),
        }
    });

    //matching elements;
    const saveEl = document.querySelector('#save');
    const cancelEl = document.querySelector('#cancel');
    const nameEl = document.querySelector('input[name=name]');
    const descEl = document.querySelector('input[name=desc]');
    const priceEl = document.querySelector('input[name=price]');
    const thumbEl = document.querySelector('input[name=thumb]');
    const relativeImagesEl = document.querySelector('input[name="relative_images[]"]');
    const contentEl = document.querySelector("[id=editor]");
    const statusEls = document.querySelectorAll('input[name=active]');
    const categoryEl = document.querySelector('select[name=category]');
    const trademarkEl = document.querySelector('select[name=trademark]');


    saveProductEvent(
        {
            dataElement:
                { nameEl, descEl, priceEl, thumbEl, relativeImagesEl, contentEl, statusEls, categoryEl, trademarkEl },
            actionElement: {
                saveEl, cancelEl,
            }
        });
});

const getFormData = ({nameEl, descEl, priceEl, thumbEl, relativeImagesEl, contentEl, statusEls, categoryEl, trademarkEl}) => {
    const name = nameEl.value;
    const desc = descEl.value;
    const price = priceEl.value;
    const content = contentEl.innerHTML === '<p><br data-cke-filler="true"></p>' ? '' : contentEl.innerHTML;
    const category_id = categoryEl.value;
    const trademark_id = trademarkEl.value;
    var status = undefined;
    var relative_images = [];
    var thumb = thumbEl.files[0];
    if (relativeImagesEl.files.length > 0) {
        for (const key in relativeImagesEl.files) {
            if (Object.hasOwnProperty.call(relativeImagesEl.files, key)) {
                const file = relativeImagesEl.files[key];
                relative_images.push(file);
            }
        }
    }

    statusEls.forEach(e => {
        if (e.checked) {
            status = e.value;
        }
        if (status === undefined) status = 0;
    });

    return {
        name, desc, price, content, status, category_id, trademark_id, thumb, relative_images,
    }
}

const saveProductEvent = ({
    dataElement:
        { nameEl, descEl, priceEl, thumbEl, relativeImagesEl, contentEl, statusEls, categoryEl, trademarkEl },
    actionElement:
        {saveEl, cancelEl },
    }) => {
    
    
    saveEl.addEventListener('click', e => {
        let data = getFormData({ nameEl, descEl, priceEl, thumbEl, relativeImagesEl, contentEl, statusEls, categoryEl, trademarkEl });
        //init form data:
        let formProduct = new FormData();
        let formImagesProduct = new FormData();
        for (const key in data) {
            if (Object.hasOwnProperty.call(data, key)) {
                if (key !== 'relative_images') {
                    formProduct.append(key, data[key]);
                }
                else {
                    for (let index = 0; index < data[key].length; index++) {
                        formImagesProduct.append(`${index}`, data[key][index]);
                    }
                }
            }
        }
        //ajax save product:
        saveProduct(formImagesProduct, formProduct);

    });
}

const saveProduct = (formImagesProduct, formProduct) => {
    // const error = validateFiles(formData.thumb, formData.relative_images);
    // if(error.length > 0)
    // {
    //     console.log(error.messages);
    // }
    // else {
        $.ajax({
            type: "POST",
            url: "add",
            data: formProduct,
            mimeType: "multipart/form-data",
            contentType: false,
            processData: false,
        })
            .done(res => {
                const id = JSON.parse(res).id;
                if (id !== undefined && id !== null) {
                    //save image product:
                    saveImagesProduct(formImagesProduct, id);
                }

            })
            .fail(error => {
                console.log(error);
            })
            .always(() => {
                resetForm();
            })
    // }
};

const saveImagesProduct = (formImagesProduct, productId) => {
    formImagesProduct.append('productId', productId);
    $.ajax({
        type: "POST",
        url: "save-product-images",
        data: formImagesProduct,
        mimeType: "multipart/form-data",
        contentType: false,
        processData: false,
    })
        .done(res => {
            alert('Thêm sản phẩm thành công!');
            console.log(res);
        })
        .fail(error => {
            console.log(error);
        })
        .always(() => {

        })
}

const resetForm = () => {

}

// const validateFiles = (thumb, images) => {
//     const error = {
//         length: 0,
//         messages: []
//     }

//     console.log(thumb, images);
//     return {
//         ...error,
//     }
// }