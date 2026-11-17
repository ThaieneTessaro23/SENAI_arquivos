tabuleiro = [
    ["","",""],
    ["","",""],
    ["","",""],
]

jogadorAtual = "X"
numeroJogadas = 0
jogoAtivo = True

while(jogoAtivo):
    posicaoLinha = int(input("Digite a posição da linha: "))
    posicaoColuna = int(input("Digite a posicao da coluna: "))

    if(posicaoLinha >= 0 and posicaoLinha <= 2
        and posicaoColuna >= 0 and posicaoColuna <= 2):

        if(tabuleiro[posicaoLinha][posicaoColuna] == ""):
            numeroJogadas += 1
            tabuleiro[posicaoLinha][posicaoColuna] = jogadorAtual

        else:
            print("Essa posição já está ocupada!")
            continue
    
    else:
        print("Posição inválida!")
        continue

    for i in range(3):
        #Comparando o vencedor pela LINHA
        if(tabuleiro[i][0] != "" and tabuleiro[i][0] == tabuleiro[i][1] and tabuleiro[i][1] == tabuleiro[i][2]):
            print(f"{jogadorAtual} venceu! 🪅🪩")
            jogoAtivo = False

        #Comparando o vencedor pela COLUNA
        if(tabuleiro[0][i] != "" and tabuleiro[0][i] == tabuleiro[1][i] and tabuleiro[1][i] == tabuleiro[2][i]):
            print(f"{jogadorAtual} venceu! 🪅🪩")
            jogoAtivo = False

    #Comparando o vencedor pela DIAGONAL PRINCIPAL
    if(tabuleiro[0][0] != "" and tabuleiro[0][0] == tabuleiro[1][1] and tabuleiro[1][1] == tabuleiro[2][2]):
        print(f"{jogadorAtual} venceu! 🪅🪩")
        jogoAtivo = False

    #Comparando o vencedor pela DIAGONAL SECUNDÁRIA
    if(tabuleiro[2][0] != "" and tabuleiro[2][0] == tabuleiro[1][1] and tabuleiro[1][1] == tabuleiro[0][2]):
        print(f"{jogadorAtual} venceu! 🪅🪩")
        jogoAtivo = False

    if(jogadorAtual == "X"):
        jogadorAtual = "O"
    else:
        jogadorAtual = "X"

    for linha in tabuleiro:
        print(linha)

    if(numeroJogadas == 9):
        print("Deu velha! 🤶☠️")
        jogoAtivo = False