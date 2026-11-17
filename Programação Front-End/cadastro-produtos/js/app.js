/* ============================================================
   app.js
   Responsabilidade: COORDENADOR DA APLICAÇÃO.

   Este é o "maestro" do projeto. Ele não faz cálculos e não
   formata valores sozinho — ele apenas ORQUESTRA:

     1. Captura os elementos do DOM (o HTML)
     2. Recebe os dados digitados pelo usuário
     3. Chama as funções dos outros módulos (produtos.js e
        formatacao.js) para fazer o trabalho pesado
     4. Atualiza a interface com o resultado

   Repare que a REGRA DE OURO deste desafio é: o cálculo NUNCA
   deve ficar diretamente aqui dentro. Ele sempre vem de
   produtos.js. Este arquivo só "pede" o resultado pronto.
============================================================ */

// -----------------------------------------------------------
// 1) IMPORTANDO OS MÓDULOS
//    O caminho começa com "./" porque é relativo a este
//    próprio arquivo (js/app.js -> js/produtos.js).
// -----------------------------------------------------------
import { calcularTotal, calcularDesconto } from "./produtos.js";
import { formatarMoeda, formatarNomeProduto } from "./formatacao.js";

// -----------------------------------------------------------
// 2) CAPTURANDO OS ELEMENTOS DO DOM
//    Guardamos em variáveis para não precisar buscar no HTML
//    toda vez que formos usá-los.
// -----------------------------------------------------------
const inputNome = document.getElementById("nomeProduto");
const inputPreco = document.getElementById("precoProduto");
const inputQuantidade = document.getElementById("quantidadeProduto");
const botaoCalcular = document.getElementById("btnCalcular");

const secaoResultado = document.getElementById("resultado");
const resultadoNome = document.getElementById("resultadoNome");
const resultadoQuantidade = document.getElementById("resultadoQuantidade");
const resultadoTotal = document.getElementById("resultadoTotal");

// -----------------------------------------------------------
// 3) FUNÇÃO PRINCIPAL: executada quando o usuário clica em
//    "Calcular". É aqui que a orquestração acontece.
// -----------------------------------------------------------
function aoClicarEmCalcular() {
  // 3.1) Recebe os dados digitados pelo usuário (ainda como texto)
  const nomeDigitado = inputNome.value;
  const precoDigitado = inputPreco.value;
  const quantidadeDigitada = inputQuantidade.value;

  // 3.2) Validação simples: garante que os campos foram preenchidos
  if (!nomeDigitado || !precoDigitado || !quantidadeDigitada) {
    alert("Por favor, preencha todos os campos antes de calcular.");
    return; // interrompe a função aqui
  }

  // 3.3) Converte texto (string) para número, pois inputs sempre
  //      retornam string, mesmo quando type="number"
  const preco = Number(precoDigitado);
  const quantidade = Number(quantidadeDigitada);

  // 3.4) Chama a função de LÓGICA DE NEGÓCIO (produtos.js).
  //      Note que app.js não sabe COMO o total é calculado,
  //      apenas que existe uma função pronta para isso.
  const total = calcularTotal(preco, quantidade);

  // 3.5) Chama as funções de FORMATAÇÃO (formatacao.js) para
  //      deixar os dados prontos para exibição.
  const nomeFormatado = formatarNomeProduto(nomeDigitado);
  const totalFormatado = formatarMoeda(total);

  // 3.6) Atualiza a interface (DOM) com o resultado
  resultadoNome.textContent = nomeFormatado;
  resultadoQuantidade.textContent = quantidade;
  resultadoTotal.textContent = totalFormatado;

  // 3.7) Remove a classe que esconde a área de resultado
  secaoResultado.classList.remove("escondido");

  // 3.8) (Desafio Extra) Exemplo de uso da função de desconto.
  //      Descomente as linhas abaixo para exibir um desconto
  //      fixo de 10% sobre o total, como no slide "Desafio Extra".
  //
  // const desconto = calcularDesconto(total, 10);
  // const totalComDesconto = total - desconto;
  // console.log("Desconto:", formatarMoeda(desconto));
  // console.log("Total com desconto:", formatarMoeda(totalComDesconto));
}

// -----------------------------------------------------------
// 4) "OUVINTE" DE EVENTO
//    Registra a função acima para ser executada sempre que o
//    botão "Calcular" for clicado.
// -----------------------------------------------------------
botaoCalcular.addEventListener("click", aoClicarEmCalcular);