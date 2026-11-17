ValorCompra = float(input("Qual o valor da sua compra? "))
TemDesconto = input("Possui cupom? Digite S para sim e N para não: ")

if(ValorCompra >= 200 or TemDesconto == "S"):
    print("Você ganhou um desconto de 15%! 😘")
else:
    print("Você não tem direito a descontos no momento 🥲")