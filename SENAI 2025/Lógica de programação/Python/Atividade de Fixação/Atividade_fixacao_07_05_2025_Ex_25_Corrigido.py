#25. Leia uma palavra e exiba quantas letras, quantas vogais e quantas consoantes ela contém.
palavra = input("Digite sua palavra: ")
vogais = "AEIOUaeiouãâáàêèéîíìõôóòûúùüÃÂÁÀÊÉÈÎÍÌÔÓÕÒÛÚÙÜ"
consoantes = "BCDFGHJKLMNPQRSTVWXYZÇbcdfghjklmnpqrstvwxyzç"
qtdLetras = 0
qtdVogal = 0
qtdConsoante = 0

for letra in palavra:
    qtdLetras += 1
    for vogal in vogais:
        if (letra == vogal):
            qtdVogal += 1
    for consoante in consoantes:
        if (letra == consoante):
            qtdConsoante += 1

print(f"Sua palavra tem {qtdLetras} letras, {qtdVogal} vogais e {qtdConsoante} consoantes.")