#13. Peça ao usuário cinco nomes e exiba todos em ordem alfabética.

nomes = []
for i in range(5):
    nomes.append(input("Digite um nome: "))

print("Vetor Inicial: ")
print(nomes)

for i in range(5):
    for j in range(0, 5-1):
        if(nomes[j] > nomes[j+1]):
            nome = nomes[j]
            nomes[j] = nomes[j+1]
            nomes[j+1] = nome

print("Vetor Ordenado: ")
print(nomes)