from flask import Flask, render_template, request, redirect, flash, url_for
from client import autenticar, obtener_cupon, canjear_cupon

app = Flask(__name__)
app.secret_key = "clave_secreta"

autenticado = False  # bandera simple para manejar sesión

@app.route('/login', methods=["GET", "POST"])
def login():
    global autenticado
    if request.method == "POST":
        email = request.form["email"]
        password = request.form["password"]
        if autenticar(email, password):
            autenticado = True
            return redirect(url_for("index"))
        else:
            flash("Credenciales incorrectas", "error")
    return render_template("login.html")

@app.route('/', methods=["GET", "POST"])
def index():
    global autenticado
    if not autenticado:
        return redirect(url_for("login"))

    cupon = None
    if request.method == "POST":
        codigo = request.form["codigo"]
        if "consultar" in request.form:
            cupon = obtener_cupon(codigo)
            if not cupon:
                flash("Cupón no encontrado", "error")
        elif "canjear" in request.form:
            resultado_canje = canjear_cupon(codigo)
            if 'error' in resultado_canje:
                flash(f"❌ Error: {resultado_canje['error']}")
            else:
                flash("✅ Cupón canjeado exitosamente")
    return render_template("index.html", cupon=cupon)

if __name__ == "__main__":
    app.run(debug=True)
