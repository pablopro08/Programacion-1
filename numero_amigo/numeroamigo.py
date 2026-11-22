#Velazquez Encinas Pablo Isaac
for a in range(1, 2001):

    suma_a = 0
    for d in range(1, a // 2 + 1):
        if a % d == 0:
            suma_a += d

    b = suma_a  
    
    suma_b = 0
    for d in range(1, b // 2 + 1):
        if b % d == 0:
            suma_b += d


    if b != a and b > 0 and suma_b == a:
        print(a, " Numero Amigo, Su pareja es", b)
    else:
        print(a, " no es numero amigo")