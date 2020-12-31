document.addEventListener('DOMContentLoaded', () => {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': document.querySelector('._token').getAttribute('content'),
        }
    });
    const headerEl = document.querySelector('.header.slider');
    headerEl.classList.add('hide');
    
});