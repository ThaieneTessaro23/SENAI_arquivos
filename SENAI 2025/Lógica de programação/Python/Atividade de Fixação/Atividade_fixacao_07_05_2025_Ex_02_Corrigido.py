num1 = int(input("Digite o 1º número: "))
num2 = int(input("Digite o 2º número: "))

adicao = num1+num2
subtracao = num1-num2
multiplicacao = num1*num2

if(num2 != 0):
    divisao = num1/num2
    resto = num1%num2
else:
    divisao = "Não é possível dividir por zero!"
    resto = "Não é possível dividir por zero!"

print(f"{num1}+{num2}=",adicao)
print(f"{num1}-{num2}=",subtracao)
print(f"{num1}*{num2}=",multiplicacao)
print(f"{num1}/{num2}=",divisao)
print(f"{num1}%{num2}=",resto)