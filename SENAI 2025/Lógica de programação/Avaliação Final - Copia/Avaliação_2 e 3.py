lista = []
menor = 99999999999999999999999999
maior = -9999999999999999999999999
media = 0
soma = 0

for i in range (5):
    lista.append (int(input(f"Digite o {i+1}º número: ")))

for i in lista:
    if (i < menor):
        menor = i
    elif (i > maior):
        maior = i

print(f"O MENOR número é {menor}")
print(f"O MAIOR número é {maior}")

for i in lista:
    soma += i

media = soma/5
print(f"A média dos números é {media}")