import math
import time

# Creo constantes para no tener numeros desperdigados por el codigo
NUM_PLAZAS = 20
PRECIO_MINUTO_CENTIMOS = 5  # 0,05 centimos por minuto
SEGUNDOS_POR_MINUTO = 60
CENTIMOS_POR_EURO = 100
MIN_MINUTOS = 1


class ParkingError(Exception):
    """Error de negocio del parking (lleno, duplicado, no encontrado...)."""


class Plaza:
    def __init__(self, numero):
        self.numero = numero
        self.matricula = None
        self.hora_entrada = None

    # Faltaban los dos puntos del if y no arrancaba (error de sintaxis)
    def esta_libre(self):
        return self.matricula is None


class Parking:
    def __init__(self):
        self.plazas = []
        # ARREGLADO: habia 10 plazas en vez de 20
        for i in range(NUM_PLAZAS):
            self.plazas.append(Plaza(i + 1))
        # el atributo recaudacion no lo puedo renombrar, lo usan las pruebas
        self.recaudacion = 0
        self._recaudacion_centimos = 0

    # Normalizar no hacia nada, ahora quita espacios y pone mayusculas
    def normalizar(self, matricula):
        return matricula.replace(" ", "").upper()

    def buscar_plaza_libre(self):
        for p in self.plazas:
            if p.esta_libre():
                return p
        return None

    # Este bucle estaba repetido en entrada y salida, lo saco a un metodo
    def _buscar(self, matricula):
        for p in self.plazas:
            if p.matricula == matricula:
                return p
        return None

    def entrada(self, matricula, ahora=None):
        matricula = self.normalizar(matricula)
        # La condicion estaba al revés y el primer coche ya daba duplicado
        if self._buscar(matricula) is not None:
            raise ParkingError(f"La matricula {matricula} ya esta en el parking")
        plaza = self.buscar_plaza_libre()
        if plaza is None:
            raise ParkingError("El parking esta lleno")
        # Usas "matricual" y la plaza quedaba como libre
        plaza.matricula = matricula
        if ahora is None:
            ahora = time.time()
        plaza.hora_entrada = ahora
        return plaza.numero

    def salida(self, matricula, ahora=None):
        matricula = self.normalizar(matricula)
        plaza = self._buscar(matricula)
        if plaza is None:
            raise ParkingError(f"La matricula {matricula} no esta en el parking")
        if ahora is None:
            ahora = time.time()
        # "hora_entrda" estaba mal escrito y daba AttributeError
        segundos = ahora - plaza.hora_entrada
        # Antes cobraba 0 al salir rapido, ahora minimo 1 minuto y redondeo arriba
        minutos = max(MIN_MINUTOS, math.ceil(segundos / SEGUNDOS_POR_MINUTO))
        # Cobraba 5 euros por minuto en vez de 0,05
        importe_centimos = minutos * PRECIO_MINUTO_CENTIMOS
        # La salida no liberaba la plaza y se podia sacar el coche dos veces
        plaza.matricula = None
        plaza.hora_entrada = None
        # Nadie sumaba el importe a la recaudacion, quedaba siempre en 0
        self._recaudacion_centimos += importe_centimos
        self.recaudacion = self._recaudacion_centimos / CENTIMOS_POR_EURO
        return minutos, importe_centimos / CENTIMOS_POR_EURO

    # Contaba las plazas ocupadas en vez de las libres
    def libres(self):
        return sum(1 for p in self.plazas if p.esta_libre())

    # f-strings en vez de concatenar con str()
    def estado(self):
        return [
            f"Plaza {p.numero}: LIBRE"
            if p.esta_libre()
            else f"Plaza {p.numero}: OCUPADA ({p.matricula})"
            for p in self.plazas
        ]
