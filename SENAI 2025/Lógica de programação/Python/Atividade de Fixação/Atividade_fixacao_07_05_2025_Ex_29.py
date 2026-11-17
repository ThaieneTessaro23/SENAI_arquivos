#29. Peça um número inteiro positivo e calcule o fatorial utilizando for.
num = int(input("Digite um número:"))
fat = 1

for i in range(1, num+1):
    fat = fat*i

print( "O fatorial de", num, "é :", fat)