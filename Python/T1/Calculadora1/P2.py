def pedir_datos():
    while True:
        try:
            numero1 = float(input("Introduce el primer número: "))
            break
        except ValueError:
            print("Error: el primer dato debe ser un número válido.")

    while True:
        operador = input("Introduce una operación (+, -, *, /): ")

        if operador in ["+", "-", "*", "/"]:
            break
        else:
            print("Error: operador no válido.")

    while True:
        try:
            numero2 = float(input("Introduce el segundo número: "))

            if operador == "/" and numero2 == 0:
                print("Error: no se puede dividir entre cero.")
            else:
                break

        except ValueError:
            print("Error: el segundo dato debe ser un número válido.")

    return numero1, operador, numero2


def hacer_operacion(numero1, operador, numero2):
    if operador == "+":
        return numero1 + numero2
    elif operador == "-":
        return numero1 - numero2
    elif operador == "*":
        return numero1 * numero2
    else:
        return numero1 / numero2


def main():
    numero1, operador, numero2 = pedir_datos()
    resultado = hacer_operacion(numero1, operador, numero2)
    if resultado is not None:
        print(f"{numero1} {operador} {numero2} = {resultado}")
