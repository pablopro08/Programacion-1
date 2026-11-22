import random


def rana_game():
    print(" ¡La Rana Aventurera! ")
    print("Atraviesa el río saltando de piedra en piedra.")

    vidas = 3
    distancia = 0
    meta = 10

    while vidas > 0 and distancia < meta:
        print(f"\nDistancia: {distancia}/{meta}  |  Vidas: {'♥' * vidas}")
        print("Elige una piedra: 1, 2 o 3")

        segura = random.randint(1, 3)

        try:
            eleccion = int(input("Tu salto: "))
        except ValueError:
            print("Escribe un número del 1 al 3.")
            continue

        if eleccion not in (1, 2, 3):
            print("Esa piedra no existe.")
        elif eleccion == segura:
            distancia += 1
            print("¡Salto perfecto!")
        else:
            vidas -= 1
            print("¡Splash! La rana cayó al agua.")

    if distancia >= meta:
        print("\n🏆 ¡La rana cruzó el río y ganó la aventura!")
    else:
        print("\n💧 La rana se quedó sin vidas. ¡Inténtalo de nuevo!")


if __name__ == "__main__":
    rana_game()
