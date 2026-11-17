//Capturar o formulário
const form = document.getElementById("formCadastro");

//Capturar os inputs
const nomeInput = document.getElementById("nome");
const emailInput = document.getElementById("email");
const cpfInput = document.getElementById("cpf");
const telInput = document.getElementById("tel");
const dataInput = document.getElementById("data");
const cargoInput = document.getElementById("cargo");
const setorInput = document.getElementById("setor");

//Capturar as mensagens de erro (span)
const erroNome = document.getElementById("erroNome");
const erroEmail = document.getElementById("erroEmail");
const erroCPF = document.getElementById("erroCPF");
const erroTel = document.getElementById("erroTel");
const erroData = document.getElementById("erroData");
const erroCargo = document.getElementById("erroCargo");
const erroSetor = document.getElementById("erroSetor");

//Máscara de CPF
//Evento disparado ("escupa") sempre que o usuário digitar no campo CPF
cpfInput.addEventListener("input", function(){
    //Remover tudo que não for número
    let cpf = cpfInput.value.replace(/\D/g, "");

    //Aplicar a máscara conforme o tamanho 000.000.000-00
    if(cpf.length > 3 && cpf.length <= 6){
        cpf = cpf.slice(0,3) + "." + cpf.slice(3);
    }
    else if(cpf.length > 6 && cpf.length <= 9){
        cpf = cpf.slice(0,3) + "." + cpf.slice(3,6) + "." + cpf.slice(6);
    }
    else if(cpf.length > 9){
        cpf = cpf.slice(0,3) + "." + cpf.slice(3,6) + "." + cpf.slice(6,9) + "-" + cpf.slice(9,11);
    }

    //Atualizar o valor do input
    cpfInput.value = cpf;
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

    //Validação do CPF-----------------
    if(cpfInput.value.replace(/\D/g, "").length !== 11){
        erroCPF.innerText = "CPF inválido!";
        cpfInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroCPF.innerText = "";
        cpfInput.style.border = "2px solid green";
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

    //Validação do EMAIL------------------
    if(emailInput.value.trim() === ""){
        erroEmail.innerText = "O e-mail é obrigatório!";
        emailInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroEmail.innerText = "";
        emailInput.style.border = "2px solid green";
    }

    //Validação da DATA DE NASCIMENTO--
    if(dataInput.value.trim() === ""){
        erroData.innerText = "A data é obrigatório!";
        dataInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroData.innerText = "";
        dataInput.style.border = "2px solid green";
    }

    //Validação do CARGO------------
    if(cargoInput.value.trim() === ""){
        erroCargo.innerText = "O cargo é obrigatório!";
        cargoInput.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroCargo.innerText = "";
        cargoInput.style.border = "2px solid green";
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




    if(formValidado === true){
        alert("Dados cadastrados com sucesso! 🟢");
        window.location.reload(true);
    }
    else{
        alert("Erro ao cadastrar! Verifique os campos e tente novamente ❌");
    }
});