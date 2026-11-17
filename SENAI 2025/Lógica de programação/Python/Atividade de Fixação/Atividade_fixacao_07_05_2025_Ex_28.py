#28. Peça um e-mail e verifique se ele contém o caractere "@" e termina com ".com".
email = input("Digite um e-mail válido: ")
tem_arroba = False
tem_ponto_com = False

for letra in email:
    if(letra == "@"):
        tem_arroba = True

final_email = ""
for i in range(len(email)-4,len(email)):
    final_email = final_email + email[i]

if(final_email == ".com"):
    tem_ponto_com = True

if(tem_ponto_com and tem_arroba):
    print("Você digitou um email válido!")
else:
    print("Você digitou um email inválido!")