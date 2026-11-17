N = int(input("Digite um número (ímpar): "))
M = 0
M == (N/2) + 0.5   #metade
desenho = ''

if (N %2 != 0):
    for i in range (N, 0, -1):
        for j in range (i):
            desenho += ' '
        desenho += '*'
        desenho += '\n'

    for i in range (N):
        for j in range (i):
            desenho += ' '
        desenho += '*'
        desenho += '\n'

else:
    print("O número precisa ser ímpar!")

print(desenho)