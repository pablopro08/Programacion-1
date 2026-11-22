"""
Juego de luces en 1D.
- Las luces están en un arreglo de una dimensión: 0 = apagada, 1 = encendida.
- Al elegir una posición, esa luz se apaga y sus vecinas inmediatas cambian de estado.
- Ganas cuando todas las luces están apagadas.
"""
import random

def crear_tablero(tamano):
   """Parte de un arreglo nulo (todo apagado) y enciende luces al azar.
   Con estas reglas cualquier tablero tiene solución."""
   luces = [0] * tamano
   while todas_apagadas(luces):
       luces = [random.randint(0, 1) for _ in range(tamano)]
   return luces

def cambiar(luces, posicion):
   """Apaga la luz elegida e invierte sus vecinas (si existen)."""
   luces[posicion] = 0
   for i in (posicion - 1, posicion + 1):
       if 0 <= i < len(luces):
           luces[i] = 1 - luces[i]

def todas_apagadas(luces):
   return all(luz == 0 for luz in luces)

def mostrar(luces):
   posiciones = " ".join(f"{i:2}" for i in range(len(luces)))
   estados = " ".join(f"{luz:2}" for luz in luces)
   print("\nPosición:", posiciones)
   print("Estado:  ", estados)

def pedir_posicion(tamano):
   while True:
       entrada = input(f"Elige una posición (0-{tamano - 1}) o 'q' para salir: ").strip()
       if entrada.lower() == "q":
           return None
       if entrada.isdigit() and 0 <= int(entrada) < tamano:
           return int(entrada)
       print("Posición no válida.")

# Programa principal
print("=== JUEGO DE LUCES 1D ===")
print("0 = apagada, 1 = encendida. ¡Apaga todas las luces!")
tamano = 7
luces = crear_tablero(tamano)
jugadas = 0
salio = False
while not todas_apagadas(luces):
   mostrar(luces)
   posicion = pedir_posicion(tamano)
   if posicion is None:
       print("Has salido del juego.")
       salio = True
       break
   cambiar(luces, posicion)
   jugadas += 1
if not salio:
   mostrar(luces)
   print(f"\n¡Ganaste! Apagaste todas las luces en {jugadas} jugadas.")