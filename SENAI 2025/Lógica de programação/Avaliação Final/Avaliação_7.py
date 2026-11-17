matriz = []

for i in range(3):
    linha = []
    for j in range(3):
        linha.append(int(input(f"Digite o valor [{i},{j}]: ")))
    matriz.append(linha)

for i in matriz:
    print(i)

soma_acima_principal = ((matriz[0][1] + matriz[0][2]) + matriz[1][2])
print(f"A soma acima da diagonal é {soma_acima_principal}")