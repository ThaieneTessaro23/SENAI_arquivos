programa {
  funcao inicio() {
    inteiro Raio
    real Area
    real Diametro
    real Perimetro
    real Pi=3.14

    escreva("Digite o Raio: ")
    leia(Raio)

    Perimetro=2*Pi*Raio
    Area=Pi*Raio*Raio
    Diametro=2*Raio

    escreva("Perimetro: "+Perimetro+"\nÁrea: "+Area+"\nDiâmetro: "+Diametro)
  }
}
