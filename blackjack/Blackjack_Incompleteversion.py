valores = ["A", "2", "3", "4", "5", "6", "7",
           "8", "9", "10", "J", "Q", "K"]
baraja = []
palos = ["♥", "♦", "♣", "♠"]
import random
for palo in palos: #los valores que se comparan venrian siendo los palos en los valores, ejemplo: corazon:1 y asi sucesivamente
    for valor in valores:
        baraja.append([valor, palo]) #([]) se utiliza para poner 2 valores en 1 solo arreglo.
#print("Numero de cartas: ", len(baraja))

#for carta in baraja:
    #print(carta)

#for carta in baraja:
    #if carta[1] == "♥":
     #   print(carta[0], carta[1])
    #if carta[1] == "♦":
        #print(carta[0],carta[1]) 
#for carta in baraja:
    #if carta[1] == "♥":
        #print (carta)
#for carta in baraja:
    #if carta[1] == "♦":
        #print(carta)
#ases = [carta for carta in baraja if carta[0]=="A"]
#print(ases)
#print(len(ases))
#repetidas = False

#for i in range(len(baraja)):
    #for j in range(i+1, len(baraja)):
        #if baraja[j] == baraja[i]:
            #repetidas = True
            #print("Carta repetidad: ", baraja[i])
#if not repetidas:
    #print("No existen cartas repetidas")
     
#carta_unicas = []

#for carta in baraja:
  #  if carta not in carta_unicas:
 #       carta_unicas.append(carta)
#if len(baraja)==len(carta_unicas):
 #   print("No existen cartas repetidas")
#else:
    #print("Existe cartas repetidas")
#carta = random.choice(baraja)
#print("Carta seleccionada:", carta)
#indice = random.randrange(len(baraja))
#carta = baraja.pop(indice)
#print("Cartas repartida:",carta)
#print("Cartas restantes:",len(baraja))
random.shuffle(baraja)
carta1 = baraja.pop()
carta2 = baraja.pop()
print("Primera carta:",carta1)
print("Segunda carta",carta2)
print(len(baraja))
for cartal in range(len(baraja)):
    random.shuffle(baraja)
    cartal = baraja.pop()
    print(cartal)
    print(len(baraja))