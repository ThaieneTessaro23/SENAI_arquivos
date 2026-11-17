/* ==========================================================================
   FROTACHECK - LÓGICA JAVASCRIPT (TEMA 03 SENAI)
   Persistência com LocalStorage e suporte a PWA Offline.
   ========================================================================== */

// Nomes das Chaves no LocalStorage
const STORAGE_VEHICLES = 'frotacheck_vehicles';
const STORAGE_CHECKLISTS = 'frotacheck_checklists';

// Dados Iniciais Padrão (Mock caso esteja vazio)
const defaultVehicles = [
  { placa: 'ABC-1234', marca: 'Volvo', modelo: 'FH 540', ano: 2022, tipo: 'Caminhão', status: 'Ativo' },
  { placa: 'XYZ-9876', marca: 'FIAT', modelo: 'Fiorino', ano: 2021, tipo: 'Utilitário / Van', status: 'Ativo' },
  { placa: 'KLR-4040', marca: 'Volkswagen', modelo: 'Gol', ano: 2020, tipo: 'Passeio / Frota', status: 'Em Manutenção' }
];

// Inicialização da Aplicação
document.addEventListener('DOMContentLoaded', () => {
  initStorage();
  registerServiceWorker();
  setupOnlineStatusListener();

  // Identificar página atual
  if (document.getElementById('totalVehicles')) loadDashboardMetrics();
  if (document.getElementById('vehicleForm')) setupVehiclePage();
  if (document.getElementById('checklistForm')) setupChecklistPage();
  if (document.getElementById('fullHistoryTable')) loadFullHistory();
});

// Inicializar Dados no Storage
function initStorage() {
  if (!localStorage.getItem(STORAGE_VEHICLES)) {
    localStorage.setItem(STORAGE_VEHICLES, JSON.stringify(defaultVehicles));
  }
  if (!localStorage.getItem(STORAGE_CHECKLISTS)) {
    localStorage.setItem(STORAGE_CHECKLISTS, JSON.stringify([]));
  }
}

// Helpers do LocalStorage
function getVehicles() {
  return JSON.parse(localStorage.getItem(STORAGE_VEHICLES)) || [];
}

function saveVehicles(vehicles) {
  localStorage.setItem(STORAGE_VEHICLES, JSON.stringify(vehicles));
}

function getChecklists() {
  return JSON.parse(localStorage.getItem(STORAGE_CHECKLISTS)) || [];
}

function saveChecklists(checklists) {
  localStorage.setItem(STORAGE_CHECKLISTS, JSON.stringify(checklists));
}

/* ==========================================================================
   1. REGISTRO DE SERVICE WORKER (OFFLINE)
   ========================================================================== */
function registerServiceWorker() {
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('./sw.js')
      .then(() => console.log('FrotaCheck: Service Worker registrado com sucesso.'))
      .catch(err => console.error('Erro ao registrar SW:', err));
  }
}

function setupOnlineStatusListener() {
  const badge = document.getElementById('offlineBadge');
  const text = document.getElementById('statusText');

  function updateStatus() {
    if (navigator.onLine) {
      if (badge) badge.classList.remove('offline');
      if (text) text.innerText = 'Online';
    } else {
      if (badge) badge.classList.add('offline');
      if (text) text.innerText = 'Offline';
    }
  }

  window.addEventListener('online', updateStatus);
  window.addEventListener('offline', updateStatus);
  updateStatus();
}

/* ==========================================================================
   2. DASHBOARD
   ========================================================================== */
