const opcoes = document.getElementsByClassName('open'),
    titulo = document.querySelectorAll('.titulo')

function toggleSkills() {
    let itemClass = this.parentNode.className

    for(i = 0; i < opcoes.length; i++){
        opcoes[i].className = 'opcoes close'
    }
    if (itemClass === 'opcoes close'){
        this.parentNode.className = 'opcoes open'
    }
}

titulo.forEach((el) =>{
    el.addEventListener('click', toggleSkills)
})