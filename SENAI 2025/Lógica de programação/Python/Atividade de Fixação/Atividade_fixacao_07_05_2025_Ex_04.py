produto = float(input("Digite o valor do produto: "))
desconto = float(input("Digite o valor do desconto: "))

valor_com_desconto = produto - ((produto*desconto)/100)

print("O novo valor com desconto é",valor_com_desconto)