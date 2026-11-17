nota1 = float(input("Digite a 1º nota: "))
nota2 = float(input("Digite a 2º nota: "))

media = (nota1+nota2)/2

if(media >= 7):
    print("Ótimo!")
elif(media >= 5 and media < 7):
    print("Regular")
else:
    print("Precisa melhorar!")