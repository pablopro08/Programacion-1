print("Este programa creara 1 contraseña segura, dicha contraseña debera de tener los siguientes requisitos:\n1-Debera de tener 1 longitud de al menos 10 caracteres.\n2-Debera de tener al menos 1 letra mayuscula\n3-Debera de tener al menos 1 letra minuscula\n4-debera de tener al menos 1 caracter especial")
while True:
    contraseña = input("Escribe una contraseña: ")

    mayuscula = False
    minuscula = False
    numero = False
    especial = False

    for letra in contraseña:
        if letra.isupper():
            mayuscula = True
        if letra.islower():
            minuscula = True
        if letra.isdigit():
            numero = True
        if letra in "!#$%&/()=?¡¿+*}{[]-_.:,;":
            especial = True

    if len(contraseña) >= 10 and mayuscula and minuscula and numero and especial:
        print("La contraseña es segura.")
        break

    print("La contraseña no es segura. Revisa estos requisitos:")

    if len(contraseña) < 10:
        print("- Debe tener al menos 10 caracteres.")
    if not mayuscula:
        print("- Debe incluir una letra mayúscula.")
    if not minuscula:
        print("- Debe incluir una letra minúscula.")
    if not numero:
        print("- Debe incluir un número.")
    if not especial:
        print("- Debe incluir al menos uno de estos símbolos: ! @ # $ % & *")

print("Inténtalo de nuevo.\n")
print("Haz generado 1 contraseña con exito!!")
print(f"Contraseña generada: {contraseña}")
