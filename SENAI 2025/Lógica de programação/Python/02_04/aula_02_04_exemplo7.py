S0 = float(input("Digite a posição inicial: "))
S = float(input("Digite a posição final: "))
T0 = float(input("Digite o tempo inicial: "))
T = float(input("Digite o tempo final: "))

Variacao_S = S - S0
Variacao_T = T - T0

VM = Variacao_S/Variacao_T

print("A velocidade média é: ",VM)