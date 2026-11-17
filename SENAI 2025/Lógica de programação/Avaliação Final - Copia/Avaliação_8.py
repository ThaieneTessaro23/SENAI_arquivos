numeros = []
soma = 0

for i in range (8):
    numeros.append (int(input(f"Digite o {i+1}º número: ")))

for i in numeros:
    for j in numeros:
        if (i == j):
            soma += 1
    print(f"O número {i} apareceu {soma} vez(es)")
    soma = 0