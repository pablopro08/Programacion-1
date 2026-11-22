def calcular(num1, operador, num2):
    if operador == "+":
        return num1 + num2
    if operador == "-":
        return num1 - num2
    if operador == "*":
        return num1 * num2
    if operador == "/":
        if num2 == 0:
            raise ZeroDivisionError("No se puede dividir entre cero")
        return num1 / num2
    raise ValueError("Operador no válido")


while True:
    try:
        num1 = float(input("Primer número: "))
        operador = input("Operación (+, -, *, /): ").strip()
        num2 = float(input("Segundo número: "))
        print("Resultado:", calcular(num1, operador, num2))
    except (ValueError, ZeroDivisionError) as error:
        print("Error:", error)

    continuar = input("¿Deseas realizar otra operación? (s/n): ").strip().lower()
    if continuar != "s":
        break
