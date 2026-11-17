#18. Leia uma lista de 5 nomes e um nome extra. Verifique se o nome extra está na lista.
nomes = []
real = False

for i in range(5):
    nomes.append(input(f"Digite o {i+1}º nome: "))

nome = input("Digite o nome extra que deseja encontrar: ")

for i in nomes:
    if(nome == i):
        real = True

if (real == True):
    print(nome, "foi encontrado na lista!")
elif(real == False):
    print(nome, "não foi encontrado")