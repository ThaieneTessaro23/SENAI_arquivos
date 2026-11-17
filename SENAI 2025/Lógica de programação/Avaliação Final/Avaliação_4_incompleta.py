matriz = []
colunas = int(input("Digite a quantidade de colunas: "))
linhas = int(input("Digite a quantidade de linhas: "))
mais_caracteres = ''
menos_caracteres= ''
vogais = 'AEIOUaeiouáàãéêèíìîóòõôúùûÁÀÃÂÉÈÊÍÌÎÓÒÔÕÚÙÛ'
soma_vogais = 0
soma_consoantes = 0
letras_com_acento = 'áàãéêèíìîóòõôúùûÁÀÃÂÉÈÊÍÌÎÓÒÔÕÚÙÛ'
soma_acentos = 0

for i in range (linhas):
    linha = []
    for j in range(colunas):
        linha.append (input(f"Digite o nome na posição [{i},{j}]: "))
    matriz.append(linha)

for i in matriz:
    print(i)

for i in matriz:    #Entra em nomes
    if (i > mais_caracteres):
        mais_caracteres == j
    elif (i < menos_caracteres):
        menos_caracteres == j


for i in matriz:    #nomes da matriz
    for j in i:     #letras do nome
        if (j == vogais):
            soma_vogais += 1
        elif (j == letras_com_acento):
            soma_acentos += 1
        else:
            soma_consoantes += 1

print(f"O nome com mais caracteres é {mais_caracteres}")
print(f"O nome com menos caracteres é {menos_caracteres}")
print(f"A quantidade de vogais de todos os nomes da matriz é {soma_vogais}")
print(f"A quantidade de consoantes de todos os nomes da matriz é {soma_consoantes}")
print(f"A quantidade de letras com acentos de todos os nomes da matriz é {soma_acentos}")