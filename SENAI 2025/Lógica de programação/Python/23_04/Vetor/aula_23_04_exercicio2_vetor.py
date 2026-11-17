num = []
media = 0
soma = 0

for i in range(0, 6):
    num.append (int(input("Digite um número: ")))

for i in num:
    soma = soma + i

media = soma/6
print(media)