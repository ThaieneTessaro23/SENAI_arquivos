programa {
  funcao inicio() {
    inteiro num1, num2
    real resultado
    caracter operacao

    escreva("Digite o 1º Número: ")
    leia(num1)
    escreva("Digite o 2º Número: ")
    leia(num2)

    escreva("Digite a operação (+,-,*,/): ")
    leia(operacao)

    se(operacao == '+'){
      resultado = num1+num2
      escreva("A soma é: "+resultado)
    }
    senao se(operacao == '-'){
      resultado = num1-num2
      escreva("A subtração é: "+resultado)
    }
    senao se(operacao == '*'){
      resultado = num1*num2
      escreva("A multiplicação é: "+resultado)
    }
    senao se(operacao == '/'){
      resultado = num1/num2
      escreva("A divisão é: "+resultado)
    }
    senao {
      escreva("Operação inválida")
    }
  }
}
