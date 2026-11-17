programa {
  funcao inicio() {
    inteiro inicio, fim, soma=0

    escreva("Escreva o primeiro número: ")
    leia(inicio)

    escreva("Escreva o segundo número: ")
    leia(fim)

    para(inteiro i=inicio; i<=fim; i++){
      se(i%2 ==0){
        soma = soma+i
      }
    }
    escreva(soma)
  }
}
