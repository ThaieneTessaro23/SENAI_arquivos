//Alterar entre Alto Contraste
document.getElementById('contraste-btn').addEventListener("click", function(){
    document.body.classList.toggle('alto-contraste');
});

//Ativar o modo leitura
document.getElementById('modo-leitura-btn').addEventListener("click", function(){
    document.body.classList.toggle("modo-leitura");
});

//Aumentar a fonte
document.getElementById('aumentar-fonte-btn').addEventListener("click", function(){
    document.body.classList.add("aumentar-fonte");
    document.body.classList.remove("diminuir-fonte");
});

//Diminuir a fonte
document.getElementById('diminuir-fonte-btn').addEventListener("click", function(){
    document.body.classList.remove("aumentar-fonte");
    document.body.classList.add("diminuir-fonte");
});

//Função para o teclado virtual
function addTecla(tecla){
    document.getElementById("resultado").innerText += tecla;
}

//Função para ler o conteúdo da página
document.getElementById("leitor-btn").addEventListener("click", function(){
    const texto = document.body.innerText;
    const fala = new SpeechSynthesisUtterance(texto);
    fala.lang = "pt-BR";
    fala.volume = 1;
    fala.rate = 1;  //Rapidez
    fala.pitch = 1; //Tom de voz

    speechSynthesis.speak(fala);
});