programa {
  funcao inicio() {
    inteiro num, multiplicacao=1

    escreva("Escreva um número para fatoriar: ")
    leia(num)

    para(inteiro i=num; i>=1; i--){
      multiplicacao = multiplicacao*i
    }
    escreva(multiplicacao)
  }
}
