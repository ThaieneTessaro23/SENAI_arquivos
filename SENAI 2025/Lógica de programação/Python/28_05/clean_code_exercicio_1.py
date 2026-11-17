numeros = []
for i in range (5):
    #Tenta preencher os números
    try:
        numero = float(input(f"Digite o {i+1} número: "))
        if numero < 0 or numero > 10:
            print("Número inválido. Insira um valor entre 0 e 10!")
            exit()
        else:
            numeros.append(numero)
    except ValueError:
        print("ERRO: Digite um número válido!")
        exit()

#Verifica se todos os 5 números foram inseridos
if not numeros:
    print("ERRO: Nenhum número foi inserido!")
else:
    soma = sum(numeros)
    print(f"O total da soma entre os 5 números é {soma}")