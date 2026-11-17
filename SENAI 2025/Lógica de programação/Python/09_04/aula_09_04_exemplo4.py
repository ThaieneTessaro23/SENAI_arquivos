print("Calculadora Simples!")
num1 = float(input("Escreva o primeiro número: "))
num2 = float(input("Escreva o segundo número: "))
operacao = input("Digite a operação desejada: ")
resultado = 0

if(operacao == "+"): #Se
    resultado = num1+num2 
    print(num1, "+", num2, " = ", resultado)
elif(operacao == "-"): #Se não
    resultado = num1-num2
    print(num1, "-", num2, " = ", resultado)
elif(operacao == "*"):
    resultado = num1*num2
    print(num1, "*", num2, " = ", resultado)
elif(operacao == "/"):
    if(num2 == 0):
        print("Não é possível dividir por 0!")
    else:
        resultado = num1/num2
        print(num1, "/", num2, " = ", resultado)
else:
    print("Operacao inválida!")

