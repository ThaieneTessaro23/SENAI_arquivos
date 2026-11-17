lado1 = int(input("Medida do primeiro lado: "))
lado2 = int(input("Medida do segundo lado: "))
lado3 = int(input("Medida do terceiro lado: "))

if(lado1+lado2>lado3 and lado1+lado3>lado2 and lado3+lado2>lado1):
    if(lado1==lado2 and lado2==lado3 and lado1==lado3):
        print("O triângulo é EQUILÁTERO")
    elif(lado1!=lado2!=lado3):
        print("O triângulo é ESCALENO")
    else:
        print("O triângulo é ISÓSCELES")
    
else:
    print("Não é um triângulo")