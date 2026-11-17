#30. Crie uma calculadora simples que leia dois números e uma operação (+, -, *, /) e exiba o resultado.
num1 = float(input("DIgite o primeiro número: "))
num2 = float(input ("Digite o segundo número: "))
operacao = input("Digite a operação desejada (+,-,/,*): ")
resultado = 0

if(operacao == "+"):
    resultado = num1+num2
    print(num1, "+", num2, "=", resultado)

elif(operacao == "-"):
    resultado= num1-num2
    print(num1, "-", num2, "=", resultado)

elif(operacao == "*"):
    resultado = num1*num2
    print(num1, "*", num2, "=", resultado)

elif(operacao == "/"):
    if(num2 == 0):
        print("Não é possível dividir por 0")
    else:
        resultado = num1/num2
        print(num1, "/", num2, "=", resultado)

else:
    print("Operação inválida")