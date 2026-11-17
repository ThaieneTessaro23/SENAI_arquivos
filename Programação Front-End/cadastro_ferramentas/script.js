/* ===========================
SELEÇÃO DOS CAMPOS
=========================== */
const form = document.getElementById("formFerramenta");

const campoFerramenta = document.getElementById("ferramenta");
const campoSetor = document.getElementById("setor");
const campoQuantidade = document.getElementById("quantidade");

const erroFerramenta = document.getElementById("erroFerramenta");
const erroSetor = document.getElementById("erroSetor");
const erroQuantidade = document.getElementById("erroQuantidade");

const listaFerramentas = document.getElementById("listaFerramentas");
const mensagemVazia = document.getElementById("mensagemVazia");

const btnSalvar = document.getElementById("btnSalvar");
const btnCancelar = document.getElementById("btnCancelar");
const btnLimparTudo = document.getElementById("btnLimparTudo");

/* ===========================
CARREGA OS DADOS SALVOS
NO LOCALSTORAGE
=========================== */

let ferramentas = JSON.parse(localStorage.getItem("ferramentas")) || [];

/* ===========================
CONTROLE DE EDIÇÃO
=========================== */

let indiceEdicao = null;

/* ===========================
SALVA OS DADOS NO LOCALSTORAGE
=========================== */

function salvarLocalStorage() {
localStorage.setItem("ferramentas", JSON.stringify(ferramentas));
}

/* ===========================
LIMPA AS MENSAGENS DE ERRO
=========================== */

function limparErros() {
erroFerramenta.textContent = "";
erroSetor.textContent = "";
erroQuantidade.textContent = "";

campoFerramenta.classList.remove("is-invalid");
campoSetor.classList.remove("is-invalid");
campoQuantidade.classList.remove("is-invalid");

}

/* ===========================
VALIDAÇÃO DO FORMULÁRIO
=========================== */

function validarFormulario() {
limparErros();

const ferramenta = campoFerramenta.value.trim();
const setor = campoSetor.value.trim();
const quantidade = campoQuantidade.value.trim();

let formularioValido = true;

if (!ferramenta) {
    erroFerramenta.textContent = "Informe o nome da ferramenta.";
    campoFerramenta.classList.add("is-invalid");
    formularioValido = false;
}

if (!setor) {
    erroSetor.textContent = "Informe o setor responsável.";
    campoSetor.classList.add("is-invalid");
    formularioValido = false;
}

if (!quantidade) {
    erroQuantidade.textContent = "Informe a quantidade disponível.";
    campoQuantidade.classList.add("is-invalid");
    formularioValido = false;
} else if (Number(quantidade) <= 0) {
    erroQuantidade.textContent = "A quantidade deve ser maior que zero.";
    campoQuantidade.classList.add("is-invalid");
    formularioValido = false;
}

return formularioValido;

}

/* ===========================
ATUALIZA A TABELA
=========================== */

function atualizarTabela() {
listaFerramentas.innerHTML = "";

if (ferramentas.length === 0) {
    mensagemVazia.style.display = "block";
    return;
}

mensagemVazia.style.display = "none";

ferramentas.forEach(function(ferramenta, indice) {

    const linha = document.createElement("tr");

    linha.innerHTML = `
        <td>${indice + 1}</td>
        <td>${ferramenta.nome}</td>
        <td>${ferramenta.setor}</td>
        <td>${ferramenta.quantidade}</td>
        <td>
            <div class="acoes">
                <button type="button" class="btn btn-sm btn-editar" onclick="editarFerramenta(${indice})">
                    Editar
                </button>
                <button type="button" class="btn btn-sm btn-excluir" onclick="excluirFerramenta(${indice})">
                    Excluir
                </button>
            </div>
        </td>
    `;

    listaFerramentas.appendChild(linha);
});

}

/* ===========================
CADASTRAR OU EDITAR
=========================== */

