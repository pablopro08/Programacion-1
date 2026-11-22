import random

SALDO_INICIAL = 100


def lineas_carta(valor, palo):

    return [

        "+---------+",

        f"| {valor:<2}      |",

        "|         |",

        f"|    {palo}    |",

        "|         |",

        f"|      {valor:>2} |",

        "+---------+",

    ]


def lineas_carta_oculta():

    return [

        "+---------+",

        "|         |",

        "|         |",

        "|    ?    |",

        "|         |",

        "|         |",

        "+---------+",

    ]


def dibujar_mano(mano, ocultar_segunda=False):

    """Dibuja las cartas una al lado de otra."""

    cartas = []

    for i, carta in enumerate(mano):

        if ocultar_segunda and i == 1:

            cartas.append(lineas_carta_oculta())

        else:

            cartas.append(lineas_carta(carta[0], carta[1]))

    for fila in range(7):

        print("  ".join(c[fila] for c in cartas))


def crear_baraja():

    valores = ["A", "2", "3", "4", "5", "6", "7",

               "8", "9", "10", "J", "Q", "K"]

    palos = ["♥", "♦", "♣", "♠"]

    baraja = []

    for palo in palos:

        for valor in valores:

            baraja.append([valor, palo])

    random.shuffle(baraja)

    return baraja


def calcular_puntuacion(mano):

    puntos = 0

    ases = 0

    for carta in mano:

        valor = carta[0]

        if valor == "A":

            puntos += 11

            ases += 1

        elif valor in ["J", "Q", "K"]:

            puntos += 10

        else:

            puntos += int(valor)

    # Ajustar el valor de los ases

    while puntos > 21 and ases > 0:

        puntos -= 10

        ases -= 1

    return puntos


def es_blackjack(mano):

    """21 con las dos primeras cartas."""

    return len(mano) == 2 and calcular_puntuacion(mano) == 21


def pedir_apuesta(saldo):

    while True:

        entrada = input(f"Tienes ${saldo}. ¿Cuánto quieres apostar? ").strip()

        if not entrada.isdigit():

            print("Escribe una cantidad entera.")

        elif int(entrada) <= 0:

            print("La apuesta debe ser mayor que 0.")

        elif int(entrada) > saldo:

            print("No tienes suficiente dinero para esa apuesta.")

        else:

            return int(entrada)


def mostrar_mesa(jugador, maquina, ocultar_maquina):

    print("\nCartas de la máquina:")

    dibujar_mano(maquina, ocultar_segunda=ocultar_maquina)

    if not ocultar_maquina:

        print(f"Puntuación de la máquina: {calcular_puntuacion(maquina)}")

    print("\nTus cartas:")

    dibujar_mano(jugador)

    print(f"Tu puntuación: {calcular_puntuacion(jugador)}")


# Programa principal

print("=== BLACKJACK CONTRA LA MÁQUINA ===")

print(f"Empiezas con ${SALDO_INICIAL}. La máquina pide carta hasta llegar a 17.")

print("Pagos: ganar 1 a 1, blackjack 3 a 2, empate devuelve tu apuesta.")

saldo = SALDO_INICIAL

ronda = 0

