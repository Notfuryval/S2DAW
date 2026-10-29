# Faltaba importar ParkingError y daba NameError al fallar algo
from parking import Parking, ParkingError


def mostrar_menu():
    print()
    print("===== PARKING =====")
    print("1. Registrar entrada")
    print("2. Registrar salida")
    print("3. Estado del parking")
    print("4. Salir")


def registrar_entrada(parking):
    matricula = input("Matricula: ")
    try:
        numero = parking.entrada(matricula)
        # f-string en vez de concatenar con str()
        print(f"Coche aparcado en la plaza {numero}")
    except ParkingError as e:
        print(f"Error: {e}")


def registrar_salida(parking):
    matricula = input("Matricula: ")
    try:
        minutos, importe = parking.salida(matricula)
        print(f"Tiempo: {minutos} minutos")
        # El importe salia con muchos decimales, ahora se muestra con 2
        print(f"Importe a pagar: {importe:.2f} euros")
    except ParkingError as e:
        print(f"Error: {e}")


def mostrar_estado(parking):
    for linea in parking.estado():
        print(linea)
    print(f"Plazas libres: {parking.libres()}")


def salir(parking):
    print(f"Recaudacion total: {parking.recaudacion:.2f} euros")


# Menu con diccionario en vez de tantos if/elif
ACCIONES = {
    "1": registrar_entrada,
    "2": registrar_salida,
    "3": mostrar_estado,
    "4": salir,
}


def main():
    parking = Parking()
    opcion = ""
    # El while comparaba con "5" y la opcion de salir es la 4, no terminaba nunca
    while opcion != "4":
        mostrar_menu()
        opcion = input("Elige una opcion: ")
        accion = ACCIONES.get(opcion)
        if accion is None:
            print("Opcion no valida")
        else:
            accion(parking)


# Asi el menu solo arranca con python main.py y no al importarlo
if __name__ == "__main__":
    main()
