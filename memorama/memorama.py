"""
Memorama con arreglos de numpy.
- Las cartas ocultas se muestran con "?".
- Eliges dos cartas (fila y columna) para ver qué esconden.
- Si son iguales, el par queda descubierto; si no, se vuelven a ocultar.
- Ganas cuando descubres todos los pares.
"""
import numpy as np
FILAS = 2
COLUMNAS = 4

def crear_tablero(filas, columnas):
   """Crea un arreglo numpy con pares de letras revueltas."""
   num_pares = (filas * columnas) // 2
   simbolos = np.array(list("ABCDEFGHIJKLMNOPQRSTUVWXYZ")[:num_pares])
   cartas = np.concatenate([simbolos, simbolos])  # cada símbolo dos veces
   np.random.shuffle(cartas)
   return cartas.reshape(filas, columnas)

def mostrar(cartas, descubiertas):
   """Muestra el símbolo si está descubierta y '?' si está oculta."""
   vista = np.where(descubiertas, cartas, "?")
   print("\n    " + "  ".join(str(c) for c in range(cartas.shape[1])))
   for f in range(cartas.shape[0]):
       print(f"{f} | " + "  ".join(vista[f]))

def pedir_carta(descubiertas, mensaje):
   """Pide fila y columna de una carta que siga oculta."""
   filas, columnas = descubiertas.shape
   while True:
       entrada = input(f"{mensaje} (fila columna, ej. 0 2): ").split()
       if len(entrada) != 2 or not all(x.isdigit() for x in entrada):
           print("Escribe dos números separados por un espacio.")
           continue
       f, c = int(entrada[0]), int(entrada[1])
       if not (0 <= f < filas and 0 <= c < columnas):
           print("Esa posición no existe.")
       elif descubiertas[f, c]:
           print("Esa carta ya está descubierta.")
       else:
           return f, c

# Programa principal
print("=== MEMORAMA ===")
print("Encuentra todos los pares. Las cartas ocultas se ven como '?'.")
cartas = crear_tablero(FILAS, COLUMNAS)
descubiertas = np.zeros((FILAS, COLUMNAS), dtype=bool)  # False = oculta
intentos = 0
while not descubiertas.all():
   mostrar(cartas, descubiertas)
   f1, c1 = pedir_carta(descubiertas, "Primera carta")
   descubiertas[f1, c1] = True
   mostrar(cartas, descubiertas)
   f2, c2 = pedir_carta(descubiertas, "Segunda carta")
   descubiertas[f2, c2] = True
   mostrar(cartas, descubiertas)
   intentos += 1
   if cartas[f1, c1] == cartas[f2, c2]:
       print(f"¡Par encontrado! ({cartas[f1, c1]})")
   else:
       print("No son iguales. Se vuelven a ocultar.")
       input("Presiona Enter para continuar...")
       descubiertas[f1, c1] = False
       descubiertas[f2, c2] = False
print(f"\n¡Ganaste! Encontraste todos los pares en {intentos} intentos.")