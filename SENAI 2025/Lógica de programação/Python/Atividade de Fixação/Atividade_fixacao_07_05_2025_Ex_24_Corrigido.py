#24. Peça um número e diga se ele é primo.
num= int(input("Digite um número: "))
contador = 0

for i in range(1, num+1):
    if(num%i==0):
        contador += 1

if(contador == 1 or contador == 2):
    print(f"O número {num} é primo!")
else:
    print(f"O número {num} NÃO é primo!")
