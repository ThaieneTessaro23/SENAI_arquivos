programa {
  funcao inicio() {
    inteiro dia = 0

    escreva("Escreva um número de 1 a 7: ")
    leia(dia)

    se(dia == 1){
      escreva("Hoje é Domingo!")
    }
    senao se(dia == 2){
      escreva("Hoje é Segunda!")
    }
    senao se(dia == 3){
      escreva("Hoje é Terça!")
    }
    senao se(dia == 4){
      escreva("Hoje é Quarta!")
    }
    senao se(dia == 5){
      escreva("Hoje é Quinta!")
    }
    senao se(dia == 6){
      escreva("Hoje é Sexta!")
    }
    senao se(dia == 7){
      escreva("Hoje é Sábado!")
    }
    senao{
      escreva("Dia inválido")
    }
  }
}
