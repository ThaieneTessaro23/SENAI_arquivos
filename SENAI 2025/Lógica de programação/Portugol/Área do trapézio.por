programa {
  funcao inicio() {
    real BaseMaior
    real BaseMenor
    real Altura
    real Area

    escreva("Base Maior: ")
    leia(BaseMaior)
    
    escreva("Base Menor: ")
    leia(BaseMenor)
    
    escreva("Altura: ")
    leia(Altura)
    
    Area=((BaseMaior+BaseMenor)*Altura)/2
    escreva("Area: "+Area)
  }
}