while saldo > 0:

    ronda += 1

    print(f"\n========== RONDA {ronda} ==========")

    apuesta = pedir_apuesta(saldo)

    # Baraja nueva en cada ronda

    baraja = crear_baraja()

    jugador = []

    maquina = []

    for i in range(2):

        jugador.append(baraja.pop())

        maquina.append(baraja.pop())

    mostrar_mesa(jugador, maquina, ocultar_maquina=True)

    # Blackjack natural (21 con las dos primeras cartas)

    if es_blackjack(jugador) or es_blackjack(maquina):

        mostrar_mesa(jugador, maquina, ocultar_maquina=False)

        if es_blackjack(jugador) and es_blackjack(maquina):

            print("Ambos tienen blackjack. Empate, recuperas tu apuesta.")

        elif es_blackjack(jugador):

            ganancia = apuesta * 3 // 2

            saldo += ganancia

            print(f"¡BLACKJACK! Ganas ${ganancia}.")

        else:

            saldo -= apuesta

            print(f"La máquina tiene blackjack. Pierdes ${apuesta}.")

    else:

        # Turno del jugador

        puntuacion_jugador = calcular_puntuacion(jugador)

        jugando = True

        primera_decision = True

        while jugando and puntuacion_jugador < 21:

            puede_doblar = primera_decision and saldo >= apuesta * 2

            opciones = "pedir (p), plantarte (s)"

            if puede_doblar:

                opciones += f" o doblar la apuesta a ${apuesta * 2} (d)"

            decision = input(f"¿Quieres {opciones}? ").strip().lower()

            if decision == "p" or (decision == "d" and puede_doblar):

                if decision == "d":

                    apuesta *= 2

                    print(f"Doblas tu apuesta a ${apuesta}. Recibes solo una carta más.")

                    jugando = False

                jugador.append(baraja.pop())

                puntuacion_jugador = calcular_puntuacion(jugador)

                mostrar_mesa(jugador, maquina, ocultar_maquina=True)

                primera_decision = False

            elif decision == "s":

                print("Te plantas.")

                jugando = False

            else:

                print("Opción inválida.")

        if puntuacion_jugador > 21:

            saldo -= apuesta

            print(f"¡Te pasaste de 21! Pierdes ${apuesta}.")

        else:

            # Turno de la máquina

            print("\n--- Turno de la máquina ---")

            puntuacion_maquina = calcular_puntuacion(maquina)

            while puntuacion_maquina < 17:

                maquina.append(baraja.pop())

                puntuacion_maquina = calcular_puntuacion(maquina)

                print("La máquina pide una carta.")

            mostrar_mesa(jugador, maquina, ocultar_maquina=False)

            # Resultado y pago de la apuesta

            if puntuacion_maquina > 21:

                saldo += apuesta

                print(f"¡La máquina se pasó de 21! Ganas ${apuesta}.")

            elif puntuacion_jugador > puntuacion_maquina:

                saldo += apuesta

                print(f"¡Ganaste! Ganas ${apuesta}.")

            elif puntuacion_jugador < puntuacion_maquina:

                saldo -= apuesta

                print(f"Gana la máquina. Pierdes ${apuesta}.")

            else:

                print("Empate. Recuperas tu apuesta.")

    print(f"Saldo actual: ${saldo}")

    if saldo <= 0:

        print("\nTe quedaste sin dinero. ¡Fin del juego!")

        break

    otra = input("¿Jugar otra ronda? (s/n): ").strip().lower()

    if otra != "s":

        break

resultado = saldo - SALDO_INICIAL

print(f"\nTerminaste con ${saldo} después de {ronda} rondas.")

if resultado > 0:

    print(f"Ganaste ${resultado} en total. ¡Bien jugado!")

elif resultado < 0:

    print(f"Perdiste ${-resultado} en total.")

else:

    print("Quedaste igual que al empezar.")
 
import random

def dibujar_carta(valor, palo):

    print("+---------+")

    print(f"| {valor:<2}      |")

    print("|         |")

    print(f"|    {palo}    |")

    print("|         |")

    print(f"|      {valor:>2} |")

    print("+---------+")

def dibujar_carta_oculta():

    print("+---------+")

    print("|         |")

    print("|         |")

    print("|     ?   |")

    print("|         |")

    print("|         |")

    print("+---------+")


# Crear la baraja

valores = ["A", "2", "3", "4", "5", "6", "7",

           "8", "9", "10", "J", "Q", "K"]

palos = ["♥", "♦", "♣", "♠"]

baraja = []

for palo in palos:

    for valor in valores:

        baraja.append([valor, palo])

# Mezclar la baraja

random.shuffle(baraja)

# Saldo y apuesta (juegas contra la máquina, que es la banca)

saldo = 100

