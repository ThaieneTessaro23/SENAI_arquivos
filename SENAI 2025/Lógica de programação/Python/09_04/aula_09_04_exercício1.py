num1 = int(input("Digite o primeiro número: "))
num2 = int(input("Digite o segundo número: "))

if(num1 < num2):
    print( num1," é menor que ", num2)
elif(num1 > num2):
    print( num1," é maior que ", num2)
elif(num1 == num2):
    print("Os números são iguais")
else:
    print("Operação inválida!")