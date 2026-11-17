#20. Crie uma matriz 3x3 com números fornecidos pelo usuário e exiba a matriz formatada.
matriz = []

for i in range(3):
    linha = []
    for j in range(3):
        linha.append(int(input(f"Digite um número para a posição [{i},{j}]: ")))
    matriz.append(linha)

for i in matriz:
    print(i)