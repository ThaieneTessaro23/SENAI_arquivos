notas = []
for i in range(4):
    #Tenta salvar a nota - executar o bloco
    try:
        nota = float(input(f"Digite a {i+1}ª nota: "))
        if nota < 0 or nota > 10:
            print("Nota inválida. Insira um valor entre 0 e 10!")
            exit()
        else:
            notas.append(nota)
    except ValueError:
        print("Erro: Digite um número válido!")
        exit()

#Verifica se todas as notas foram inseridas
if not notas:
    print("ERRO: Nenhuma nota inserida!")
else:
    media = sum(notas) / len(notas)

    if media >= 7:
        print(f"Média: {media} - Aprovado 😁")
    elif media >= 5 and media < 7:
        print(f"Média: {media} - Recuperação 🥲")
    else:
        print(f"Média: {media} - Reprovado 😵")