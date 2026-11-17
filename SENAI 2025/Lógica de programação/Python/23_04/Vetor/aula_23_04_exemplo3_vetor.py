vetor = []

for i in range(0, 5):
    vetor.append (int(input("Digite um número: ")))

maior = -99999999999999999999
for i in vetor:
    if(i > maior):
        maior = i
print("O maior número é: ", maior)