programa {
  funcao inicio() {
    inteiro secreto=7, numero

    faca{
      escreva("Chute um número: ")
      leia(numero)

      se (numero == secreto){
        escreva("Parabéns! Você acertou")
      }
    } enquanto(numero != secreto)
  }
}
