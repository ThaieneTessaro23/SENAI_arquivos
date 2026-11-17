#23. Leia a idade de 10 pessoas e exiba quantas são maiores de 18 anos.
qtde = 0
idade = 0
for i in range(1,11):
    idade = int(input("Digite a idade dessas pessoas: "))
    if idade>=18:
        qtde = qtde + 1

print(f"{qtde} dessas pessoas são maiores de 18 anos.")