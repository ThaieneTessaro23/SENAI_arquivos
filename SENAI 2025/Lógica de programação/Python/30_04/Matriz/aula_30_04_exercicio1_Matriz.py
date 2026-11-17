matriz1 = []
for i in range(0, 3):
    linha = []
    for j in range(0, 3):
        linha.append(int(input(f"Digite o valor [{i},{j}]: ")))
    matriz1.append(linha)

matriz2 = []
for i in range(0, 3):
    linha = []
    for j in range(0, 3):
        linha.append(int(input(f"Digite o valor [{i},{j}]: ")))
    matriz2.append(linha)

matriz_soma = []
for i in range(3):
    linha = []
    for j in range(3):
        linha.append(matriz1[i][j] + matriz2[i][j])
    matriz_soma.append(linha)

for i in matriz_soma:
    print(i)