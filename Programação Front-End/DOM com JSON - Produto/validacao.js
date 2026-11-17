class Produto{
    constructor(nome, descricao, preco, qtd, data){
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.qtd = qtd;
        this.data = data;
    }
}

let produtos = [];

let form = document.querySelector("form");

form.addEventListener("submit", function(e){
    //Evitar que envie o form automaticamente
    e.preventDefault();

    let nome = document.getElementById("nome").value;
    let descricao = document.getElementById("descricao").value;
    let preco = document.getElementById("preco").value;
    let qtd = document.getElementById("qtd").value;
    let data = document.getElementById("data").value;

    if(nome == "" || descricao == "" || preco == "" || qtd == "" || data == ""){
        alert("Preencha todos os campos!");
        return;
    }

    //Cria um novo objeto da classe produto
    let produto = new Produto(nome, descricao, preco, qtd, data);

    //Insere o usuário no array de usuários
    produtos.push(produto);

    mostrarJSON();

    //limpa os campos do form
    form.reset();
});

function mostrarJSON(){
    //produtos -> array de usuários
    //null -> não tem filtros
    //2 -> número de indentações (tabs)
    let json = JSON.stringify(produtos, null, 2);

    document.getElementById("saida").textContent = json;
}