import numpy as np
import pygame



# Configuracion by Fernando ^_^
Filas, Columnas = 15, 15

TAM = 30
FPS = 5

vacio, snake, manzanas = 0,1,2
Colores = {
    vacio:(30,30,30),
    snake:(50, 200, 80),
    manzanas:(220, 60, 60)
    }

# Como se mueve la viborita usando pygame :p
Direcciones = {
    pygame.K_w: (-1, 0),
    pygame.K_s: (1, 0),
    pygame.K_a: (0, -1),
    pygame.K_d: (0, 1)
    }

def colocar_comida(tablero):
    vacias = np.argwhere(tablero == vacio)
    fila,columna = vacias[np.random.randint(len(vacias))]
    tablero[fila,columna] = manzanas
    
def nuevo_juego():
    tablero = np.zeros((Filas, Columnas), dtype=int)
    inicio = (Filas // 2, Columnas // 2)
    serpiente = [inicio]                     
    tablero[inicio] = snake
    colocar_comida(tablero)
    return tablero, serpiente, (0, 1)        

def avanzar(tablero, serpiente, direccion):
    """Mueve la serpiente un paso. Devuelve False si chocó."""
    fila = serpiente[0][0] + direccion[0]
    col = serpiente[0][1] + direccion[1]

    
    if not (0 <= fila < Filas and 0 <= col < Columnas):
        return False
    if tablero[fila, col] == snake:
        return False

    comio = tablero[fila, col] == manzanas
    serpiente.insert(0, (fila, col))

    if not comio:
        cola = serpiente.pop()               
        tablero[cola] = vacio

    tablero[fila, col] = snake

    if comio:
        colocar_comida(tablero)
    return True

# Interfaz deste
def dibujar(pantalla, tablero):
    for (fila, col), valor in np.ndenumerate(tablero):
        rect = (col * TAM, fila * TAM, TAM - 1, TAM - 1)   
        pygame.draw.rect(pantalla, Colores[valor], rect)


def main():
    pygame.init()
    pantalla = pygame.display.set_mode((Columnas * TAM, Filas * TAM))
    pygame.display.set_caption("viborita")
    reloj = pygame.time.Clock()

    tablero, serpiente, direccion = nuevo_juego()
    siguiente = direccion
    vivo = True
    corriendo = True
    record = 0
    pygame.display.set_caption(f"viborita - Récord: {record}")
    while corriendo:

        for evento in pygame.event.get():
            if evento.type == pygame.QUIT:
                corriendo = False
            elif evento.type == pygame.KEYDOWN:
                if evento.key in Direcciones:
                    nueva = Direcciones[evento.key]

                    if nueva != (-direccion[0], -direccion[1]):
                        siguiente = nueva
                elif evento.key == pygame.K_r and not vivo:
                    tablero, serpiente, direccion = nuevo_juego()
                    siguiente = direccion
                    vivo = True
                    pygame.display.set_caption(f"viborita - Récord: {record}")



        if vivo:
            direccion = siguiente
            if not avanzar(tablero, serpiente, direccion):
                vivo = False
                pygame.display.set_caption(
                    f"Game over - puntos: {len(serpiente) - 1} record: {record} - R para reiniciar"
                )
                puntos = len(serpiente) - 1
                if puntos > record:
                    record = puntos

        dibujar(pantalla, tablero)
        pygame.display.flip()
        reloj.tick(FPS)

    pygame.quit()


if __name__ == "__main__":
    main()
