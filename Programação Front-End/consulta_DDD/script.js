const formulario = document.getElementById("formulario");
const campoDdd = document.getElementById("ddd");
const mensagem = document.getElementById("mensagem");
const resultado = document.getElementById("resultado");
const tabelaCidades = document.getElementById("tabelaCidades");
const botao = document.getElementById("botao");

formulario.addEventListener("submit", consultarDdd);

async function consultarDdd(evento) {

    evento.preventDefault();

    // Limpa os dados anteriores
    mensagem.textContent = "";
    tabelaCidades.innerHTML = "";
    resultado.style.display = "none";

    // Remove tudo que não for número
    const ddd = campoDdd.value.replace(/\D/g, "");

    // Verifica se possui exatamente 2 números
    if (ddd.length !== 2) {
        mensagem.textContent = "Digite um DDD com 2 números.";
        return;
    }

    const url = `https://brasilapi.com.br/api/ddd/v1/${ddd}`;

    try {

        botao.disabled = true;
        mensagem.textContent = "Consultando DDD...";

        // Faz a requisição
        const resposta = await fetch(url);

        // Verifica se a resposta foi bem-sucedida
        if (!resposta.ok) {
            throw new Error("DDD não encontrado.");
        }

        // Converte a resposta para JSON
        const dados = await resposta.json();

        // Percorre todas as cidades
        dados.cities.forEach(function(cidade) {

            const linha = document.createElement("tr");

            const colunaEstado = document.createElement("td");
            colunaEstado.textContent = dados.state;

            const colunaCidade = document.createElement("td");
            colunaCidade.textContent = cidade;

            linha.appendChild(colunaEstado);
            linha.appendChild(colunaCidade);

            tabelaCidades.appendChild(linha);
        });

        resultado.style.display = "block";
        mensagem.textContent = "Cidades encontradas!";

    } catch (erro) {

        mensagem.textContent = "DDD inválido ou não encontrado.";

        console.error(erro);

    } finally {

        botao.disabled = false;

    }
}

// Permite somente números no campo
campoDdd.addEventListener("input", function() {
    this.value = this.value.replace(/\D/g, "").slice(0, 2);
});