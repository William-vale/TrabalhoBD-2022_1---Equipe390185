function entrar() {
    let usuario = document.querySelector('#usuario')
    let userLabel = document.querySelector('#userLabel')

    let senha = document.querySelector('#senha');
    let senhaLabel = document.querySelector('#senhaLabel');

    let nivelAcesso = document.querySelector('#nivel-acesso');
    let nivelAcessoLabel = document.querySelector('#nivel-label');

    let msgError = document.querySelector('#msgError');
    let listaUser = [{"userCad":"admin","senhaCad":"root","nivelCad":"Administrador"},{"userCad":"biblio","senhaCad":"321654","nivelCad":"Bibliotecario"},{"userCad":"user","senhaCad":"123456","nivelCad":"Usuário"}];

    let userValid = {
        nome: '',
        user: '',
        acesso: ''
    }

    console.log(listaUser);
    
}