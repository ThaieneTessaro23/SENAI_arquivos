programa {
  funcao inicio() {
    inteiro num1,num2

    escreva("Digite o 1º número: ")
    leia(num1)
    escreva("Digite o 2º número: ")
    leia(num2)

    se(num1>num2){
      escreva("O número 1 é o maior")
    }
    senao se(num1<num2){
      escreva(" O número 2 é o maior")
    }
    senao se(num1==num2){
      escreva("Os números são iguais")
    }
    senao{
      escreva("Operação inválida")
    }
  }
}
