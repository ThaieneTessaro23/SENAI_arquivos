// Seleção dos campos do formulário
const form = document.getElementById("formCadastro");

const campoNome = document.getElementById("nome");
const campoCpf = document.getElementById("cpf");
const campoTelefone = document.getElementById("telefone");
const campoEmail = document.getElementById("email");
const campoTipo = document.getElementById("tipo");
const campoPeriodo = document.getElementById("periodo");

// Seleção da tabela (Definida no topo para ficar acessível globalmente)
const tabela = document.getElementById("listaClientes");

const erroNome = document.getElementById("erroNome");
const erroCpf = document.getElementById("erroCpf");
const erroTelefone = document.getElementById("erroTelefone");
const erroEmail = document.getElementById("erroEmail");
const erroTipo = document.getElementById("erroTipo");
const erroPeriodo = document.getElementById("erroPeriodo");

// Máscaras
Inputmask("999.999.999-99").mask(campoCpf);
Inputmask("(99) 99999-9999").mask(campoTelefone);

// ===================================================
// NOVO - Carrega os clientes salvos no navegador
// ===================================================
let clientes = JSON.parse(localStorage.getItem("clientes")) || [];

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

// ===================================================
// NOVO - Atualiza a tabela utilizando os dados do array
// ===================================================
function atualizarTabela() {
  if (!tabela) return; // Trava de segurança caso o elemento não exista no HTML

  tabela.innerHTML = "";

  clientes.forEach(function (cliente) {
    tabela.innerHTML += `
      <tr>
        <td>${cliente.nome}</td>
        <td>${cliente.cpf}</td>
        <td>${cliente.telefone}</td>
        <td>${cliente.email}</td>
        <td>${cliente.tipo}</td>
        <td>${cliente.periodo}</td>
      </tr>
    `;
  });
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

  // ===================================================
  // NOVO - Cria um objeto com os dados do cliente
  // ===================================================
  const cliente = {
    nome: nome,
    cpf: cpf,
    telefone: telefone,
    email: email,
    tipo: campoTipo.options[campoTipo.selectedIndex].text,
    periodo: campoPeriodo.options[campoPeriodo.selectedIndex].text,
  };

  // ===================================================
  // NOVO - Adiciona o cliente ao array
  // ===================================================
  clientes.push(cliente);

  // ===================================================
  // NOVO - Salva o array no localStorage
  // ===================================================
  localStorage.setItem("clientes", JSON.stringify(clientes));

  // ===================================================
  // NOVO - Atualiza a tabela
  // ===================================================
  atualizarTabela();

  Swal.fire({
    icon: "success",
    title: "Cadastro realizado!",
    text: "Cliente cadastrado com sucesso.",
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

// ===================================================
// NOVO - Carrega os clientes ao abrir a página
// ===================================================
atualizarTabela();