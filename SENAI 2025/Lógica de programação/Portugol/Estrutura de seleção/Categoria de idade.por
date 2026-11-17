programa {
  funcao inicio() {
    inteiro idade

    escreva("Escreva sua idade: ")
    leia(idade)

    se(idade <= 12){
      escreva("Você é uma criança")
    }
    senao se(idade >= 13 e idade <=17){
      escreva("Você é um adolescente")
    }
    senao se(idade >= 18 e idade <=59){
      escreva("Você é um adulto")
    }
    senao{
      escreva("Você é um idoso")
    }
  }
}
