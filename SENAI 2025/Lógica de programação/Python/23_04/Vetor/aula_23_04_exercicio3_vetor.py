notas = []
media = 0
soma = 0

for i in range(0, 4):
     notas.append (int(input(f"Digite a {i+1} nota: ")))

for i in notas:
    soma = soma + i

media = soma/4
if(media < 4):
    print("Reprovado")
elif(media >= 4 and media <= 7):
    print("Recuperação")
elif(media > 7):
    print("Aprovado")
else:
    print("Não é válido")