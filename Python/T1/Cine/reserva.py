# Tamaño del cine: 12 filas y 20 columnas
FILAS = 12
COLUMNAS = 20


def pedir_butaca():
    """Pide al usuario una fila y una columna válidas."""
    while True:
        try:
            fila = int(input("Elige la fila de la butaca: "))
            columna = int(input("Elige la columna de la butaca: "))

            # Comprobamos que estén dentro del rango permitido
            if 1 <= fila <= FILAS and 1 <= columna <= COLUMNAS:
                return fila, columna

            print(
                f"La butaca debe estar entre la fila 1-{FILAS} y la columna 1-{COLUMNAS}."
            )

        except ValueError:
            print("Introduce un número válido.")


def crear_matriz():
    """Crea la matriz del cine con los números de fila y columna."""
    matriz = []

    for fila in range(FILAS + 1):
        # La primera fila contiene los números de las columnas
        if fila == 0:
            matriz.append([columna for columna in range(COLUMNAS + 1)])
        else:
            # Cada butaca empieza libre ("L")
            matriz.append([fila] + ["L"] * COLUMNAS)

    return matriz


def mostrar_butacas(matriz):
    """Muestra la matriz por pantalla con un formato alineado."""
    for fila in matriz:
        print("".join(f"{columna:<5}" for columna in fila))


def asignar_butaca(matriz):
    """Asigna una butaca si está libre; si no, vuelve a pedirla."""
    while True:
        fila, columna = pedir_butaca()

        # Comprobamos si la butaca está libre
        if matriz[fila][columna] == "L":
            matriz[fila][columna] = "X"
            print(f"Se te ha asignado la butaca en la fila {fila} y columna {columna}.")
            mostrar_butacas(matriz)
            return

        print("La butaca elegida ya está reservada. Vuelve a intentarlo.")
