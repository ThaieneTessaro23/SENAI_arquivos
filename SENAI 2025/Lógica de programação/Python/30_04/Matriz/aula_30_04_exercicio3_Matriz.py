matriz = []
num = 0
posicaoI = 0
posicaoJ = 0
encontrou = False

for i in range(4):
    linha = []
    for j in range(4):
        linha.append(int(input(f"Digite o valor [{i},{j}]: ")))
    matriz.append(linha)

for i in matriz:
    print(i)

num = int(input("Digite um número x para encontrar: "))

for i in range(4):
    for j in range(4):
        if(matriz[i][j] == num):
            encontrou = True
            posicaoI = i
            posicaoJ = j

if(encontrou == True):
    print("O número ",num," foi encontrado na matriz na posição[", posicaoI,",", posicaoJ, "]")
else:
    print("Número não encontrado!")