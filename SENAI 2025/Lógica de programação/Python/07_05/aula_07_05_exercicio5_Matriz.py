matriz = []

for i in range (3):
    linha = []
    for j in range(3):
        linha.append(int(input(f"Adicione números na matriz[{i},{j}]: ")))
    matriz.append(linha)

for i in matriz:
    print(i)

K = int(input("Digite um número para multiplicar na diagonal principal: "))

for i in range(3):
    for j in range(3):
        if(i == j):
            matriz[i][j] = matriz[i][j]*K

for i in matriz:
    print(i)
