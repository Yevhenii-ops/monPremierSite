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
            #return redirect(url_for("login"), code=303)
        except ValidationError as e:
            return render_template("register1.mako.html", error = str(e))
        except sqlite3.IntegrityError as e:
            return render_template("register1.mako.html", error = str(e))
        finally:
            db.rollback()




# Démarre l'application en mode debug.
# Attention: ce doit être la dernière instruction du script !!!

app.run(debug=True)