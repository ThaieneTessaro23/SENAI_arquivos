PROJETO API — AMIGO DE QUATRO PATAS

Integrantes:
- Thaiene Tessaro
- Isabella Silva Fernandes Garcia
- Paula 
- Maria Clara
- Vinicius
- Vitor

API utilizada:
- The Dog API

Documentação / site:
https://www.thedogapi.com/

Endpoint(s) utilizados:
- https://api.thedogapi.com/v1/breeds/search?q=...
- https://api.thedogapi.com/v1/images/search?breed_ids=...&limit=1
- https://api.thedogapi.com/v1/images/search?has_breeds=true&limit=1

Descrição da aplicação:
A aplicação “Amigo de Quatro Patas” permite pesquisar uma raça de cachorro
e apresentar informações úteis de forma visual, incluindo nome, origem,
temperamento, expectativa de vida, peso, altura e uma fotografia.
Também existe uma função extra para sortear um cão aleatório.

Tecnologias:
- HTML
- CSS
- JavaScript
- fetch()
- async/await
- Manipulação do DOM

Dados obtidos:
- Nome da raça
- Origem
- Temperamento
- Expectativa de vida
- Peso
- Altura
- URL da imagem

Parâmetros utilizados:
- q: termo usado para pesquisar a raça
- breed_ids: ID da raça usado para encontrar uma imagem
- limit: quantidade de resultados
- has_breeds: solicita imagens associadas a informações de raça

Tratamento de erros:
- Campo de pesquisa vazio
- Raça não encontrada
- Resposta HTTP com erro
- Resposta inesperada sem raça
- Falta de imagem para a raça

TESTES REALIZADOS:
1. Campo vazio
   Resultado esperado: mensagem solicitando o nome da raça.
   Resultado: aprovado.

2. Pesquisa por “Labrador”
   Resultado esperado: card com dados e imagem de Labrador.
   Resultado: aprovado.

3. Pesquisa por uma raça inexistente
   Resultado esperado: mensagem de raça não encontrada.
   Resultado: aprovado.

4. Botão “Cão aleatório”
   Resultado esperado: apresentação de um cão com informações de raça.
   Resultado: aprovado.

5. Botão “Limpar”
   Resultado esperado: limpar campo, mensagem e resultado.
   Resultado: aprovado.

6. Pesquisa pressionando Enter
   Resultado esperado: executar a consulta sem clicar no botão.
   Resultado: aprovado.

