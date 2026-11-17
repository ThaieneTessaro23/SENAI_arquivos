temperatura = int(input("Digite a temperatura em cº: "))

if(temperatura > 30):
    print("Muito quente!")
elif(temperatura <= 30 and temperatura >= 20):
    print("Temperatura ideal")
else:
    print("Frio")