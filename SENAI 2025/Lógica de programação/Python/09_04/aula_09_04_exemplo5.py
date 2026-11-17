print("Você pode dirigir? Veremos!")
idade = int(input("Qual a sua idade? "))

if(idade >= 18):
    PossuiCarteira = input("Possui CNH? (Digite S para sim e N para não) ")
    if(idade >= 18 and PossuiCarteira == "S"):
        print("Você pode dirigir!") 
    elif(idade >= 18 and PossuiCarteira == "N"):
        print("Você não pode dirigir!")
    else:
        print("Operação inválida!")
else:
    print("Você ainda não pode tiar CNH!")