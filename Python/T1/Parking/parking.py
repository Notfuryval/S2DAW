import math
from datetime import datetime

NUM_PLAZAS = 20
TARIFA_MINUTO = 0.05


class ParkingError(Exception):
    """Error propio de la gestión del parking."""


class Plaza:
    def __init__(self, numero):
        self.numero = numero
        self.matricula = None
        self.hora_entrada = None

    def esta_libre(self):
        return self.matricula is None

    def __str__(self):
        if self.esta_libre():
            return f"Plaza {self.numero:02d}: LIBRE"

        return f"Plaza {self.numero:02d}: OCUPADA - {self.matricula}"


class Parking:
    def __init__(self):
        self.plazas = []
        self.recaudacion = 0.0

        for numero in range(1, NUM_PLAZAS + 1):
            self.plazas.append(Plaza(numero))

    def buscar_por_matricula(self, matricula):
        matricula = matricula.strip().upper()

        for plaza in self.plazas:
            if plaza.matricula == matricula:
                return plaza

        return None

    def buscar_plaza_libre(self):
        for plaza in self.plazas:
            if plaza.esta_libre():
                return plaza

        return None

    def contar_libres(self):
        contador = 0

        for plaza in self.plazas:
            if plaza.esta_libre():
                contador += 1

        return contador

    def entrada(self, matricula):
        matricula = matricula.strip().upper()

        if matricula == "":
            raise ParkingError("La matrícula no puede estar vacía.")

        if self.buscar_por_matricula(matricula) is not None:
            raise ParkingError(
                f"El coche con matrícula {matricula} ya está en el parking."
            )

        plaza = self.buscar_plaza_libre()

        if plaza is None:
            raise ParkingError("El parking está lleno.")

        plaza.matricula = matricula
        plaza.hora_entrada = datetime.now()

        return plaza

    def salida(self, matricula):
        matricula = matricula.strip().upper()

        if matricula == "":
            raise ParkingError("La matrícula no puede estar vacía.")

        plaza = self.buscar_por_matricula(matricula)

        if plaza is None:
            raise ParkingError(f"No hay ningún coche con matrícula {matricula}.")

        hora_salida = datetime.now()
        segundos = (hora_salida - plaza.hora_entrada).total_seconds()

        minutos = max(1, math.ceil(segundos / 60))
        importe = round(minutos * TARIFA_MINUTO, 2)

        self.recaudacion = round(self.recaudacion + importe, 2)

        plaza.matricula = None
        plaza.hora_entrada = None

        return minutos, importe
