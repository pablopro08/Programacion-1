import re
import unicodedata
 
VOCALES = "AEIOU"
CONSONANTES = "BCDFGHJKLMNÑPQRSTVWXYZ"
 
# Tabla de valores oficial usada para calcular el digito verificador.
TABLA_VALORES = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
 
# Lista PARCIAL de combinaciones de 4 letras que SEGOB sustituye
PALABRAS_INCONVENIENTES = {
    "BUEI", "BUEY", "CACA", "CACO", "CAGA", "CAGO", "CAKA", "CAKO",
    "COGE", "COJA", "COJE", "COJI", "COJO", "COLA", "CULO", "FALO",
    "FETO", "GETA", "GUEY", "JOTO", "KACA", "KACO", "KAGA", "KAGO",
    "KOGE", "KOJO", "KAKA", "KULO", "LILO", "LOCA", "LOCO", "LOKA",
    "LOKO", "MAME", "MAMO", "MEAR", "MEAS", "MEON", "MION", "MOCO",
    "MOKO", "MULA", "MULO", "NACA", "NACO", "PEDA", "PEDO", "PENE",
    "PUTA", "PUTO", "QULO", "RATA", "RUIN", "SENO", "TETA", "VACA",
    "VAGA", "VAGO", "VAKA", "VUEI", "VUEY", "WUEY", "WUEI",
}
 
# Primer nombre / abreviaturas que se "saltan" para usar el segundo nombre.
# (Las abreviaturas con punto, p. ej. "MA.", quedan igual que "MA" una vez
# que limpiar_texto() quita los puntos.)
NOMBRES_QUE_SE_OMITEN = {"MARIA", "MA", "JOSE", "J"}
 
# Claves de entidad federativa (posiciones 12-13) usadas en el CURP.
ESTADOS_CURP = {
    "1": ("Aguascalientes", "AS"), "2": ("Baja California", "BC"),
    "3": ("Baja California Sur", "BS"), "4": ("Campeche", "CC"),
    "5": ("Coahuila", "CL"), "6": ("Colima", "CM"),
    "7": ("Chiapas", "CS"), "8": ("Chihuahua", "CH"),
    "9": ("Ciudad de Mexico", "DF"), "10": ("Durango", "DG"),
    "11": ("Guanajuato", "GT"), "12": ("Guerrero", "GR"),
    "13": ("Hidalgo", "HG"), "14": ("Jalisco", "JC"),
    "15": ("Estado de Mexico", "MC"), "16": ("Michoacan", "MN"),
    "17": ("Morelos", "MS"), "18": ("Nayarit", "NT"),
    "19": ("Nuevo Leon", "NL"), "20": ("Oaxaca", "OC"),
    "21": ("Puebla", "PL"), "22": ("Queretaro", "QO"),
    "23": ("Quintana Roo", "QR"), "24": ("San Luis Potosi", "SP"),
    "25": ("Sinaloa", "SL"), "26": ("Sonora", "SR"),
    "27": ("Tabasco", "TC"), "28": ("Tamaulipas", "TS"),
    "29": ("Tlaxcala", "TL"), "30": ("Veracruz", "VZ"),
    "31": ("Yucatan", "YN"), "32": ("Zacatecas", "ZS"),
    "33": ("Nacido en el extranjero", "NE"),
}
 
 
# Utilidades de entrada (interaccion con el usuario)
 
 
def input_nombre_obligatorio(mensaje):
    """Pide un nombre/apellido y no deja avanzar si, ya limpio (sin
    acentos, espacios ni caracteres que no sean letras), queda vacio."""
    valor = limpiar_texto(input(mensaje))
    while valor == "":
        print("ERROR, este campo es obligatorio y debe contener letras")
        print()
        valor = limpiar_texto(input(mensaje))
    return valor
 
 
def input_nombre_opcional(mensaje):
    """Pide un nombre/apellido opcional. Si queda vacio, se usa 'X'."""
    valor = limpiar_texto(input(mensaje))
    return valor if valor != "" else "X"
 
 
