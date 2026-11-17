//Variáveis globais
let latitudeUsuario = null;
let longitudeUsuario = null;

function mostrarMapa(latitude, longitude){
    //Criar o mapa com a localização atual
    var mapa = L.map('map').setView([latitude, longitude], 13);

        // Adiciona o OpenStreetMap
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'OpenStreetMap contributors'
    }).addTo(map);

    // Adiciona um marcador com a localização atual
    L.marker([latitude, longitude]).addTo(map)
        .bindPopup('Local Atual!')
        .openPopup();
}

function getLocalizacao(){
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(pos => {
            latitudeUsuario = pos.coords.latitude;
            longitudeUsuario = pos.coords.longitude;
            mostrarMapa(latitudeUsuario, longitudeUsuario);
        });
    }
    else{
        alert("Geolocalização não suportada!");
    }
}

//Drag and Drop
const itens = document.querySelectorAll('.item');
const containers = document.querySelectorAll('.container');

itens.forEach(item => {
    item.addEventListener('dragstart', dragStart);
    item.addEventListener('dragend', dragEnd);
});

containers.forEach(container => {
    container.addEventListener('dragover', e => e.preventDefault());
    container.addEventListener('dragenter', e => e.target.classList.add('dropzone'));
    container.addEventListener('dragleave', e => e.target.classList.remove('dropzone'));
    container.addEventListener('drop', drop);
});

function dragStart(e){
    e.dataTransfer.setData('text',e.target.innerText);
}

function dragEnd(e){}

function drop(e){
    e.preventDefault();
    const dados = e.dataTransfer.getData('text');
    const novoItem = document.createElement('div');
    novoItem.className = 'item'
    novoItem.draggable = true;
    novoItem.innerText = dados;

    novoItem.addEventListener('dragstart', dragStart);
    e.target.append(novoItem);
    e.target.classList.remove('dropzone');
}

//Câmera
const video = document.getElementById('video');
const canvas = document.getElementById('canvas');
const foto = document.getElementById('foto');

navigator.mediaDevices.getUserMedia({video: true})
    .then(stream => video.srcObject = stream)
    .catch(erro => console.log(erro));

document.getElementById('captura').addEventListener('click', () => {
    const ctx = canvas.getContext('2d');

    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;

    ctx.drawImage(video, 0, 0);

    foto.src = canvas.toDataURL('image/png');
})

//Salvar dados como JSON
function salvarDados(){
    const nome = document.querySelector('input[type="text"]').value;
    const email = document.querySelector('input[type="email"]').value;

    gerarJson(nome, email, latitudeUsuario, longitudeUsuario);
}

function gerarJson(nome, email, latitudeUsuario, longitudeUsuario){
    const selecionados = document.querySelectorAll("#destino.item");
    const interesses = [];

    selecionados.forEach(item => {
        interesses.push(item.innerText);
    });

    const foto = document.getElementById('foto').src;

    const dados = {
        usuario: {
            nome: nome,
            email: email
        },
        localizacao: {
            latitude: latitudeUsuario,
            longitude: longitudeUsuario
        },
        interesses: interesses,
        foto: foto
    };

    document.getElementById('saida').textContent = JSON.stringify(dados, null, 4);
}