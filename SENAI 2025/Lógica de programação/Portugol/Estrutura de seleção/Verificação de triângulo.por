programa {
  funcao inicio() {
    inteiro lado1, lado2, lado3

    escreva("Quanto mede o lado 1: ")
    leia(lado1)
    escreva("Quanto mede o lado 2: ")
    leia(lado2)
    escreva("Quanto mede o lado 3: ")
    leia(lado3)

    se(lado1 == lado2 e lado1 == lado3 e lado2 == lado3){
      escreva("É um triângulo EQUILÁTERO!")
    }
    senao se(lado1 == lado2 e lado1 != lado3 e lado2 != lado3){
      escreva("É um triângulo ISÓSCELES!")
    }
    senao se(lado1 != lado2 e lado1 != lado3 e lado2 != lado3){
      escreva("É um triângulo ESCALENO!")
    }
    senao{
      escreva("Operação inválida")
    }
  }
}
