matriz = []
matriz_transposta = []

for i in range (3):
    linha = []
    for j in range(2):
        linha.append(int(input("Adicione números na matriz: ")))
    matriz.append(linha)

for i in matriz:
    print(i)

for j in range (2):
    linha_transposta = []
    for i in range (3):
        linha_transposta.append(matriz[i][j])
    matriz_transposta.append(linha_transposta)

for linha in matriz_transposta:
    print(linha)

