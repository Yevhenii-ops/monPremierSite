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

@app.route("/accueil/<username>")
def registred_user_accueil(username):
    return render_template("registered_user_accueil.html.mako", username=username)

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
            return redirect(url_for("registred_user_accueil", username=user['username']), code=303) # il faudra changer le lien de la redirection
        except ValidationError as e:
            return render_template("login.html.mako", error=str(e))
@app.route("/<username>")
def profil(username):
    db = get_db()
    cursor = db.execute("SELECT * FROM users WHERE username = ?", (username,))
    user = cursor.fetchone()
    if user is None:
        return render_template("user_not_found.html.mako")
    return render_template("profil.html.mako", user=user)
@app.route("/forum", methods = ["GET", "POST"])
def forum():
    if request.method == "GET":
        return render_template('forum.html.mako')
    elif request.method == "POST":
        db = get_db()
        if request.form['action'] == 'ask_question':

            cursor = db.execute
            (
            """
            INSERT INTO questions VALUES(?, ?, ?);
            """, (user_id, request.form['content'], 0) 
            ) #Supposons que user_id est donné 
        elif request.form['action'] == 'answer':
            cursor = db.execute
            (
            """
            INSERT INTO messages VALUES (?, ?, ?, ?);
            """, (question_id, user_id, request.form['content'], 0)
            ) #Supposons que question_id et user_id sont donnés
        elif request.form['action'] == 'evaluate_question':
            cursor = db.execute
            (
                """
                SELECT mark FROM questions
                WHERE id = ?
                """, question_id
            ) # Supposons que question_id est donée
            mark = cursor.fetchone()['mark']
            cursor = db.execute
            (
                """
                UPDATE questions SET mark = ? WHERE id = ?
                """, mark = mark + request.form[vote], question_id
            )# request.form[vote] c'est une valeur qui est soit 1, soit -1
             # Supposons que question_id est donné

             #ICI, IL FAUT FAIRE ENCORE SÛREMENT LE VOTE POUR LES MESSAGES
    return render_template('forum.html.mako')

# Démarre l'application en mode debug.
# Attention: ce doit être la dernière instruction du script !!!

app.run(debug=True)