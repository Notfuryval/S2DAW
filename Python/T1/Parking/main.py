from parking import Parking, ParkingError


def main():
    parking = Parking()
    opcion = ""

    while opcion != "4":
        print("\n===== MENÚ DEL PARKING =====")
        print("1. Registrar entrada")
        print("2. Registrar salida")
        print("3. Mostrar estado del parking")
        print("4. Salir")

        opcion = input("Elige una opción: ").strip()

        try:
            if opcion == "1":
                matricula = input("Matrícula del coche: ")
                plaza = parking.entrada(matricula)

                print(
                    f"Coche {plaza.matricula} aparcado en la plaza {plaza.numero:02d}."
                )

            elif opcion == "2":
                matricula = input("Matrícula del coche: ")
                minutos, importe = parking.salida(matricula)

                print(f"Tiempo estacionado: {minutos} min.")
                print(f"Importe a pagar: {importe:.2f} €")

            elif opcion == "3":
                print("\n===== ESTADO DEL PARKING =====")

                for plaza in parking.plazas:
                    print(plaza)

                libres = parking.contar_libres()
                print(f"Plazas libres: {libres}")

            elif opcion == "4":
                print(f"\nRecaudación total: {parking.recaudacion:.2f} €")
                print("Programa finalizado.")

            else:
                print("Opción no válida. Elige entre 1 y 4.")

        except ParkingError as error:
            print(f"Error: {error}")


if __name__ == "__main__":
    main()
