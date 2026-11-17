notas = []
notas.append(float(input("Digite a 1ª nota: ")))
notas.append(float(input("Digite a 2ª nota: ")))
notas.append(float(input("Digite a 3ª nota: ")))
notas.append(float(input("Digite a 4ª nota: ")))
media = sum(notas)/len(notas)

if media >= 7:
    print("Aprovado!")
elif media >= 5 and media < 7:
    print("Recuperação!")
else:
    print("Reprovado!")