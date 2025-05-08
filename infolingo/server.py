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
import sqlite3
from flask import session, sessions
app = Flask("Infolingo")  # Crée une application Flask nommée "SuperSite".
MakoTemplates(app)
SQLiteExtension(app)
app.secret_key = str(os.urandom(16))
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
            return render_template("inscription.html.mako", error = str(e))
        except sqlite3.IntegrityError as e:
            return render_template("inscription.html.mako", error = str(e))
        finally:
            db.rollback()


@app.route("/login", methods = ["GET", "POST"])
def login():
    if 'user_id' in session:
        return redirect(url_for('accueil'))
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
            session.clear()
            session['user_id'] = user['id']
            return redirect(url_for('accueil'), code=303)
        except ValidationError as e:
            return render_template("login.html.mako", error=str(e))

@app.route("/logout")
def logout():
    session.clear()
    return render_template("deconnexion.html.mako")


def has_voted(user_id, question_id, db):
    cursor = db.execute
    (
        """
        SELECT question_id, user_id FROM votes
        WHERE user_id = ? question_id = ?
        """, (user_id, question_id,)
    )
    if cursor.fethone() is not None:
        return True
    else:
        return False

@app.route("/forum", methods = ["GET", "POST"])
def forum():
    error = None
    questions = {}
    db = get_db()
    if request.method == "GET":
        try:
            if "user_id" not in session:
                raise KeyError('Vous devez être connécté avant d\'accéder au forum.')
        except KeyError as e:
            return render_template("erreur.html.mako", error = str(e))
        else:
            cursor = db.execute(
                """
                SELECT * FROM questions
                """
            )
            questions = cursor.fetchall() #Flask dit que cet objet n'a pas ce méthode ...
        return render_template('forum.html.mako', questions=questions)
    elif request.method == "POST":

        user_id = session['user_id']
        if request.form['action'] == 'ask_question':
            cursor = db.execute
            (
            """
            INSERT INTO questions VALUES(?, ?);
            """, (user_id, request.form['content'],) 
            ) 
        elif request.form['action'] == 'answer':
            cursor = db.execute
            (
            """
            INSERT INTO messages VALUES (?, ?, ?);
            """, (request.form['quesiton-id'], user_id, request.form['content'],)
            )
        elif request.form['action'] == 'evaluate_question':

            question_id = request.form[question_id]
            if has_voted(user_id, question_id, db) is True:
                pass
            else:
                cursor = db.execute(
                """
                INSERT INTO votes VALUES (?, ?);
                """, (question_id, user_id)
                )

                cursor = db.execute(
                    """
                    UPDATE questions SET mark = mark + ?
                    WHERE id = ?
                    """, (request.form['vote'], question_id)
                ) # Supposons que question_id est donée

                 # request.form[vote] c'est une valeur qui est soit 1, soit -1
                 # Supposons que question_id est donné
                 # POUR SAVOIR QUI EST CONNECTE, IL FAUT SE SERVIR DU DICTIONNAIRE sessions 
                 #ICI, IL FAUT FAIRE ENCORE SÛREMENT LE VOTE POUR LES MESSAGES
                 #IL FAUT CHANGER LE SYSTEME DE VOTE AU NIVEAU DE LA BASE DE DONNEES EN FAISANT
                 #LA RELATION N à N
    return render_template('forum.html.mako')

@app.route("/profil", methods = ["GET", "POST"])
def profil():
    try:
        if "user_id" not in session:
            raise KeyError("Vous devez vous connécté avant d'accéder au profil")
    except KeyError as e:
        return render_template("erreur.html.mako", error = str(e))
    else:
        user_id = session["user_id"]
        if request.method == "GET":
            db = get_db()
            cursor = db.execute(
                """
                FROM users SELECT * WHERE user_id = ?
                """, (session["user_id"],)
            )
            user = cursor.fetchone()
            cursor = get_db()
            cursor = db.execute(
                """
                FROM learned_languages SELECT language, niveau de matrise WHERE user_id = ?
                """, (user_id)
            )
            learned_languages = cursor.fetchall()
            return render_template("profil.hmtl.mako", user = user, learned_languages = learned_languages)

# Démarre l'application en mode debug.
# Attention: ce doit être la dernière instruction du script !!!

app.run(debug=True)