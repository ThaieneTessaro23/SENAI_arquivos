matriz = []

for i in range(3):
    linha = []
    for j in range(3):
        linha.append(int(input(f"Digite o valor [{i},{j}]: ")))
    matriz.append(linha)

for i in matriz:
    print(i)

soma_principal = ((matriz[0][0] + matriz[1][1]) + matriz[2][2])
soma_secundaria = ((matriz[0][2] + matriz[1][1]) + matriz[2][0])

print(f"A soma da diagonal principal é {soma_principal}")
print(f"A soma da diagonal secundária é {soma_secundaria}")