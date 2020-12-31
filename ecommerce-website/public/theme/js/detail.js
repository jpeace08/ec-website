document.addEventListener('DOMContentLoaded', () => {

    const headerEl = document.querySelector('.header.slider');
    headerEl.classList.add('hide');

    var blackTriangles = document.querySelectorAll('.ck.ck-reset_all.ck-widget__type-around');
    blackTriangles.forEach(item => {
        item.remove();
    });

    // owl-carousel home
    const owl = $('.home-owl');
    owl.owlCarousel({
        animateOut: 'slideOutDown',
        animateIn: 'flipInX',
        items: 3,
        loop: true,
        margin: 10,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true
    });

    

});