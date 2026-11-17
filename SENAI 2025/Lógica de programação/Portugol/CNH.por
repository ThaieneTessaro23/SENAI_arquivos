programa {
  funcao inicio() {
    inteiro idade
    logico tem_carteira

    escreva("Qual sua  idade? ")
    leia (idade)
    escreva("Você tem CNH? ")
    leia (tem_carteira)

    se (idade>=18 e tem_carteira){
      escreva("Você pode dirigir")
    }

    senao se (idade>=18 e nao(tem_carteira)){
      escreva("Você não pode dirigir")
    }

    senao se (idade<18){
      escreva("Você não tem idade para dirigir!")
    }
  }
}
