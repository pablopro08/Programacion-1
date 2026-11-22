# velazquez encinas pablo isaac
print("Este programa dibuja un rombo usando el caracter que tú elijas.")
print("Tú decides el tamaño (n) y el caracter con el que se dibuja.")
print()

n = 0
while n < 1 or n > 20:
    dato = input("Ingresa el valor de n [1,20] ")
    if not dato.lstrip("-").isdigit():
        print("Error: '" + dato + "' no es un número entero. Escribe solo dígitos, por ejemplo 5.")
    else:
        n = int(dato)
        if n < 1 or n > 20:
            print("Error: n =", n, "está fuera del rango permitido [1,20]")


caracter = ""
while len(caracter) != 1 or caracter == " ":
    caracter = input("Ingresa el caracter para dibujar (un solo caracter, no espacio): ")
    if len(caracter) == 0:
        print("Error: no escribiste nada. Debes ingresar un caracter.")
    elif len(caracter) > 1:
        print("Error: escribiste", len(caracter), "caracteres. Debes ingresar solo uno.")
    elif caracter == " ":
        print("Error: el espacio no se ve en el dibujo. Elige otro caracter, por ejemplo *.")

print()


for i in range(1, n + 1):
    espacios = n - i
    cantidad = 2 * i - 1
    print(" " * espacios + caracter * cantidad)


for i in range(n - 1, 0, -1):
    espacios = n - i
    cantidad = 2 * i - 1
    print(" " * espacios + caracter * cantidad)