form.addEventListener("submit", function(event) {

event.preventDefault();

if (!validarFormulario()) {
    return;
}

const ferramenta = {
    nome: campoFerramenta.value.trim(),
    setor: campoSetor.value.trim(),
    quantidade: Number(campoQuantidade.value)
};

/* ===========================
   MODO DE EDIÇÃO
=========================== */

if (indiceEdicao !== null) {

    ferramentas[indiceEdicao] = ferramenta;

    Swal.fire({
        icon: "success",
        title: "Ferramenta atualizada!",
        text: "Os dados foram alterados com sucesso.",
        confirmButtonText: "OK"
    });

    indiceEdicao = null;
    btnSalvar.textContent = "Cadastrar ferramenta";
    btnCancelar.classList.add("d-none");

} else {

    /* ===========================
       MODO DE CADASTRO
    =========================== */

    ferramentas.push(ferramenta);

    Swal.fire({
        icon: "success",
        title: "Cadastro realizado!",
        text: "A ferramenta foi cadastrada com sucesso.",
        confirmButtonText: "OK"
    });
}

/* ===========================
   SALVA E ATUALIZA A TABELA
=========================== */

salvarLocalStorage();
atualizarTabela();

form.reset();

});

/* ===========================
EDITAR FERRAMENTA
=========================== */

function editarFerramenta(indice) {

const ferramenta = ferramentas[indice];

campoFerramenta.value = ferramenta.nome;
campoSetor.value = ferramenta.setor;
campoQuantidade.value = ferramenta.quantidade;

indiceEdicao = indice;

btnSalvar.textContent = "Salvar alterações";
btnCancelar.classList.remove("d-none");

window.scrollTo({
    top: 0,
    behavior: "smooth"
});

}

/* ===========================
CANCELAR EDIÇÃO
=========================== */

btnCancelar.addEventListener("click", function() {

indiceEdicao = null;

form.reset();

limparErros();

btnSalvar.textContent = "Cadastrar ferramenta";

btnCancelar.classList.add("d-none");

});

/* ===========================
EXCLUIR UMA FERRAMENTA
=========================== */

function excluirFerramenta(indice) {

const ferramenta = ferramentas[indice];

Swal.fire({
    icon: "warning",
    title: "Excluir ferramenta?",
    text: `Deseja excluir "${ferramenta.nome}"?`,
    showCancelButton: true,
    confirmButtonText: "Sim, excluir",
    cancelButtonText: "Cancelar",
    confirmButtonColor: "#dc3545"
}).then(function(resultado) {

    if (resultado.isConfirmed) {

        ferramentas.splice(indice, 1);

        salvarLocalStorage();

        atualizarTabela();

        Swal.fire({
            icon: "success",
            title: "Excluída!",
            text: "A ferramenta foi removida.",
            confirmButtonText: "OK"
        });
    }
});

}

/* ===========================
LIMPAR TODOS OS CADASTROS
=========================== */

btnLimparTudo.addEventListener("click", function() {

if (ferramentas.length === 0) {

    Swal.fire({
        icon: "info",
        title: "Nenhum cadastro",
        text: "Não existem ferramentas cadastradas."
    });

    return;
}

Swal.fire({
    icon: "warning",
    title: "Limpar todos os cadastros?",
    text: "Todos os registros serão removidos.",
    showCancelButton: true,
    confirmButtonText: "Sim, limpar tudo",
    cancelButtonText: "Cancelar",
    confirmButtonColor: "#dc3545"
}).then(function(resultado) {

    if (resultado.isConfirmed) {

        ferramentas = [];

        salvarLocalStorage();

        atualizarTabela();

        Swal.fire({
            icon: "success",
            title: "Cadastros removidos!",
            text: "Todos os registros foram excluídos."
        });
    }
});

});

/* ===========================
REMOVE OS ERROS AO DIGITAR
=========================== */

campoFerramenta.addEventListener("input", function() {
campoFerramenta.classList.remove("is-invalid");
erroFerramenta.textContent = "";
});

campoSetor.addEventListener("input", function() {
campoSetor.classList.remove("is-invalid");
erroSetor.textContent = "";
});

campoQuantidade.addEventListener("input", function() {
campoQuantidade.classList.remove("is-invalid");
erroQuantidade.textContent = "";
});

/* ===========================
CARREGA A TABELA AO ABRIR
=========================== */

atualizarTabela();
