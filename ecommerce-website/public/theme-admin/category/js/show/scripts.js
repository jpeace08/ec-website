document.addEventListener('DOMContentLoaded', e => {
    
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
        }
    });
    mainFunc();    

});

const mainFunc = () => {
    let statusEls = document.querySelectorAll('span[data-category-active]');
    let editEls = document.querySelectorAll('[name=edit]');
    let removeEls = document.querySelectorAll('[name=remove]');

    if (editEls && editEls.length > 0) {

        editEls.forEach(element => {
            element.addEventListener('click', e => {
                e.stopPropagation();
                const containerEl = document.querySelector('.form-container');
                const nameEl = document.querySelector('input[name=name]');
                const optionEls = document.querySelectorAll('_f');
                const parentEl = document.querySelector('select[name=parent_id]');
                const iconEl = document.querySelector('input[name=icon]');
                const activeEls = document.querySelectorAll('input[type=radio]');
                const btnEl = document.querySelector('[id=save]');

                const saveEl = document.querySelector('#save');
                const cancelEl = document.querySelector('#cancel');

                containerEl.classList.remove('hide');

                const categoryData = {
                    id: e.target.getAttribute('data-category-id'),
                    name: e.target.getAttribute('data-category-name'),
                    active: e.target.getAttribute('data-category-active'),
                    icon: e.target.getAttribute('data-category-icon'),
                    parentId: e.target.getAttribute('data-category-parent-id'),
                };


                containerEl.setAttribute('data-category-id', categoryData.id);
                nameEl.value = categoryData.name;
                iconEl.value = categoryData.icon;

                activeEls.forEach(item => {
                    var status = item.value;
                    if (parseInt(status) === parseInt(categoryData.active)) {
                        item.checked = true;
                    }
                });

                parentEl.value = `${categoryData.parentId}`;

                if (containerEl) {
                    saveEl.addEventListener('click', e => {
                        var parent_id = document.querySelector('select[name=parent_id]').value;
                        var dataUpdate = {
                            name: document.querySelector('input[name=name]').value,
                            parent_id: parent_id || 0,
                            icon: document.querySelector('input[name=icon]').value,
                            active: document.querySelector('input[name=active]:checked').value,
                        }
                        $.ajax({
                            type: "POST",
                            url: "category/update",
                            data: {
                                id: containerEl.getAttribute('data-category-id'),
                                updateData: {
                                    ...dataUpdate,
                                }
                            },
                            dataType: "json",
                            success: function (response) {
                                containerEl.classList.add('hide');
                                updateSingleElement(response);
                            }
                        })
                    });

                    cancelEl.addEventListener('click', e => {
                        containerEl.classList.add('hide');
                    });
                }

            });
        });

        if (removeEls && removeEls.length > 0) {
            removeEls.forEach(element => {
                element.addEventListener('click', e => {
                    e.stopPropagation();
                    const productId = e.target.getAttribute('data-category-id');
                    $.ajax({
                        type: "GET",
                        url: `category/remove/${productId}`,
                        success: function (response) {
                            e.target.parentElement.parentElement.remove();
                        }
                    });
                });
            });
        }


    }

    statusEls.forEach(element => {
        justDoIt(element);
    });

    statusEls.forEach(element => {
        element.addEventListener('click', e => {
            var categoryId = e.target.getAttribute('data-category-id');
            justDoIt(e.target);
            $.ajax({
                type: "POST",
                url: "category/active",
                data: {
                    _token: $('meta[name="_token"]').attr('content'),
                    id: categoryId,
                },
                dataType: "json",
                success: function (response) {
                    const activeRes = response.category.active ? 1 : 0;
                    element.setAttribute('data-category-active', activeRes);
                    element.parentElement.parentElement.querySelector('a[name=edit]').setAttribute('data-category-active', activeRes);
                    justDoIt(e.target)
                }
            });
        });
    })
}

const justDoIt = element => {
    element.classList = "badge";
    const state = parseInt(element.getAttribute('data-category-active'));
    if (state === 0) {
        element.textContent = 'Ẩn';
        element.classList.add('badge-warning');
    }
    else if (state === 1) {
        element.textContent = 'Hiển thị';
        element.classList.add('badge-success');
    }
}

const updateSingleElement = ({ category: { id, name, icon, active, slug, parent_id, created_at}}) => {
    const categoryEl = document.querySelector(`tr[data-category-id='${id}']`);
    const index = categoryEl.querySelector('th').textContent;
    created_at = new Date(created_at);
    categoryEl.innerHTML = '';

    const html = `<th scope="row">${index}</th>
                    <td>${name}</td>
                    <td>${created_at.getDate() + '-' + created_at.getMonth() + '-' + created_at.getYear() + ' ' + created_at.getHours() + ':' + created_at.getMinutes() + ':' + created_at.getSeconds()}
                    </td>
                    <td>
                        <span class="badge ${active ? 'badge-success' : 'badge-warning'}" data-category-active="${active}" data-category-id="${id}">${active ? 'Hiển thị':'Ẩn'}</span>
                    </td>
                    <td>
                        <a class="btn btn-outline-primary" name="edit" data-category-active="${active}" data-category-id="${id}" data-category-name="${name}" data-category-icon="${icon}" data-category-parent-id="${parent_id}">
                        <i class="far fa-edit"></i>
                        </a>&nbsp;

                        <a class="btn btn-outline-secondary" name="remove" data-category-id="${id}">
                        <i class="fas fa-trash-alt"></i>
                        </a>
                    </td>`;
    categoryEl.innerHTML = html;
    mainFunc();
}