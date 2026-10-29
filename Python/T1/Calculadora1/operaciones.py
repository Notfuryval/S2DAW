# Mi primer programa
operador_1 = 0
operador_2 = 0
operaciones = ["+", "-", "*", "/"]

print("Operaciones:", operaciones)

operador_1 = int(input("Primer operando: "))
operador_2 = int(input("Segundo operando: "))
operacion = input("Operacion (+, -, *, /): ")
error = False
if operacion == "+":
    resultado = operador_1 + operador_2
elif operacion == "-":
    resultado = operador_1 - operador_2
elif operacion == "*":
    resultado = operador_1 * operador_2
elif operacion == "/":
    if operador_2 == 0:
        print(f"Error: no se puede dividir {operador_1} entre 0.")
        error = True
    else:
        resultado = operador_1 / operador_2
else:
    print(f"Operacion '{operacion}' no valida. Usa: {operaciones}")
    error = True
if error == False:
    print(f"Resultado: {operador_1} {operacion} {operador_2} = {resultado}")
