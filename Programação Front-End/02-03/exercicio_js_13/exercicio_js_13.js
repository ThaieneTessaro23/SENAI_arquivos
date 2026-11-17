//Capturar o formulário
const form = document.getElementById("formCadastro");

//Capturar os inputs
const nomeInput = document.getElementById("nome");
const codigoInput = document.getElementById("codigo");
const setorInput = document.getElementById("setor");
const serieInput = document.getElementById("serie");
const fornecedorInput = document.getElementById("fornecedor");
const precoInput = document.getElementById("preco");
const dataInput = document.getElementById("data");
const telInput = document.getElementById("tel");
const cnpjInput = document.getElementById("cnpj");

//Capturar as mensagens de erro (span)
const erroNome = document.getElementById("erroNome");
const erroCodigo = document.getElementById("erroCodigo");
const erroSetor = document.getElementById("erroSetor");
const erroSerie = document.getElementById("erroSerie");
const erroFornecedor = document.getElementById("erroFornecedor");
const erroPreco = document.getElementById("erroPreco");
const erroData = document.getElementById("erroData");
const erroTel = document.getElementById("erroTel");
const erroCNPJ = document.getElementById("erroCNPJ");


//Máscara de cnpj
//Evento disparado ("escupa") sempre que o usuário digitar no campo cnpj
cnpjInput.addEventListener("input", function(){
    //Remover tudo que não for número
    let cnpj = cnpjInput.value.replace(/\D/g, "");

    //Aplicar a máscara conforme o tamanho 00.000.000/0000-00
    if(cnpj.length > 2 && cnpj.length <= 5){
        cnpj = cnpj.slice(0,2) + "." + cnpj.slice(2);
    }
    else if(cnpj.length > 5 && cnpj.length <= 8){
        cnpj = cnpj.slice(0,2) + "." + cnpj.slice(2,5) + "." + cnpj.slice(5);
    }
    else if(cnpj.length > 8 && cnpj.length <= 12){
        cnpj = cnpj.slice(0,2) + "." + cnpj.slice(2,5) + "." + cnpj.slice(5,8) + "/" + cnpj.slice(8,12);
    }
    else if(cnpj.length > 12){
        cnpj = cnpj.slice(0,2) + "." + cnpj.slice(2,5) + "." + cnpj.slice(5,8) + "/" + cnpj.slice(8,12) + "-" + cnpj.slice(12,14);
    }

    //Atualizar o valor do input
    cnpjInput.value = cnpj;
});

//Máscara do telefone
telInput.addEventListener("input", function(){
    let telefone = telInput.value.replace(/\D/g, "");

    if(telefone.length > 2 && telefone.length <= 7){
        telefone = "(" + telefone.slice(0,2) + ")" + telefone.slice(2);
    }
    else if(telefone.length > 7){
        telefone = "("  + telefone.slice(0,2) + ")" + telefone.slice(2,7) + "-" + telefone.slice(7,11);
    }

    telInput.value = telefone;
});

//Validação do formulário enviado pelo usuário
//Evento que vai ser disparado toda vez que clicar no botão submit
form.addEventListener("submit", function(event){
    //Impede que o formulário envie sem a validação
    event.preventDefault();

    //Variável para controlar se o form foi validado
    let formValidado = true;

    //VALIDAÇÕES =====================================

    //Validação do NOME-----------------
    if(nomeInput.value.trim() === ""){
        erroNome.innerText = "O nome é obrigatório!";
        nomeInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroNome.innerText = "";
        nomeInput.style.border = "2px solid green";
    }

    //Validação do CÓDIGO-----------------
    if(codigoInput.value.trim() === ""){
        erroCodigo.innerText = "O nome é obrigatório!";
        codigoInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroCodigo.innerText = "";
        codigoInput.style.border = "2px solid green";
    }

    //Validação do SETOR ------------
    if(setorInput.value === ""){
        erroSetor.innerText = "O setor é obrigatório!";
        setorInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroSetor.innerText = "";
        setorInput.style.border = "2px solid green";
    }

    //Validação da SERIE-----------------
    if(serieInput.value.trim() === ""){
        erroSerie.innerText = "O nome é obrigatório!";
        serieInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroSerie.innerText = "";
        serieInput.style.border = "2px solid green";
    }

    //Validação do FORNECEDOR-----------------
    if(fornecedorInput.value.trim() === ""){
        erroFornecedor.innerText = "O nome é obrigatório!";
        fornecedorInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroFornecedor.innerText = "";
        fornecedorInput.style.border = "2px solid green";
    }

    //Validação do PRECO-----------------
    if(precoInput.value.trim() === ""){
        erroPreco.innerText = "O nome é obrigatório!";
        precoInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroPreco.innerText = "";
        precoInput.style.border = "2px solid green";
    }

    //Validação da DATA DE FABRICAÇÃO--
    if(dataInput.value.trim() === ""){
        erroData.innerText = "A data é obrigatório!";
        dataInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroData.innerText = "";
        dataInput.style.border = "2px solid green";
    }

    //Validação do TELEFONE-------------
    if(telInput.value.replace(/\D/g, "").length !== 11){
        erroTel.innerText = "Telefone inválido!";
        telInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroTel.innerText = "";
        telInput.style.border = "2px solid green";
    }

    //Validação do CNPJ------------------
    console.log(cnpjInput.value.replace(/\D/g, "").length);
    if(cnpjInput.value.replace(/\D/g, "").length !== 14){
        erroCNPJ.innerText = "CNPJ inválido!";
        cnpjInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroCNPJ.innerText = "";
        cnpjInput.style.border = "2px solid green";
    }




    if(formValidado === true){
        alert("Dados cadastrados com sucesso! 🟢");
        window.location.reload(true);
    }
    else{
        alert("Erro ao cadastrar! Verifique os campos e tente novamente ❌");
    }
});