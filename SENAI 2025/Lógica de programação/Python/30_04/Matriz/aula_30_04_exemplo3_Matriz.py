matriz = []
linhas = int(input("Digite a quantidade de linhas (i): "))
colunas = int(input("Digite a quantidade de colunas (j): "))

for i in range(linhas):
    linha = []
    for j in range(colunas):
        linha.append(int(input(f"Digite o valor [{i},{j}]: ")))
    matriz.append(linha)

for i in matriz:
    print(i)