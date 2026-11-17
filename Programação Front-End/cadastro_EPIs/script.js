const CHAVE_STORAGE = 'epis';
const corpoTabela = document.getElementById('corpoTabela');
const formulario = document.getElementById('formulario');
const semRegistros = document.getElementById('semRegistros');
const btnApagarTodos = document.getElementById('btnApagarTodos');

let equipamentos = [];

function cadastrar(evento) {
    evento.preventDefault();

    const epi = {
        nome: formulario.querySelector('#nomeEpi').value.trim(),
        tipo: formulario.querySelector('#tipoProtecao').value.trim(),
        quantidade: formulario.querySelector('#quantidade').value,
        ca: formulario.querySelector('#numeroCA').value.trim()
    };

    if (!validarCampos(epi)) {
        return;
    }

    equipamentos.push(epi);
    salvarDados();
    atualizarTabela();
    limparFormulario();
    Swal.fire({
        icon: 'success',
        title: 'Cadastrado!',
        text: 'EPI adicionado com sucesso.'
    });
}

function validarCampos(epi) {
    if (!epi.nome || !epi.tipo || !epi.quantidade || !epi.ca) {
        Swal.fire({
            icon: 'warning',
            title: 'Campos obrigatórios',
            text: 'Preencha todos os campos antes de cadastrar.'
        });
        return false;
    }

    return true;
}

function atualizarTabela() {
    corpoTabela.innerHTML = '';

    equipamentos.forEach((epi, indice) => {
        const linha = document.createElement('tr');
        linha.innerHTML = `
            <td>${epi.nome}</td>
            <td>${epi.tipo}</td>
            <td>${epi.quantidade}</td>
            <td>${epi.ca}</td>
            <td>
                <button class="btn btn-outline-danger btn-sm" data-indice="${indice}">Excluir</button>
            </td>
        `;

        linha.querySelector('button').addEventListener('click', () => excluir(indice));
        corpoTabela.appendChild(linha);
    });

    semRegistros.style.display = equipamentos.length === 0 ? 'block' : 'none';
}

function salvarDados() {
    localStorage.setItem(CHAVE_STORAGE, JSON.stringify(equipamentos));
}

function carregarDados() {
    const dados = localStorage.getItem(CHAVE_STORAGE);

    if (dados) {
        equipamentos = JSON.parse(dados);
    }

    atualizarTabela();
}

function limparFormulario() {
    formulario.reset();
}

function excluir(indice) {
    Swal.fire({
        title: 'Excluir equipamento?',
        text: 'Esta ação não poderá ser desfeita.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Sim, excluir'
    }).then((resultado) => {
        if (resultado.isConfirmed) {
            equipamentos.splice(indice, 1);
            salvarDados();
            atualizarTabela();
            Swal.fire('Excluído!', 'O equipamento foi removido.', 'success');
        }
    });
}

function apagarTodos() {
    if (equipamentos.length === 0) {
        Swal.fire({
            icon: 'info',
            title: 'Nada para apagar',
            text: 'Não há equipamentos cadastrados.'
        });
        return;
    }

    Swal.fire({
        title: 'Apagar todos?',
        text: 'Todos os equipamentos serão removidos.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#dc3545',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Sim, apagar tudo'
    }).then((resultado) => {
        if (resultado.isConfirmed) {
            equipamentos = [];
            salvarDados();
            atualizarTabela();
            Swal.fire('Apagado!', 'Todos os equipamentos foram removidos.', 'success');
        }
    });
}

formulario.addEventListener('submit', cadastrar);
btnApagarTodos.addEventListener('click', apagarTodos);
carregarDados();