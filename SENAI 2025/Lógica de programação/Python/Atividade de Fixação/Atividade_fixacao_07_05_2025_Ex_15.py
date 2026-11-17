num = 2
num_digitado = 0

while(num_digitado != num):
    num_digitado = int(input("Digite um número entre 1 e 10 para acertar a resposta correta: "))
    if(num_digitado < num):
        print("O número da sorte é MAIOR!")
    elif(num_digitado > num):
        print("O número da sorte é MENOR!")

print("Você acertou!😁💕")