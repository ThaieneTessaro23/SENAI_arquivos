class Usuario{
    constructor(nome, email){
        this.nome = nome;
        this.email = email;
    }
}

let usuarios = [];

let form = document.querySelector("form");

form.addEventListener("submit", function(e){
    //Evitar que envie o form automaticamente
    e.preventDefault();

    let nome = document.getElementById("nome").value;
    let email = document.getElementById("email").value;

    if(nome == "" || email == ""){
        alert("Preencha todos os campos!");
        return;
    }

    //Cria um novo objeto da classe Usuario
    let usuario = new Usuario(nome, email);

    //Insere o usuário no array de usuários
    usuarios.push(usuario);

    mostrarJSON();

    //limpa os campos do form
    form.reset();
});

function mostrarJSON(){
    //Usuarios -> array de usuários
    //null -> não tem filtros
    //2 -> número de indentações (tabs)
    let json = JSON.stringify(usuarios, null, 2);

    document.getElementById("saida").textContent = json;
}