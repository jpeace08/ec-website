document.addEventListener('DOMContentLoaded', () => {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': document.querySelector('._token').getAttribute('content'),
        }
    });

    const _items = document.querySelectorAll('.product-item');

    
    //set up remove 1 item:
    _items.forEach(item => {
        var rmItem = item.querySelector('.rmItem');
        if (rmItem) {
            rmItem.addEventListener('click', ({target}) => {
                removeOneItem(item, target.getAttribute('data-product-id'));
            })
        }
    });

    //set up change quantity one product:
    const plusEls = document.querySelectorAll('span.fas.fa-plus');
    const minusEls = document.querySelectorAll('span.fas.fa-minus');
    const quantityEl = document.querySelector('span.quantity');
    const countEl = document.getElementById('total-count');
    const moneyEl = document.getElementById('total-money');
    const checkoutEl = document.getElementById('checkout');
    const nameEL = document.querySelector('input[name="name"]');
    const phoneEl = document.querySelector('input[name="phone"]');
    const addressEl = document.querySelector('input[name="address"]');

    setEventChangeQuantity(plusEls, minusEls, quantityEl, countEl, moneyEl);

    
    //checkout:
    checkoutEl.addEventListener('click', e => {
        const order = {
            name: nameEL.value,
            phone: phoneEl.value,
            address: addressEl.value,
            quantity: quantityEl.textContent,
            totalMoney : moneyEl.textContent,
        }

        saveOrder(order);
    })

});

const saveOrder = order => {
    $.ajax({
        type: "POST",
        url: "/cart/save",
        data: {
            ...order
        },
        dataType: "json",
        success: function (response) {
            if (response.message) {
                // console.log(response);
                alert(response.message);
            }
        }
    });
}

const setEventChangeQuantity = (plusEls, minusEls, quantityEl, countEl, moneyEl) => {
    //plus:
    plusEls.forEach(plusEl => {
        plusEl.addEventListener('click', ({ target }) => {
            //limit 5:
            let number = target.parentElement.querySelector('span.quantity').textContent;
            if (parseInt(number) <= 5) {
                changeQuantity(quantityEl, countEl, moneyEl, target, 1);
            }
        });
    });

    //minus:
    minusEls.forEach(minusEl => {
        minusEl.addEventListener('click', ({ target }) => {
            //limit 1:
            let number = target.parentElement.querySelector('span.quantity').textContent;
            if (parseInt(number) > 1) {
                changeQuantity(quantityEl, countEl, moneyEl, target, 0);    
            }
        });
    });
}

const changeQuantity = (quantityEl, countEl, moneyEl , element, isPlus) => {

    //change on ui:
    var number = parseInt(quantityEl.textContent.trim())
    if (isPlus) quantityEl.textContent = number + 1;
    else quantityEl.textContent = number - 1;

    const id = element.getAttribute('data-product-id');
    $.ajax({
        type: "POST",
        url: "/cart/change-quantity",
        data: {
            isPlus, 
            id
        },
        dataType: "json",
        success: function ({ total_count, total_money}) {
            const countEl = document.getElementById('total-count');
            const moneyEl = document.getElementById('total-money');

            countEl.textContent = total_count;
            moneyEl.textContent = total_money;
        }
    });
}

const removeOneItem = (item, id) => {
    $.ajax({
        type: "GET",
        url: `/cart/remove/${id}`,
        success: function (res) {
            res = JSON.parse(res);
            item.remove();
            updateCartMeta(res);
        }
    });
}

const updateCartMeta = ({total_count, total_money}) => {
    const countEl = document.getElementById('total-count');
    const moneyEl = document.getElementById('total-money');

    countEl.textContent = total_count;
    moneyEl.textContent = total_money;
}