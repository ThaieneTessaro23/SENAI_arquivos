numeros = []

for i in range(0, 8):
    numeros.append (int(input(f"Digite o {i+1} número: ")))

encontrar = int(input("Digite um número para encontrar: "))
encontrou = False

for i in numeros:
    if(encontrar == i):
        encontrou = True

if(encontrou == True):
    print("O número foi encontrado!")
else:
    print("O seu número não foi encontrado!")
    