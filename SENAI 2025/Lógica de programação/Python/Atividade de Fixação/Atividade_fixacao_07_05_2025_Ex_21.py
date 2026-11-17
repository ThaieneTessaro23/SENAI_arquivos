#21. Some os elementos da diagonal principal de uma matriz 3x3.
matriz = []
soma = 0

for i in range (0,3):
    linha = []
    for j in range (0,3):
        linha.append(int(input(f"Digite o número na posição [{i},{j}]: ")))
    matriz.append(linha)

for i in range(0,3):
    for j in range(0,3):
        if (i==j):
            soma = soma + (matriz[i][j])

for linha in matriz:
    print(linha)

print(f"A soma da diagonal dessa matriz é {soma}.")