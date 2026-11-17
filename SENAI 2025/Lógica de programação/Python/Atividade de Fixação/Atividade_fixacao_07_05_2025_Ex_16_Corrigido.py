#16 Solicite 8 números ao usuário, armazene-os em uma lista e exiba apenas os números pares digitados.
numeros = []

for i in range(8):
    numeros.append(int(input(f"Digite o {i+1}º: ")))

for i in numeros:
    if(i%2 == 0):
        print(f"O número {i} é par!")

