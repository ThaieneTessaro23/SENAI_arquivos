N = int(input("Digite a quantidade N: "))
soma = 0

desenho = ''
for i in range (N, 0, -1):
    for j in range(i):
        desenho += ' '
    desenho += '*'
    desenho += '\n'
print (desenho)