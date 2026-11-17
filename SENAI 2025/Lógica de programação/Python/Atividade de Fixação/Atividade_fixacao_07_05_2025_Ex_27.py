#27 Leia uma lista de números e exiba o maior e o menor valor.
vetor= []
maior= -999999999999999999999999999999999999999999999999999999999
menor= 9999999999999999999999999999999999999999999999999999999999

for i in range(0,5):
    vetor.append(int(input("Digite um número: ")))

for i in vetor:
    if(i > maior):
        maior = i
    elif(i < menor):
        menor = i

print("O menor valor é:", menor)
print("O maior valor é:", maior)