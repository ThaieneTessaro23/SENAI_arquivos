programa {
  funcao inicio() {
    logico tem_cupom
    real valor_compra

    escreva("Você tem cupom? ")
    leia(tem_cupom)
    escreva("Qual o valor da sua compra? ")
    leia(valor_compra)

    se(tem_cupom ou valor_compra>=200){
      escreva ("Você ganhou 15% de desconto!")
    }
     senao{
      escreva ("Você não tem direito a descontos!")
    }
  }
}
