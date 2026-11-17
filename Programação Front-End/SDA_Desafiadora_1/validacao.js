//Manipulação dinâmica do DOM

class Atividade{
    constructor(insumo, area, quantidade, data){
        this.insumo = insumo;
        this.area = area;
        this.quantidade = quantidade;
        this.data = data;
        this.custo = quantidade * 4;
    }
}

let atividades = [];

let form = document.querySelector("form");

form.addEventListener("submit", function(e){
    //Evitar que envie o form automaticamente
    e.preventDefault();

    //Variável para controlar se o form foi validado
    let formValidado = true;

    let insumo = document.getElementById("insumo");
    let area = document.getElementById("area");
    let quantidade = document.getElementById("quantidade");
    let data = document.getElementById("data");

    let erroInsumo = document.getElementById("erroInsumo");
    let erroArea = document.getElementById("erroArea");
    let erroQuantidade = document.getElementById("erroQuantidade");
    let erroData = document.getElementById("erroData");
    

    //VALIDAÇÕES ======================================


    //Validação do INSUMO-----------------
    if(insumo.value.trim() === ""){
        erroInsumo.innerText = "Campo obrigatório!";
        erroInsumo.style.color = "red";
        erroInsumo.style.fontSize = "12px";
        insumo.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroInsumo.innerText = "";
        insumo.style.border = "2px solid green";
    }

    //Validação da AREA-----------------
    if(area.value.trim() === ""){
        erroArea.innerText = "Campo obrigatório!";
        erroArea.style.color = "red";
        erroArea.style.fontSize = "12px";
        area.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroArea.innerText = "";
        area.style.border = "2px solid green";
    }

    //Validação da QUANTIDADE ------------
    if(quantidade.value === ""){
        erroQuantidade.innerText = "Campo obrigatório!";
        erroQuantidade.style.color = "red";
        erroQuantidade.style.fontSize = "12px";
        quantidade.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroQuantidade.innerText = "";
        quantidade.style.border = "2px solid green";
    }

    //Validação da DATA-----------------
    if(data.value.trim() === ""){
        erroData.innerText = "Campo obrigatório!";
        erroData.style.color = "red";
        erroData.style.fontSize = "12px";
        data.style.border = "2px solid red";
        formValidado = false;
    }
    else{
        erroData.innerText = "";
        data.style.border = "2px solid green";
    }

    if(insumo.value == "" || area.value == "" || quantidade.value == "" || data.value == ""){
        alert("Preencha todos os campos!");
        return;
    }


    //CRIANDO O OBJETO  ===========================


    insumo.value = insumo.value.toUpperCase(); //Nome em MAÚSCULO

    let atividade = new Atividade(insumo.value, area.value, quantidade.value, data.value);

    //Insere a atividade no array de Atividades
    atividades.push(atividade);

    mostrarTabela();

    //limpa os campos do form
    form.reset();
});

function mostrarTabela(){
    let tbody = document.getElementById("tabelaAtividades");

    // limpa a tabela antes de recriar
    tbody.innerHTML = "";

    atividades.forEach(function(atv){
        let linha = `
            <tr>
                <td>${atv.insumo}</td>
                <td>${atv.area} m²</td>
                <td>${atv.quantidade}</td>
                <td>${atv.data.split("-").reverse().join("/")}</td>
                <td>R$ ${atv.custo},00</td>
            </tr>
        `;

        tbody.innerHTML += linha;
    });
}
