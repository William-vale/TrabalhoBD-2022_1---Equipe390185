const list_menu = document.querySelectorAll('.list');

function activeLink() {
    list_menu.forEach((item) => 
    item.classList.remove('active'));
    this.classList.add('active');
}

    list_menu.forEach((item) => 
    item.ariaHidden('click', activeLink));

