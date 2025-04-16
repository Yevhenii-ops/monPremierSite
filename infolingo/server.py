# S'assure de pouvoir démarrer le serveur depuis n'importe quel dossier.
import os
import datetime
from flask_mako import render_template, MakoTemplates
from flask_sqlite import SQLiteExtension
from flask_sqlite import get_db
from flask import abort
from flask import request, redirect, url_for
os.chdir(os.path.dirname(os.path.realpath(__file__)))

from flask import Flask   # Importe le type Flask.
from random import randint
import sqlite3
app = Flask("Infolingo")  # Crée une application Flask nommée "SuperSite".
MakoTemplates(app)
SQLiteExtension(app)

@app.route("/")
def accueil():
    return render_template("accueil.html.mako")

class ValidationError(ValueError):
    """Error in users provided values."""
    pass
@app.route("/inscription", methods =["GET", "POST"])
def inscription():
    if request.method == "GET":
        return render_template("inscription.html.mako")
    elif request.method == "POST":
        db = get_db()
        try:
            if request.form["password"] != request.form["confirm_password"]:
                raise ValidationError("Mot de passe mal confirmé")
            cursor = db.execute(
                """
                INSERT INTO users (username, password)
                VALUES (?, ?);
                """, (request.form["username"], request.form["password"],)
            )
            db.commit()
            return redirect(url_for("login"), code=303)
        except ValidationError as e:
            return render_template("register1.mako.html", error = str(e))
        except sqlite3.IntegrityError as e:
            return render_template("register1.mako.html", error = str(e))
        finally:
            db.rollback()
@app.route("/login", methods = ["GET", "POST"])
def login():
    if request.method == "GET":
        return render_template("login.html.mako")
    elif request.method == "POST":
        db = get_db()
        try:
            cursor = db.execute("SELECT * FROM users WHERE username=? LIMIT 1", (request.form["username"],))
            user = cursor.fetchone()
            if user is None:
                raise ValidationError("Username invalide")
            if user['password'] != request.form['password']:
                raise ValidationError("Mot de passe invalide")
            app.logger.info("LOG IN '%s' (id=%d)", user['username'], user['id'])
            return redirect(url_for("accueil"), code=303) # il faudra changer le lien de la redirection
        except ValidationError as e:
            return render_template("login.html.mako", error=str(e))





# Démarre l'application en mode debug.
# Attention: ce doit être la dernière instruction du script !!!

app.run(debug=True)