idade = int(input("Digite sua idade: "))
contribuicao = int(input("Digite seu tempo de contribuição: "))

if(idade >= 60 and contribuicao >= 30):
    print("Você pode se aposentar!")
else:
    print("Você NÃO pode se aposentar!")