def input_entero(mensaje, minimo=None, maximo=None):
    """Pide un entero, validando que sea numerico y que caiga en rango."""
    while True:
        valor = input(mensaje).strip()
        try:
            numero = int(valor)
        except ValueError:
            print("ERROR, debes ingresar un numero entero")
            print()
            continue
        if minimo is not None and numero < minimo:
            print(f"ERROR, el valor debe ser mayor o igual a {minimo}")
            print()
            continue
        if maximo is not None and numero > maximo:
            print(f"ERROR, el valor debe ser menor o igual a {maximo}")
            print()
            continue
        return numero
 
 
def pedir_sexo():
    while True:
        sexo = input("Ingresa tu sexo (H = Hombre, M = Mujer) ").strip().upper()
        if sexo in ("H", "M"):
            return sexo
        print("ERROR, ingresa H o M")
        print()
 
 
def elegir_estado():
    print("LISTA DE ESTADOS DEL PAIS")
    for clave in sorted(ESTADOS_CURP, key=int):
        nombre_estado, _ = ESTADOS_CURP[clave]
        print(f"{clave}. {nombre_estado}")
    while True:
        clave = input("Ingresa el numero del estado en el que naciste ").strip()
        if clave in ESTADOS_CURP:
            return ESTADOS_CURP[clave]
        print("ERROR, ingresa una opcion valida de la lista")
        print()
 
 
# Utilidades de texto
 
 
def quitar_acentos(texto):
    """Quita acentos (a, e, i, o, u) PERO conserva la Ñ/ñ como letra
    propia. Importante: normalize('NFD') descompone 'Ñ' en 'N' + tilde
    combinante, y si se borra esa tilde junto con los demas acentos se
    pierde la Ñ (se vuelve 'N'), lo cual es incorrecto para la CURP."""
    resultado = []
    for caracter in unicodedata.normalize("NFD", texto):
        if caracter == "\u0303" and resultado and resultado[-1] in ("n", "N"):
            # Combina la tilde con la n/N anterior para reconstruir ñ/Ñ.
            resultado[-1] = "ñ" if resultado[-1] == "n" else "Ñ"
            continue
        if unicodedata.combining(caracter):
            continue  # cualquier otro acento se descarta
        resultado.append(caracter)
    return "".join(resultado)
 
 
def limpiar_texto(texto):
    """Deja solo letras (A-Z, Ñ) en mayusculas, sin acentos ni espacios."""
    texto = quitar_acentos(texto).upper()
    return re.sub(r"[^A-ZÑ]", "", texto)
 
 
def letra_valida(letra):
    """Regla oficial: si la letra inicial es Ñ, se sustituye por X."""
    return "X" if letra == "Ñ" else letra
 
 
def primera_vocal_interna(palabra):
    """Primera vocal a partir de la SEGUNDA letra. 'X' si no hay ninguna."""
    for letra in palabra[1:]:
        if letra in VOCALES:
            return letra
    return "X"
 
 
def primera_consonante_interna(palabra):
    """Primera consonante a partir de la segunda letra. 'X' si no hay
    ninguna, y tambien 'X' si esa consonante es Ñ (regla oficial)."""
    for letra in palabra[1:]:
        if letra in CONSONANTES:
            return "X" if letra == "Ñ" else letra
    return "X"
 
 
# Logica de fecha
 
 
def dias_en_mes(mes, anio):
    if mes in (1, 3, 5, 7, 8, 10, 12):
        return 31
    if mes in (4, 6, 9, 11):
        return 30
    bisiesto = (anio % 4 == 0 and anio % 100 != 0) or anio % 400 == 0
    return 29 if bisiesto else 28
 
 
# Construccion de la curp
 
 
def elegir_nombre_para_clave(nombre1, nombre2):
    """Determina que nombre se usa en las posiciones 4 y 16: el primer
    nombre, salvo que sea MARIA, MA, JOSE o J (abreviaturas incluidas) y
    exista un segundo nombre; en ese caso se usa el segundo nombre."""
    if nombre1 in NOMBRES_QUE_SE_OMITEN and nombre2 != "X":
        return nombre2
    return nombre1
 
 
