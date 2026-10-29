"""Pruebas del parking (Fase 2 de la ficha).

Ejecuta:  python pruebas.py
Cada prueba debe acabar en OK. Completa las que dicen PENDIENTE.
Pista: usa el parametro `ahora` (segundos) para simular el paso del tiempo.
"""

import math

from parking import Parking, ParkingError


def prueba_ejemplo():
    """Ejemplo resuelto: primer coche, duplicado y cobro a los 61 segundos."""
    p = Parking()

    # El primer coche va a la plaza 1
    assert p.entrada("1234 abc", ahora=0) == 1

    # La misma matricula escrita de otra forma debe dar error
    try:
        p.entrada("1234ABC", ahora=0)
        assert False, "deberia haber dado error de duplicado"
    except ParkingError:
        pass

    # A los 61 segundos hay que cobrar 2 minutos (redondeo hacia arriba)
    minutos, importe = p.salida("1234ABC", ahora=61)
    assert minutos == 2
    assert float(importe) == 0.10


# Pruebo que salir al instante cobra el minimo de 1 minuto
def prueba_1_minimo_un_minuto():
    """Salir a los 0 segundos cuesta 1 minuto (0,05 euros)."""
    p = Parking()
    p.entrada("1111 BBB", ahora=0)

    # sale al instante pero se le cobra 1 minuto
    minutos, importe = p.salida("1111 bbb", ahora=0)
    assert minutos == 1, f"esperaba 1 minuto, salio {minutos}"
    assert float(importe) == 0.05, f"esperaba 0.05, salio {importe}"

    # la plaza vuelve a quedar libre y la recaudacion ya suma algo
    assert p.libres() == 20
    assert round(p.recaudacion, 2) == 0.05


# Pruebo el redondeo justo en el limite (60 s y 60,1 s)
def prueba_2_redondeo_hacia_arriba():
    """A los 60 segundos: 1 minuto. A los 60,1 segundos: 2 minutos."""
    p = Parking()

    # 60 segundos justos -> 1 minuto
    p.entrada("2222 CCC", ahora=0)
    minutos, importe = p.salida("2222ccc", ahora=60)
    assert minutos == 1, f"a los 60 s esperaba 1 minuto, salio {minutos}"
    assert float(importe) == 0.05

    # 60,1 segundos -> ya son 2 minutos
    p.entrada("3333 DDD", ahora=0)
    minutos, importe = p.salida("3333 DDD", ahora=60.1)
    assert minutos == 2, f"a los 60,1 s esperaba 2 minutos, salio {minutos}"
    assert float(importe) == 0.10


# Pruebo que caben 20 coches y el 21 da error de lleno
def prueba_3_parking_lleno():
    """Con 20 coches dentro, el 21.o recibe un error de parking lleno."""
    p = Parking()

    # lleno las 20 plazas y miro que cada coche recibe su plaza
    for i in range(20):
        assert p.entrada(f"{i:04d} XXX", ahora=0) == i + 1
    assert p.libres() == 0

    # el coche 21 tiene que dar error, no una plaza
    try:
        p.entrada("9999 ZZZ", ahora=0)
        assert False, "deberia haber dado error de parking lleno"
    except ParkingError as e:
        assert "lleno" in str(e)

    # sigue lleno y nadie ha pagado todavia
    assert p.libres() == 0
    assert p.recaudacion == 0


# Pruebo que al salir la plaza queda libre y la usa el siguiente
def prueba_4_plaza_se_libera():
    """Cuando un coche sale, su plaza queda libre y la usa el siguiente."""
    p = Parking()

    # dos coches: el primero a la plaza 1 y el segundo a la 2
    assert p.entrada("AAAA 111", ahora=0) == 1
    assert p.entrada("BBBB 222", ahora=0) == 2
    assert p.libres() == 18

    # el primer coche sale y su plaza queda libre
    p.salida("aaaa111", ahora=120)
    assert p.libres() == 19

    # el siguiente entra en la plaza 1, que es la primera libre
    assert p.entrada("CCCC 333", ahora=0) == 1

    # tambien compruebo que no se puede sacar el mismo coche dos veces
    p.salida("CCCC 333", ahora=0)
    recaudacion_antes = p.recaudacion
    try:
        p.salida("CCCC333", ahora=100)
        assert False, "deberia haber dado error de no encontrado"
    except ParkingError:
        pass
    assert p.recaudacion == recaudacion_antes


# Pruebo que la recaudacion es la suma de todos los importes
def prueba_5_recaudacion():
    """Tras varias salidas, la recaudacion es la suma de todos los importes."""
    p = Parking()
    importes = []

    # tres salidas: 0 s (1 min), 60 s (1 min) y 61 s (2 minutos)
    for matricula, salida_en in [("AAAA 111", 0), ("BBBB 222", 60), ("CCCC 333", 61)]:
        p.entrada(matricula, ahora=0)
        _minutos, importe = p.salida(matricula, ahora=salida_en)
        importes.append(importe)

    # la recaudacion tiene que ser la suma de los tres importes (0,20 en total)
    esperado = 0.05 + 0.05 + 0.10
    assert math.isclose(p.recaudacion, sum(importes), abs_tol=1e-9), (
        f"esperaba {sum(importes)}, la recaudacion es {p.recaudacion}"
    )
    assert math.isclose(p.recaudacion, esperado, abs_tol=1e-9), (
        f"esperaba {esperado}, la recaudacion es {p.recaudacion}"
    )
    assert round(p.recaudacion, 2) == 0.20


PRUEBAS = [
    prueba_ejemplo,
    prueba_1_minimo_un_minuto,
    prueba_2_redondeo_hacia_arriba,
    prueba_3_parking_lleno,
    prueba_4_plaza_se_libera,
    prueba_5_recaudacion,
]


if __name__ == "__main__":
    for prueba in PRUEBAS:
        try:
            prueba()
            print(f"OK        {prueba.__name__}")
        except NotImplementedError:
            print(f"PENDIENTE {prueba.__name__}")
        except AssertionError as e:
            print(f"FALLO     {prueba.__name__} -> {e}")
        # Antes cualquier error inesperado paraba todas las pruebas
        except Exception as e:
            print(f"ERROR     {prueba.__name__} -> {type(e).__name__}: {e}")
