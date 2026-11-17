pi = 3.14
raio = float(input("Digite o raio da esfera: "))
Vesfera = (4/3)*pi*raio*raio*raio
print("O volume da esfera é ",Vesfera)

lado = float(input("Digite o lado do cubo: "))
Vcubo = lado*lado*lado
print("O volume do cubo é ",Vcubo) 

raio = float(input("Digite o raio do cilindro: "))
altura = float(input("Digite a altura do cilindro: "))
Vcilindro = pi*raio*raio*altura
print("O volume do cilindro é ",Vcilindro)

raio = float(input("Digite o raio do cone: "))
altura = float(input("Digite a altura do cone: "))
Vcone = (pi*altura*raio*raio)/3
print("O volume do cone é ",Vcone)

altura = float(input("Digite a altura da piramide: "))
lado = float(input("Digite o lado da base da piramide: "))
Vpiramide = ((lado*lado)*altura)/3
print("O volume da piramide é ",Vpiramide)