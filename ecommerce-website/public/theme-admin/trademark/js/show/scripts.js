document.addEventListener('DOMContentLoaded', () => {

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
        }
    });
    
    mainFunc();
});

const mainFunc = () => {
    const statusEls = document.querySelectorAll(`span[data-trademark-active]`);
    const removeEls = document.querySelectorAll(`a[name=remove]`);
    const editEls = document.querySelectorAll(`a[name=edit]`);
    
    //update status on ui, add event status:
    statusEls.forEach(element => {
        updateStatusUi(element);
        addEventStatusChange(element);
    })

    //add event remove:
    removeEls.forEach(element => {
        addEventRemoveItem(element);
    })

    //add event edit:
    editEls.forEach(element => {
        addEventEditItem(element);
    });

}

const updateStatusUi = element => {
    element.classList = "badge";
    const state = parseInt(element.getAttribute('data-trademark-active'));
    if (state === 0) {
        element.textContent = 'Ẩn';
        element.classList.add('badge-warning');
    }
    else if (state === 1) {
        element.textContent = 'Hiển thị';
        element.classList.add('badge-success');
    }
}

const addEventStatusChange = element => {
    element.addEventListener('click', ({target}) => {
        const trademarkId = target.getAttribute('data-trademark-id');
        $.ajax({
            type: "POST",
            url: "trademark/active",
            data: {
                trademarkId,
            },
            dataType: "json",
            success: function (response) {
                if (response.length > 0) {
                    updateSingleTrademarkUi(response, target);
                }
            }
        });
    });
}

const updateSingleTrademarkUi = ([{id, active}], target) => {
    // console.log(id, active, target.parentElement);
    const spanEl = document.querySelector(`span[data-trademark-id='${id}']`);
    const parentEl = target.parentElement.parentElement;
    if (spanEl) {
        spanEl.setAttribute('data-trademark-active', active);
        updateStatusUi(spanEl);
    }
    if (parentEl) {
        const editEl = parentEl.querySelector('a[name=edit]');
        if (editEl) {
            editEl.setAttribute('data-trademark-active', active);
        }
    }
}

const addEventRemoveItem = element => {
    element.addEventListener('click', ({ target }) => {
        const id = target.getAttribute('data-trademark-id');
        const parentEl = target.parentElement.parentElement;
        if (id) {
            $.ajax({
                type: "GET",
                url: `trademark/remove/${id}`,
                success: function (response) {
                    if (parentEl) parentEl.remove();
                }
            });
        } 
    });
};

const addEventEditItem = element => {
    element.addEventListener('click', ({ target }) => {
        //get data-*:
        const data = {
            id: target.getAttribute('data-trademark-id'),
            active: target.getAttribute('data-trademark-active'),
            name: target.getAttribute('data-trademark-name'),
            logo: target.getAttribute('data-trademark-logo'),
        }

        const formEditContainer = document.querySelector('.form-container');
        fillInFromWithData(formEditContainer, data);
    });
}

const fillInFromWithData = (container, {id, active, name, logo}) => {
    const nameEl = document.querySelector('input[name=name]');
    const logoEl = document.querySelector('input[name=logo]');
    const activeEls = document.querySelectorAll('input[name=active]');
    const saveEl = document.querySelector('#save');
    const cancelEl = document.querySelector('#cancel');
    const oldLogoEl = document.querySelector('img[name=old-logo]');

    //fill data:
    nameEl.value = name;
    oldLogoEl.src = `/uploads/${logo}`;
    activeEls.forEach(element => {
        if (parseInt(active) == parseInt(element.value)) {
            element.checked = true;
        }
        else element.checked = false;
    })


    //add events:
    saveEl.addEventListener('click', ({ target }) => {
        let formData = new FormData();
        let fileData = logoEl.files[0];

        // formData.append('id', id);
        // formData.append('name', nameEl.value);
        // formData.append('active', document.querySelector('input[name=active]:checked').value);

        let updateData = {
            id,
            name: nameEl.value,
            oldLogo : logo, 
            active: document.querySelector('input[name=active]:checked').value,
        }

        if (fileData) {
            formData.append('logo', fileData);
        }

        //add to from data
        $.each(updateData, function (indexInArray, valueOfElement) { 
            formData.append(indexInArray, valueOfElement);
        });

        //save :
        $.ajax({
            type: "POST",
            url: "trademark/update",
            data: formData,
            mimeType: "multipart/form-data",
            contentType: false,
            processData: false,
        })
            .done(res => {
                console.log(res);
            })
            .fail(error => {
                console.log(error);
            }) 
            .always(() => {
                container.classList.add('hide');
            })
    })

    cancelEl.addEventListener('click', ({ target }) => {
        container.classList.add('hide');
    })

    container.classList.remove('hide');
}