print(f"Tu saldo: ${saldo}")

apuesta = 0

while apuesta <= 0 or apuesta > saldo:

    entrada = input("¿Cuánto quieres apostar? ").strip()

    apuesta = int(entrada) if entrada.isdigit() else 0

    if apuesta <= 0 or apuesta > saldo:

        print(f"Apuesta no válida. Debe ser entre 1 y {saldo}.")

# Crear las manos

jugador = []

banca = []

# Repartir dos cartas a cada participante

for i in range(2):

    jugador.append(baraja.pop())

    banca.append(baraja.pop())

# Mostrar las cartas

print("Cartas del jugador:")

for carta in jugador:

    print(carta[0], carta[1])

print("\nCartas de la banca:")

print(banca[0][0], banca[0][1])

print("Carta oculta")

print("\nCartas restantes:", len(baraja))

print("Cartas del jugador:")

dibujar_carta(jugador[0][0], jugador[0][1])

dibujar_carta(jugador[1][0], jugador[1][1])

print("\nCartas de la banca:")

dibujar_carta(banca[0][0], banca[0][1])

dibujar_carta_oculta()

def calcular_puntuacion(mano):

    puntos = 0

    ases = 0

    for carta in mano:

        valor = carta[0]

        if valor == "A":

            puntos += 11

            ases += 1

        elif valor in ["J", "Q", "K"]:

            puntos += 10

        else:

            puntos += int(valor)

    # Ajustar el valor de los ases

    while puntos > 21 and ases > 0:

        puntos -= 10

        ases -= 1

    return puntos

puntuacion_jugador = calcular_puntuacion(jugador)

jugando = True

while jugando and puntuacion_jugador < 21:

    print(f"Tu puntuación actual es: {puntuacion_jugador}")

    decision = input("¿Quieres pedir otra carta (p) o plantarte (s)? ").strip().lower()

    if decision == 'p':

        nueva_carta = baraja.pop()

        jugador.append(nueva_carta)

        print("\nHas pedido una carta:")

        dibujar_carta(nueva_carta[0], nueva_carta[1])

        puntuacion_jugador = calcular_puntuacion(jugador)

        print("\n--- Tus cartas actuales ---")

        for c in jugador:

            dibujar_carta(c[0], c[1])

    elif decision == 's':

        print("Te plantas.")

        jugando = False

    else:

        print("Opción invalida. Por favor, ingresa 'p' o 's'.")

puntuacion_jugador = calcular_puntuacion(jugador)

print(f"\nFin de tu turno. Tu puntuacion final es: {puntuacion_jugador}")

if puntuacion_jugador > 21:

    print("¡Te has pasado de 21! Has perdido automaticamente.")

    saldo -= apuesta

else:

    # Turno de la banca (la máquina)

    print("\n--- Turno de la banca ---")

    print("La banca revela su carta oculta:")

    for c in banca:

        dibujar_carta(c[0], c[1])

    puntuacion_banca = calcular_puntuacion(banca)

    # La banca pide carta mientras tenga menos de 17

    while puntuacion_banca < 17:

        nueva_carta = baraja.pop()

        banca.append(nueva_carta)

        print("\nLa banca pide una carta:")

        dibujar_carta(nueva_carta[0], nueva_carta[1])

        puntuacion_banca = calcular_puntuacion(banca)

    print(f"\nPuntuación de la banca: {puntuacion_banca}")

    print(f"Tu puntuación: {puntuacion_jugador}")

    # Decidir el resultado y pagar la apuesta

    if puntuacion_banca > 21:

        print("¡La banca se pasó de 21! ¡Ganaste!")

        saldo += apuesta

    elif puntuacion_jugador > puntuacion_banca:

        print("¡Ganaste!")

        saldo += apuesta

    elif puntuacion_jugador < puntuacion_banca:

        print("Gana la banca.")

        saldo -= apuesta

    else:

        print("Empate. Recuperas tu apuesta.")

print(f"Tu saldo final es: ${saldo}")
 