def primeros_cuatro_caracteres(apellido1, apellido2, nombre_usado):
    """Posiciones 1-4: inicial y vocal interna del apellido1, inicial del
    apellido2, inicial del nombre elegido. Aplica Ñ->X y el filtro de
    palabras altisonantes."""
    letra1 = letra_valida(apellido1[0])
    letra2 = primera_vocal_interna(apellido1)
    letra3 = letra_valida(apellido2[0])
    letra4 = letra_valida(nombre_usado[0])
 
    cuatro = letra1 + letra2 + letra3 + letra4
 
    if cuatro in PALABRAS_INCONVENIENTES:
        # Regla oficial: se sustituye la SEGUNDA letra, no la primera jeje.
        cuatro = cuatro[0] + "X" + cuatro[2:]
 
    return cuatro
 
 
def fecha_nacimiento(anio, mes, dia):
    """Posiciones 5-10: AAMMDD con ceros a la izquierda en mes y dia."""
    return f"{str(anio)[2:]}{str(mes).zfill(2)}{str(dia).zfill(2)}"
 
 
def clave_consonantes_internas(apellido1, apellido2, nombre_usado):
    """Posiciones 14-16: primera consonante interna de apellido1,
    apellido2 y del nombre elegido (mismo criterio MARIA/JOSE que en la
    posicion 4)."""
    c1 = primera_consonante_interna(apellido1)
    c2 = primera_consonante_interna(apellido2)
    c3 = primera_consonante_interna(nombre_usado)
    return c1 + c2 + c3
 
 
def primeros_16_caracteres(apellido1, apellido2, nombre1, nombre2,
                            anio, mes, dia, sexo, clave_entidad):
    """Arma la cadena con los primeros 16 caracteres de la CURP siguiendo
    los lineamientos de SEGOB."""
    nombre_usado = elegir_nombre_para_clave(nombre1, nombre2)
 
    parte_1_4 = primeros_cuatro_caracteres(apellido1, apellido2, nombre_usado)
    parte_5_10 = fecha_nacimiento(anio, mes, dia)
    parte_11 = sexo
    parte_12_13 = clave_entidad
    parte_14_16 = clave_consonantes_internas(apellido1, apellido2, nombre_usado)
 
    return parte_1_4 + parte_5_10 + parte_11 + parte_12_13 + parte_14_16
 
 
def digito_verificador(curp_17):
    """Calcula el digito verificador (posicion 18) con el algoritmo oficial."""
    suma = 0
    for posicion, caracter in enumerate(curp_17):  
        valor = TABLA_VALORES.index(caracter)
        peso = 17 - posicion 
        suma += valor * peso
    residuo = suma % 10
    return str((10 - residuo) % 10)
 
 
def generar_curp(apellido1, apellido2, nombre1, nombre2, anio, mes, dia, sexo, clave_entidad):
    curp_16 = primeros_16_caracteres(
        apellido1, apellido2, nombre1, nombre2, anio, mes, dia, sexo, clave_entidad
    )
    diferenciador = "0" if anio < 2000 else "A"
    curp_17 = curp_16 + diferenciador
    digito = digito_verificador(curp_17)
    return curp_17 + digito
 
 
# Programa principal
 
 
def main():
    apellido1 = input_nombre_obligatorio("Ingresa tu primer apellido ")
    apellido2 = input_nombre_opcional("Ingresa tu segundo apellido (si existe) ")
    nombre1 = input_nombre_obligatorio("Ingresa tu primer nombre ")
    nombre2 = input_nombre_opcional("Ingresa tu segundo nombre (si existe) ")
 
    anio = input_entero(
        "Ingresa el año de nacimiento en el intervalo [1900,2026] ",
        minimo=1900, maximo=2026,
    )
 
    mes = input_entero("Inserta el mes de nacimiento (1-12) ", minimo=1, maximo=12)
 
    numdias = dias_en_mes(mes, anio)
    dia = input_entero(f"Inserta el dia de nacimiento (1-{numdias}) ", minimo=1, maximo=numdias)
 
    sexo = pedir_sexo()
    nombre_estado = elegir_estado()
 
    curp = generar_curp(apellido1, apellido2, nombre1, nombre2, anio, mes, dia, sexo, clave_entidad)
 
    print()
    print(f"Estado de nacimiento: {nombre_estado}")
    print(f"CURP generada: {curp}")
 
 
if __name__ == "__main__":
    main()