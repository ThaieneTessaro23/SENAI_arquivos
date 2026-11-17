export function formatarMoeda(valor){
    return valor.toLocaleString("pt-BR", {
        style: "currency",
        currency: "BRL",
    });
}

export function formatarNomeProduto(nome){
    return nome
        .trim()
        .toLowerCase()
        .split(" ")
        .filter((palavra) => palavra.length > 0)
        .map((palavra) => palavra.charAt(0).toUpperCase() + palavra.slice(1))
        .join(" ");
}