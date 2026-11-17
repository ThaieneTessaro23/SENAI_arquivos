# FrotaCheck - Gestão Inteligente de Frotas

Aplicação Web PWA Offline desenvolvida para a Unidade Curricular de Programação Front-End 02 do SENAI.

## 📋 Tema 03 - Checklist de Veículos da Empresa

### Funcionalidades Implementadas
1. **Cadastro de Veículos**: Permite cadastrar, editar, excluir e listar veículos com Placa, Marca, Modelo, Ano, Tipo e Status.
2. **Checklist de Inspeção**: Realização de verificação antes do uso com os 5 itens obrigatórios:
   - Pneus
   - Freios
   - Faróis
   - Combustível
   - Documentação
3. **Avaliação Automática de Resultado**:
   - **Veículo Liberado**: Quando todos os 5 itens estão "Conforme".
   - **Veículo Não Liberado**: Quando pelo menos 1 item está "Não Conforme".
4. **Histórico de Inspeções**: Consulta completa das inspeções realizadas com filtros por resultado, busca por placa/motorista e detalhamento individual.
5. **Funcionamento 100% Offline**:
   - Armazenamento local de dados via `localStorage`.
   - Interceptação de arquivos estáticos via `Service Worker` e `Cache API`.

### 🎨 Identidade Visual
Construído com base na paleta oficial FrotaCheck:
- **Roxo Corporativo (`#5C2D91`)**: Estrutura, Navbar e Títulos.
- **Laranja Movimento (`#F05123`)**: Botões primários, ícones e destaques.
- **Cinza Texto (`#606060`)**: Subtítulos e textos auxiliares.
- **Branco Base (`#FFFFFF`)**: Planos de fundo e containers.

### 🧪 Roteiro do Teste Obrigatório Offline
1. Cadastrar um novo veículo em `veiculos.html`.
2. Acessar `checklist.html` e realizar uma inspeção selecionando o veículo recém-cadastrado.
3. Marcar todos como "Conforme" para demonstrar o resultado **Veículo Liberado**.
4. Realizar um novo checklist com pelo menos 1 item "Não Conforme" para demonstrar **Veículo Não Liberado**.
5. Consultar em `historico.html` o registro das duas inspeções.
6. Abrir as ferramentas do desenvolvedor (`F12`), vá na aba **Network** (ou **Application**) e selecione a opção **Offline**.
7. Recarregue a página e navegue por todas as sessões para provar o pleno funcionamento sem internet!