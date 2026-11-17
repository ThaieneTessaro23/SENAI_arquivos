//Capturar o formulário
const form = document.getElementById("formCadastro");

//Capturar os inputs
const nomeInput = document.getElementById("nome");
const cpfInput = document.getElementById("cpf");
const telefoneInput = document.getElementById("telefone");

//Capturar as mensagens de erro (span)
const erroNome = document.getElementById("erroNome");
const erroCpf = document.getElementById("erroCpf");
const erroTelefone = document.getElementById("erroTelefone");

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
telefoneInput.addEventListener("input", function(){
    let telefone = telefoneInput.value.replace(/\D/g, "");

    if(telefone.length > 2 && telefone.length <= 7){
        telefone = "(" + telefone.slice(0,2) + ")" + telefone.slice(2);
    }
    else if(telefone.length > 7){
        telefone = "("  + telefone.slice(0,2) + ")" + telefone.slice(2,7) + "-" + telefone.slice(7,11);
    }

    telefoneInput.value = telefone;
});