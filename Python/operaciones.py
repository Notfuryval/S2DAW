# Yo que se, una calculadora


def calcular(a, b, operacion):
    # Suma
    if operacion == "+":
        return a + b
    # Resta
    elif operacion == "-":
        return a - b
    # Multiplicacion
    elif operacion == "*":
        return a * b
    # Division
    elif operacion == "/":
        if b != 0:
            return a / b
        else:
            return None  # Si la división es entre 0
    else:
        return None
