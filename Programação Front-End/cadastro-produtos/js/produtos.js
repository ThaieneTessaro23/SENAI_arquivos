export function CalcularTotal(preco, quantidade){
    return preco * quantidade;
}

export function CalcularDesconto(valor, percentual){
    return valor * (percentual/100);
}

export function CalcularTotalComDesconto(valor, percentual){
    const desconto = CalcularDesconto(valor, percentual);
    return valor - desconto;
}