alimentos = [
    ["laranja","romã", "maça verde", "limão", "caqui"],
    ["beringela", "batata-doce", "pimentão", "pimenta", "pepino"]
]

#Linha 0, primeira linha, Frutas
print(alimentos[0][0])
print(alimentos[0][1])
print(alimentos[0][2])
print(alimentos[0][3])
print(alimentos[0][4])

#Linha 1, segunda linha, Legumes
print(alimentos[1][0])
print(alimentos[1][1])
print(alimentos[1][2])
print(alimentos[1][3])
print(alimentos[1][4])

#Exibindo com estrutura de repetição - FOR
for i in range(0,2):
    for j in range(0,4):
        print(alimentos[i][j])

#Exibindo com FOR mais fácil
for i in alimentos:
    for j in i:
        print(j)