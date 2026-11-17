vetor = []
pares = 0

for i in range(0, 10):
    vetor.append (int(input("Digite um número: ")))

for i in vetor:
    if(i%2 == 0):
        pares = pares + 1

print(pares)