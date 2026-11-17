#normal
num = int(input("Insira um número para fatorar: "))
fatorial = 1

for i in range(1, num+1):
   fatorial = fatorial*i
print(num,"! = ",fatorial)

#desafio
num = int(input("Insira um número para fatorar: "))
fatorial = 1

for i in range(num, 0, -1):
   fatorial = fatorial*i
print(num,"! = ",fatorial)