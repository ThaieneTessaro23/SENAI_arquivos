#26. Peça um número inteiro e exiba a soma dos seus dígitos.
num_inteiro = input("Digite um número inteiro: ")
soma = 0

for i in num_inteiro:
    soma = soma + int(i)

print(f"A soma dos digitos de {num_inteiro} é {soma}")