function loadDashboardMetrics() {
  const vehicles = getVehicles();
  const checklists = getChecklists();

  document.getElementById('totalVehicles').innerText = vehicles.length;
  document.getElementById('totalChecklists').innerText = checklists.length;

  const liberatedCount = checklists.filter(c => c.resultado === 'Veículo Liberado').length;
  const blockedCount = checklists.filter(c => c.resultado === 'Veículo Não Liberado').length;

  document.getElementById('totalLiberated').innerText = liberatedCount;
  document.getElementById('totalBlocked').innerText = blockedCount;

  // Carregar tabela de recentes
  const recentTable = document.getElementById('recentHistoryTable');
  recentTable.innerHTML = '';

  const recent = checklists.slice(-5).reverse();
  if (recent.length === 0) {
    recentTable.innerHTML = '<tr><td colspan="4" style="text-align:center;">Nenhum checklist realizado ainda.</td></tr>';
    return;
  }

  recent.forEach(item => {
    const badgeClass = item.resultado === 'Veículo Liberado' ? 'badge-success' : 'badge-danger';
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${item.dataHora}</td>
      <td><strong>${item.placa}</strong> - ${item.modelo}</td>
      <td>${item.responsavel}</td>
      <td><span class="badge ${badgeClass}">${item.resultado}</span></td>
    `;
    recentTable.appendChild(tr);
  });
}

/* ==========================================================================
   3. GESTÃO DE VEÍCULOS (CADASTRO, EDIÇÃO, EXCLUSÃO)
   ========================================================================== */
function setupVehiclePage() {
  renderVehicleTable();

  const form = document.getElementById('vehicleForm');
  const btnCancel = document.getElementById('btnCancelEdit');

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const editIndex = parseInt(document.getElementById('vehicleIndex').value);

    const vehicleData = {
      placa: document.getElementById('placa').value.toUpperCase().trim(),
      marca: document.getElementById('marca').value.trim(),
      modelo: document.getElementById('modelo').value.trim(),
      ano: parseInt(document.getElementById('ano').value),
      tipo: document.getElementById('tipo').value,
      status: document.getElementById('status').value
    };

    let vehicles = getVehicles();

    if (editIndex === -1) {
      // Verificar duplicidade de placa
      if (vehicles.some(v => v.placa === vehicleData.placa)) {
        alert('Erro: Já existe um veículo cadastrado com esta placa!');
        return;
      }
      vehicles.push(vehicleData);
      alert('Veículo cadastrado com sucesso!');
    } else {
      vehicles[editIndex] = vehicleData;
      alert('Veículo atualizado com sucesso!');
    }

    saveVehicles(vehicles);
    resetVehicleForm();
    renderVehicleTable();
  });

  btnCancel.addEventListener('click', resetVehicleForm);
}

function renderVehicleTable() {
  const tbody = document.getElementById('vehicleTableBody');
  if (!tbody) return;

  const vehicles = getVehicles();
  tbody.innerHTML = '';

  if (vehicles.length === 0) {
    tbody.innerHTML = '<tr><td colspan="5" style="text-align:center;">Nenhum veículo cadastrado.</td></tr>';
    return;
  }

  vehicles.forEach((v, index) => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td><strong>${v.placa}</strong></td>
      <td>${v.marca} ${v.modelo}</td>
      <td>${v.tipo} (${v.ano})</td>
      <td><span class="badge ${v.status === 'Ativo' ? 'badge-success' : 'badge-danger'}">${v.status}</span></td>
      <td>
        <button class="btn btn-sm btn-secondary" onclick="editVehicle(${index})">Editar</button>
        <button class="btn btn-sm btn-danger" onclick="deleteVehicle(${index})">Excluir</button>
      </td>
    `;
    tbody.appendChild(tr);
  });
}

function editVehicle(index) {
  const vehicles = getVehicles();
  const v = vehicles[index];

  document.getElementById('vehicleIndex').value = index;
  document.getElementById('placa').value = v.placa;
  document.getElementById('marca').value = v.marca;
  document.getElementById('modelo').value = v.modelo;
  document.getElementById('ano').value = v.ano;
  document.getElementById('tipo').value = v.tipo;
  document.getElementById('status').value = v.status;

  document.getElementById('btnSaveVehicle').innerText = 'Atualizar Veículo';
  document.getElementById('btnCancelEdit').style.display = 'inline-block';
}

function deleteVehicle(index) {
  if (confirm('Tem certeza que deseja excluir este veículo?')) {
    let vehicles = getVehicles();
    vehicles.splice(index, 1);
    saveVehicles(vehicles);
    renderVehicleTable();
  }
}

function resetVehicleForm() {
  document.getElementById('vehicleForm').reset();
  document.getElementById('vehicleIndex').value = '-1';
  document.getElementById('btnSaveVehicle').innerText = 'Cadastrar Veículo';
  document.getElementById('btnCancelEdit').style.display = 'none';
}

/* ==========================================================================
   4. CHECKLIST DE INSPEÇÃO (TEMA 03 - REGRAS)
   ========================================================================== */
