num1 = int(input("Digite um número (início): "))
num2 = int(input("Digite um número (fim): "))
soma = 0

for i in range(num1, num2+1):
    if (i %2 == 0):
        soma = soma + i
print("A soma entre", num1, "e", num2, "=", soma)
