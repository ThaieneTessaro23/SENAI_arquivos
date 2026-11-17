idade = 0

#Tenta ler a idade
try:
    idade = int(input("Digite sua idade: "))
    if idade < 0 or idade > 120:
        print("⚠️Idade inválida!")
        exit()
    elif idade >= 18:
        print("Maior de idade")
    else:
        print("Menor de idade")

#Quando a idade é inválida
except ValueError:
    print("Idade inválida!")
    exit()