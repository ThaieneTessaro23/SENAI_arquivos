Senha_usuário = ""
Senha_correta = "python123"

while (Senha_usuário != Senha_correta):
    Senha_usuário = input("Digite a senha: ")
    if(Senha_usuário != Senha_correta):
        print("Senha incorreta. Tente novamente.")

print("Acesso permitido.")