import requests

API_URL = "http://localhost:8000/api"
TOKEN = None

def autenticar(correo, contra):
    global TOKEN
    response = requests.post(f"{API_URL}/login", data={
        "correo": correo,
        "contra": contra
    })

    # Depuración: imprime código y texto por si falla
    print("Código de respuesta:", response.status_code)
    print("Contenido:", response.text)

    if response.status_code == 200:
        try:
            TOKEN = response.json().get("token")
            return True
        except ValueError:
            print("Error al decodificar JSON.")
            return False
    else:
        return False


def obtener_headers():
    if not TOKEN:
        raise Exception("No autenticado.")
    return {
        "Authorization": f"Bearer {TOKEN}"
    }

def obtener_cupon(codigo):
    response = requests.get(f"{API_URL}/cupon/{codigo}", headers=obtener_headers())
    if response.status_code == 200:
        return response.json()
    else:
        return {'error': f'Error al obtener el cupón: {response.status_code}'}

def canjear_cupon(codigo):
    response = requests.put(f"{API_URL}/cupon/{codigo}/canjear", headers=obtener_headers())
    try:
        return response.json()  
    except ValueError:
        return {'error': 'Respuesta inválida del servidor', 'status_code': response.status_code}


