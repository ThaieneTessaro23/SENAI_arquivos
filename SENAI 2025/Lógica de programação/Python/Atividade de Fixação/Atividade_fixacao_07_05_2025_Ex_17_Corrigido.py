#17 Peça 5 números e informe quantos são maiores que 10.
numeros = []
maiores = 0

for i in range(5):
    numeros.append(int(input(f"Digite o {i+1}º: ")))

for i in numeros:
    if(i > 10):
        maiores = maiores + 1
    
print(maiores, " números são maiores que 10")