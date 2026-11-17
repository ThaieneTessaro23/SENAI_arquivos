num = []
menor = 999999999999999999999999999

for i in range(3):
    num.append(int(input(f"Digite o {i + 1}º número: ")))

for i in range(3):
    if(num[i] < menor):
        menor = num[i]

print("O menor número é: ", menor)