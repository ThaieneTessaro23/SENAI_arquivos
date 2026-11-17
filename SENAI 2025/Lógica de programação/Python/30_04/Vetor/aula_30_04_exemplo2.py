texto = input("Digite um texto qualquer: ")
qtd_letras = 0
qtd_vogais = 0
vogais = "aeiouAEIOU"     #Pode adicionar "áãâóõô..."

for letra in texto:
    print(letra)
    if(letra != ''):
        qtd_letras += 1      #qtd_letras = qtd_letras + 1
    for vogal in vogais:
        if(letra == vogal):
            qtd_vogais += 1

print("Quantidade de letras: ", qtd_letras)
print("Quantidade de vogais: ", qtd_vogais)

texto_invertido = ""
for i in range(len(texto)-1, -1, -1):     #len = tamanho, quantos caracteres têm, fazendo -1 para descontar o zero
    texto_invertido += texto[i]

print("Texto: ", texto)
print("Invertido: ", texto_invertido)
if(texto == texto_invertido):
    print("É um palíndromo!")
else:
    print("Não é um palíndromo!")
