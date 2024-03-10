const list = document.querySelectorAll('.list');
function activeLink() {
    list.forEach((item) =>
    item.classList.remove('active_header'));
    this.classList.add('active_header');
}

list.forEach((item) =>
    item.addEventListener('click', activeLink));