const codigo = document.getElementById("codigo");
const btnConsultar = document.getElementById("btnConsultar");
const mensagem = document.getElementById("mensagem");
const resultado = document.getElementById("resultado");

btnConsultar.addEventListener("click", consultar);

async function consultar() {

    const id = codigo.value;

    // Validação
    if (!id) {
        mensagem.textContent = "Informe o código do usuário.";
        resultado.innerHTML = "";
        return;
    }

    // Mensagem de carregamento
    mensagem.textContent = "Carregando...";
    resultado.innerHTML = "";

    try {

        const url = `https://jsonplaceholder.typicode.com/users/${id}`;
        const resposta = await fetch(url);

        // Verifica se o usuário existe
        if (!resposta.ok) {
            mensagem.textContent = "Usuário não encontrado.";
            return;
        }

        // Converte a resposta para JSON
        const usuario = await resposta.json();

        // Exibe os dados
        mensagem.textContent = "";

        resultado.innerHTML = `
            <div class="usuario">
                <h2>${usuario.name}</h2>

                <p>
                    <strong>E-mail:</strong>
                    ${usuario.email}
                </p>

                <p>
                    <strong>Telefone:</strong>
                    ${usuario.phone}
                </p>

                <p>
                    <strong>Cidade:</strong>
                    ${usuario.address.city}
                </p>

                <p>
                    <strong>Empresa:</strong>
                    ${usuario.company.name}
                </p>
            </div>
        `;

    } catch (erro) {

        mensagem.textContent = "Não foi possível conectar à API.";
        resultado.innerHTML = "";

    }
}