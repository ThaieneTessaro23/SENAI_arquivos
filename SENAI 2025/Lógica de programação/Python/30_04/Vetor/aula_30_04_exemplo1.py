saltos = []
maior = -9999999999999999999999999
menor = 99999999999999999999999999

for i in range(0, 7):
    saltos.append(float(input(f"Digite o valor do {i+1}º salto: ")))

for salto in saltos:
    print(salto)

    if(salto > maior):
        maior = salto
    if(salto < menor):
        menor = salto
    
media_5 = 0
soma_5 = 0
media_total = 0
soma_total = 0

for salto in saltos:
    soma_total = soma_total + salto
    if(salto != maior and salto != menor):
        soma_5 = soma_5 + salto

media_5 = soma_5/5
media_total = soma_total/7

print("Média sem maior e menor: ", media_5)
print("Média total: ", media_total)

