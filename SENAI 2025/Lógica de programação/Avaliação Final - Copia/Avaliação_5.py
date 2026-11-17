numero = int(input("Digite um número: "))
if (numero %2 == 0):
    print("O número é par!")
else:
    print("O número é ímpar!")

print("Tabuada do número: ")
for i in range (1, 11):
    print(f"{numero} x {i} = {numero*i}")