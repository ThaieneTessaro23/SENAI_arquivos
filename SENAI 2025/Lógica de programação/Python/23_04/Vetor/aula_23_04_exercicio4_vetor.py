numeros = []

for i in range(0, 5):
    numeros.append (int(input(f"Digite o {i+1} número: ")))

for i in range(4, -1, -1):
    print(numeros[i])
