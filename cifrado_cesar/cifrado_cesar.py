"""
Cifrado y descifrado César.
- Cifrar: desplaza cada letra N posiciones hacia adelante.
- Descifrar: desplaza cada letra N posiciones hacia atrás.
- Si no conoces la clave, la opción 3 prueba todos los desplazamientos.
"""
ALFABETO = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  # Puedes añadir la Ñ: "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"

def cifrar(texto, desplazamiento):
   resultado = ""
   n = len(ALFABETO)
   for caracter in texto:
       mayuscula = caracter.upper()
       if mayuscula in ALFABETO:
           indice = (ALFABETO.index(mayuscula) + desplazamiento) % n
           nueva = ALFABETO[indice]
           # Conserva minúsculas/mayúsculas
           resultado += nueva if caracter.isupper() else nueva.lower()
       else:
           # Espacios, números y signos se dejan igual
           resultado += caracter
   return resultado

def descifrar(texto, desplazamiento):
   return cifrar(texto, -desplazamiento)

def fuerza_bruta(texto):
   """Muestra el texto descifrado con todas las claves posibles."""
   print("\nPosibles resultados:")
   for clave in range(1, len(ALFABETO)):
       print(f"Clave {clave:2}: {descifrar(texto, clave)}")

def pedir_clave():
   while True:
       try:
           return int(input("Desplazamiento (ej. 3): "))
       except ValueError:
           print("Escribe un número entero.")

# Programa principal
while True:
   print("\n=== CIFRADO CÉSAR ===")
   print("1. Cifrar un mensaje")
   print("2. Descifrar (conozco la clave)")
   print("3. Salir")
   opcion = input("Elige una opción: ").strip()
   if opcion == "1":
       texto = input("Mensaje a cifrar: ")
       clave = pedir_clave()
       print("Mensaje cifrado:", cifrar(texto, clave))
   elif opcion == "2":
       texto = input("Mensaje cifrado: ")
       clave = pedir_clave()
       print("Mensaje original:", descifrar(texto, clave))
   elif opcion == "3":
       print("¡Hasta luego!")
       break
   else:
       print("Opción no válida.")