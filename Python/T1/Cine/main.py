from reserva import asignar_butaca, crear_matriz, mostrar_butacas


def main():
    matriz = crear_matriz()
    mostrar_butacas(matriz)
    asignar_butaca(matriz)


if __name__ == "__main__":
    main()
