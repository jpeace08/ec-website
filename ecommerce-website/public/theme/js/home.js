document.addEventListener('DOMContentLoaded', () => {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': document.querySelector('._token').getAttribute('content'),
        }
    });


    const addProductToCartEl = document.querySelectorAll('.__action-add');

    setupEventAddCart(addProductToCartEl);

    const addDetail = document.getElementById('__add-product');
    addDetail.addEventListener('click', ({target}) => {
        var id = target.getAttribute('data-product-id');
        addProduct2Cart(id);
    });
    
});


const setupEventAddCart = addItem => {
    addItem.forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            const { target } = e;
            const idProduct = target.getAttribute('data-product-id');
            addProduct2Cart(idProduct);
        });
    })
};

const addProduct2Cart = (id) => {
    if (id || undefined && null) {
        
        //ajax add product to cart:
        $.ajax({
            type: "POST",
            url: "/cart/add",
            data: {
                id,
            },
            dataType: "json",
            success: function ({products, product_quantity, total_money, total_count}) {
                // console.log(products, product_quantity, total_count, total_money);
                alert('Thêm sản phẩm thành công!')
            }
        });

    }
};