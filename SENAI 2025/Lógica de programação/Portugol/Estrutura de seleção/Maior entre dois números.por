programa {
  funcao inicio() {
    inteiro num1, num2

    escreva("Escreva o Número 1: ")
    leia(num1)
    escreva("Escreva o Número 2: ")
    leia(num2)

    se(num1 > num2){
      escreva("Número 1 - ", num1, " é maior")
    }
    senao se(num2 > num1){
      escreva("Número 2 - ",num2, " é maior")
    }
    senao{
      escreva("Os números são iguais")
    }
  }
}
