#19. Solicite ao usuário o número de alunos de uma turma e, para cada um, leia o nome e a nota. Ao final, exiba a média geral.
num_alunos = int(input("Digite o número de alunos: "))
matriz = []
soma = 0

for i in range(num_alunos):
    linha = []
    linha.append(input(f"Digite o {i+1}º nome: "))
    nota = float(input("Digite a nota: "))
    linha.append(nota)
    soma = soma+nota
    matriz.append(linha)

media = soma/num_alunos
print("A média geral é: ",media)