function setupChecklistPage() {
  const select = document.getElementById('selectVehicle');
  const vehicles = getVehicles().filter(v => v.status === 'Ativo');

  select.innerHTML = '<option value="">-- Escolha um Veículo --</option>';
  vehicles.forEach(v => {
    const opt = document.createElement('option');
    opt.value = v.placa;
    opt.innerText = `${v.placa} - ${v.marca} ${v.modelo}`;
    select.appendChild(opt);
  });

  const form = document.getElementById('checklistForm');
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const selectedPlaca = select.value;
    const vehicleObj = getVehicles().find(v => v.placa === selectedPlaca);

    // Coleta dos 5 itens
    const pneus = document.querySelector('input[name="pneus"]:checked').value;
    const freios = document.querySelector('input[name="freios"]:checked').value;
    const farois = document.querySelector('input[name="farois"]:checked').value;
    const combustivel = document.querySelector('input[name="combustivel"]:checked').value;
    const documentacao = document.querySelector('input[name="documentacao"]:checked').value;

    const itens = { pneus, freios, farois, combustivel, documentacao };

    // REGRA DE NEGÓCIO TEMA 03: Se pelo menos 1 item estiver Não Conforme = Não Liberado
    const hasNonConformity = Object.values(itens).includes('Não conforme');
    const resultado = hasNonConformity ? 'Veículo Não Liberado' : 'Veículo Liberado';

    const checklistRecord = {
      id: Date.now(),
      dataHora: new Date().toLocaleString('pt-BR'),
      placa: selectedPlaca,
      modelo: `${vehicleObj.marca} ${vehicleObj.modelo}`,
      responsavel: document.getElementById('responsavel').value.trim(),
      itens: itens,
      observacoes: document.getElementById('observacoes').value.trim(),
      resultado: resultado
    };

    const checklists = getChecklists();
    checklists.push(checklistRecord);
    saveChecklists(checklists);

    alert(`Inspeção salva com sucesso!\n\nResultado: ${resultado.toUpperCase()}`);
    window.location.href = 'historico.html';
  });
}

/* ==========================================================================
   5. HISTÓRICO E CONSULTA DETALHADA
   ========================================================================== */
function loadFullHistory() {
  filterHistory();
}

function filterHistory() {
  const tbody = document.getElementById('fullHistoryTable');
  if (!tbody) return;

  const filterResult = document.getElementById('filterResult').value;
  const searchPlaca = document.getElementById('searchPlaca').value.toLowerCase();

  let checklists = getChecklists().reverse();

  if (filterResult !== 'ALL') {
    checklists = checklists.filter(c => c.resultado === filterResult);
  }

  if (searchPlaca) {
    checklists = checklists.filter(c => 
      c.placa.toLowerCase().includes(searchPlaca) || 
      c.responsavel.toLowerCase().includes(searchPlaca)
    );
  }

  tbody.innerHTML = '';

  if (checklists.length === 0) {
    tbody.innerHTML = '<tr><td colspan="6" style="text-align:center;">Nenhuma inspeção encontrada.</td></tr>';
    return;
  }

  checklists.forEach(item => {
    const failedItems = Object.entries(item.itens)
      .filter(([_, status]) => status === 'Não conforme')
      .map(([key, _]) => key.toUpperCase())
      .join(', ');

    const badgeClass = item.resultado === 'Veículo Liberado' ? 'badge-success' : 'badge-danger';
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${item.dataHora}</td>
      <td><strong>${item.placa}</strong><br><small>${item.modelo}</small></td>
      <td>${item.responsavel}</td>
      <td><span class="badge ${badgeClass}">${item.resultado}</span></td>
      <td>${failedItems ? `<span style="color:var(--red-danger); font-weight:bold;">${failedItems}</span>` : 'Nenhum'}</td>
      <td>
        <button class="btn btn-sm btn-primary" onclick="viewDetail(${item.id})">Ver Detalhes</button>
      </td>
    `;
    tbody.appendChild(tr);
  });
}

function viewDetail(id) {
  const checklists = getChecklists();
  const item = checklists.find(c => c.id === id);
  if (!item) return;

  const modalBody = document.getElementById('modalBody');
  modalBody.innerHTML = `
    <p><strong>Data/Hora:</strong> ${item.dataHora}</p>
    <p><strong>Veículo:</strong> ${item.placa} (${item.modelo})</p>
    <p><strong>Responsável:</strong> ${item.responsavel}</p>
    <p><strong>Resultado:</strong> <span class="badge ${item.resultado === 'Veículo Liberado' ? 'badge-success' : 'badge-danger'}">${item.resultado}</span></p>
    <hr style="margin: 10px 0;">
    <h4>Itens Verificados:</h4>
    <ul>
      <li>Pneus: <strong>${item.itens.pneus}</strong></li>
      <li>Freios: <strong>${item.itens.freios}</strong></li>
      <li>Faróis: <strong>${item.itens.farois}</strong></li>
      <li>Combustível: <strong>${item.itens.combustivel}</strong></li>
      <li>Documentação: <strong>${item.itens.documentacao}</strong></li>
    </ul>
    <hr style="margin: 10px 0;">
    <p><strong>Observações:</strong> ${item.observacoes || 'Nenhuma observação registrada.'}</p>
  `;

  document.getElementById('detailModal').style.display = 'flex';
}

function closeModal() {
  document.getElementById('detailModal').style.display = 'none';
}