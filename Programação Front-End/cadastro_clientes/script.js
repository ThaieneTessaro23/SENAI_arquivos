// Seleção dos campos
const form = document.getElementById("formCadastro");

const campoNome = document.getElementById("nome");
const campoCpf = document.getElementById("cpf");
const campoTelefone = document.getElementById("telefone");
const campoEmail = document.getElementById("email");
const campoTipo = document.getElementById("tipo");
const campoPeriodo = document.getElementById("periodo");

const erroNome = document.getElementById("erroNome");
const erroCpf = document.getElementById("erroCpf");
const erroTelefone = document.getElementById("erroTelefone");
const erroEmail = document.getElementById("erroEmail");
const erroTipo = document.getElementById("erroTipo");
const erroPeriodo = document.getElementById("erroPeriodo");

const cpf = document.getElementById("cpf");
const telefone = document.getElementById("telefone");

Inputmask("999.999.999-99").mask(cpf);
Inputmask("(99) 99999-9999").mask(telefone);

// Mostrar erro
function mostrarErro(campo, erro, mensagem) {
    campo.classList.add("invalido");
    erro.textContent = mensagem;
}

// Remover erro
function removerErro(campo, erro) {
    campo.classList.remove("invalido");
    erro.textContent = "";
}

// Validação
function validarCadastro() {

    const nome = campoNome.value.trim();
    const cpf = campoCpf.value.trim();
    const telefone = campoTelefone.value.trim();
    const email = campoEmail.value.trim();
    const tipo = campoTipo.value;
    const periodo = campoPeriodo.value;

    if (!nome) {
        mostrarErro(campoNome, erroNome, "O nome é obrigatório.");
        return;
    }

    if (!cpf) {
        mostrarErro(campoCpf, erroCpf, "O CPF é obrigatório.");
        return;
    }

    if (!telefone) {
        mostrarErro(campoTelefone, erroTelefone, "O telefone é obrigatório.");
        return;
    }

    if (!email) {
        mostrarErro(campoEmail, erroEmail, "O e-mail é obrigatório.");
        return;
    }

    if (!tipo) {
        mostrarErro(campoTipo, erroTipo, "Selecione o tipo de cliente.");
        return;
    }

    if (!periodo) {
        mostrarErro(campoPeriodo, erroPeriodo, "Selecione um período.");
        return;
    }

    // Adiciona na tabela
    const tabela = document.getElementById("listaClientes");

    tabela.innerHTML += `
        <tr>
            <td>${nome}</td>
            <td>${cpf}</td>
            <td>${telefone}</td>
            <td>${email}</td>
            <td>${tipo}</td>
            <td>${periodo}</td>
        </tr>
    `;

    Swal.fire({
        icon: "success",
        title: "Cadastro realizado!",
        text: "Cliente cadastrado com sucesso."
    });

    form.reset();
}

// Impede o envio do formulário
form.addEventListener("submit", function (event) {
    event.preventDefault();
    validarCadastro();
});

// Remove os erros quando o usuário corrige o campo
campoNome.addEventListener("input", () => removerErro(campoNome, erroNome));
campoCpf.addEventListener("input", () => removerErro(campoCpf, erroCpf));
campoTelefone.addEventListener("input", () => removerErro(campoTelefone, erroTelefone));
campoEmail.addEventListener("input", () => removerErro(campoEmail, erroEmail));
campoTipo.addEventListener("change", () => removerErro(campoTipo, erroTipo));
campoPeriodo.addEventListener("change", () => removerErro(campoPeriodo, erroPeriodo));