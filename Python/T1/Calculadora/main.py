from Entrada import pedir_numero, pedir_operacion

from operaciones import calcular


def main():
    # METO CUCHILLO
    a = pedir_numero()
    # SACO TRIPAS
    operacion = pedir_operacion()
    b = pedir_numero()
    resultado = calcular(a, b, operacion)

    if resultado is not None:
        print(f"Resultado: {resultado}")
    else:
        print("Operación no válida o división por cero.")


if __name__ == "__main__":
    main()
