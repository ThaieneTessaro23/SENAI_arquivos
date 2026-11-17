const formulario = document.getElementById("formulario");
const campoCep = document.getElementById("cep");
const mensagem = document.getElementById("mensagem");
const resultado = document.getElementById("resultado");
const botao = document.getElementById("botao");

formulario.addEventListener("submit", consultarCep);

async function consultarCep(evento) {
    evento.preventDefault();

    // Limpa o resultado anterior
    resultado.hidden = true;
    mensagem.textContent = "";

    // Remove tudo que não for número
    const cep = campoCep.value.replace(/\D/g, "");

    // Valida se o CEP possui exatamente 8 números
    if (cep.length !== 8) {
        mensagem.textContent = "Digite um CEP com 8 números.";
        return;
    }

    const url = `https://viacep.com.br/ws/${cep}/json/`;

    try {
        // Desabilita o botão durante a consulta
        botao.disabled = true;
        mensagem.textContent = "Consultando CEP...";

        // Faz a requisição
        const resposta = await fetch(url);

        // Verifica se a resposta HTTP foi bem-sucedida
        if (!resposta.ok) {
            throw new Error("Erro na requisição.");
        }

        // Converte a resposta para JSON
        const endereco = await resposta.json();

        // Verifica se o CEP foi encontrado
        if (endereco.erro) {
            mensagem.textContent = "CEP não encontrado.";
            return;
        }

        // Exibe os dados do endereço
        document.getElementById("logradouro").textContent =
            endereco.logradouro || "Não informado";

        document.getElementById("bairro").textContent =
            endereco.bairro || "Não informado";

        document.getElementById("cidade").textContent =
            endereco.localidade || "Não informado";

        document.getElementById("estado").textContent =
            endereco.uf || "Não informado";

        resultado.hidden = false;
        mensagem.textContent = "Endereço encontrado!";

    } catch (erro) {
        mensagem.textContent =
            "Ocorreu um erro ao consultar o CEP. Tente novamente.";

        console.error(erro);

    } finally {
        botao.disabled = false;
    }
}

// Permite digitar o CEP no formato 00000-000
campoCep.addEventListener("input", function () {
    let cep = this.value.replace(/\D/g, "").slice(0, 8);

    if (cep.length > 5) {
        cep = cep.slice(0, 5) + "-" + cep.slice(5);
    }

    this.value = cep;
});