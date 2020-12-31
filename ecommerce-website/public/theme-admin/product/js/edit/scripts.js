document.addEventListener('DOMContentLoaded', () => {

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
        }
    });

    const imageRemoveEls = document.querySelectorAll('.fas.fa-minus-circle');

    setEventRemoveImage(imageRemoveEls);
});

const setEventRemoveImage = items => {
    if (items) {
        items.forEach(item => {
            item.addEventListener('click', ({ target }) => {
                const imgId = target.getAttribute('data-imgid');

                $.ajax({
                    type: "POST",
                    url: `http://127.0.0.1:8000/admin/product/remove-product-images`,
                    data: {
                        imgId,
                    },
                    dataType: "json",
                    success: function (response) {
                        _1item = target.parentElement;
                        _1item.remove();
                    }
                    
                })
            });
        });
    }
}