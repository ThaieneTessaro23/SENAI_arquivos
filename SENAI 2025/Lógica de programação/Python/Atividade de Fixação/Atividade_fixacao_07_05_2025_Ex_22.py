#22. Leia uma sequência de números positivos até que o usuário digite um número negativo. Exiba a quantidade total e a média.
num = 0
quant_total = 0
media = 0
soma = 0

while(num >= 0):
    num = int(input("Digite um número: "))
    quant_total = quant_total + 1
    soma = soma + num

media = soma/quant_total
print("A quantidade total de números digitados é",quant_total,"e a média é",media)