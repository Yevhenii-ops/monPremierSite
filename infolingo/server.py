# S'assure de pouvoir démarrer le serveur depuis n'importe quel dossier.
import os
import datetime
from flask_mako import render_template, MakoTemplates
from flask_sqlite import SQLiteExtension
from flask_sqlite import get_db
from flask import abort
from flask import request, redirect, url_for
from random import randint
os.chdir(os.path.dirname(os.path.realpath(__file__)))

from flask import Flask   # Importe le type Flask.
import sqlite3
from flask import session, sessions
app = Flask("Infolingo")  # Crée une application Flask nommée "SuperSite".
MakoTemplates(app)
SQLiteExtension(app)
app.secret_key = str(os.urandom(16))

def is_logged():
    if 'user_id' in session:
        return True
    else:
        return False
@app.route("/")
def accueil():
    return render_template("accueil.html.mako", is_logged = is_logged())
@app.route("/contacts")
def contact():
    return render_template("contacts.html.mako")

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
    cursor = db.execute(
        """
        SELECT question_id, user_id, vote FROM votes
        WHERE user_id = ? AND question_id = ?
        """, (user_id, question_id)
    )
    row = cursor.fetchone()
    if row is None:
        return 0
    else:
        return int(row['vote'])
def has_voted_answer(user_id, answer_id, db):
    cursor = db.execute(
        "SELECT vote FROM answer_votes WHERE user_id = ? AND answer_id = ?",
        (user_id, answer_id)
    )
    row = cursor.fetchone()
    return row['vote'] if row else 0



@app.route("/forum", methods = ["GET", "POST"])
def forum():
    error = None
    questions = {}
    answers = {}
    db = get_db()
    try:
        if "user_id" not in session:
            raise KeyError('Vous devez être connécté avant d\'accéder au forum.')
    except KeyError as e:
        return render_template("erreur.html.mako", error = str(e))
    else:
        if request.method == "POST":

            user_id = session['user_id']
            if request.form.get('ask') == 'Publier':
                cursor = db.execute(
                """
                INSERT INTO questions (user_id, title, content, date)
                VALUES(?, ?, ?, ?);
                """, (user_id, request.form["title"], request.form["content"], datetime.datetime.now()) 
                ) 
            elif request.form.get('answer') == 'Publier':
                cursor = db.execute(
                """
                INSERT INTO answers (question_id, user_id, content)
                VALUES (?, ?, ?);
                """, (request.form.get("question_id"), user_id, request.form["content"],)
                )
            elif request.form.get('vote') != None:
                question_id = request.form.get('question-id')
                vote = int(request.form.get('vote'))
                already_voted = has_voted(user_id, question_id, db)
                if vote == already_voted:
                    cursor = db.execute(
                        """
                        DELETE FROM votes WHERE user_id = ? and question_id = ?
                        """, (user_id, question_id)
                    )
                    cursor = db.execute(
                        """
                        UPDATE questions SET mark = mark - ?
                        WHERE id = ?
                        """, (vote, question_id,)
                    )
                elif vote == -1*already_voted:
                    cursor = db.execute(
                        """
                        UPDATE questions SET mark = mark + ?
                        WHERE id = ?
                        """, (2*vote, question_id)
                    )
                    cursor = db.execute(
                        """
                        UPDATE votes SET vote = ?
                        WHERE user_id = ? AND question_id = ?
                        """, (vote, user_id, question_id,)
                    )
                elif already_voted == 0:
                    cursor = db.execute(
                    """
                    INSERT INTO votes (user_id, question_id, vote)
                    VALUES(?,?,?)
                    """, (user_id, question_id, vote)
                    )
                    cursor=db.execute(
                        """
                        UPDATE questions SET mark = mark + ?
                        WHERE id = ?
                        """, (vote, question_id)
                    )
            elif request.form.get('vote-answer') is not None:
                answer_id = request.form.get('answer-id')
                vote = int(request.form.get('vote-answer'))
                already_voted = has_voted_answer(user_id, answer_id, db)
                if vote == already_voted:
                    db.execute(
                        "DELETE FROM answer_votes WHERE user_id = ? AND answer_id = ?",
                        (user_id, answer_id)
                    )
                    db.execute(
                        "UPDATE answers SET mark = mark - ? WHERE id = ?",
                        (vote, answer_id)
                    )
                elif vote == -1 * already_voted:
                    db.execute(
                        "UPDATE answers SET mark = mark + ? WHERE id = ?",
                        (2 * vote, answer_id)
                    )
                    db.execute(
                        "UPDATE answer_votes SET vote = ? WHERE user_id = ? AND answer_id = ?",
                        (vote, user_id, answer_id)
                    )
                elif already_voted == 0:
                    db.execute(
                        "INSERT INTO answer_votes (user_id, answer_id, vote) VALUES (?, ?, ?)",
                        (user_id, answer_id, vote)
                    )
                    db.execute(
                        "UPDATE answers SET mark = mark + ? WHERE id = ?",
                        (vote, answer_id)
                    )

            db.commit()
        cursor = db.execute(
        """
        SELECT * FROM questions
        """
        )
        questions = cursor.fetchall()
        cursor = db.execute(
        """
        SELECT * FROM answers
        """
        )
        answers = cursor.fetchall()
        cursor = db.execute(
            """
            SELECT * FROM users
            """
        )
        users = cursor.fetchall()
        return render_template('forum.html.mako', questions = sorted(questions, key=lambda q: q['date'], reverse=True), answers=answers, users=users)

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
                SELECT * FROM users WHERE id = ?
                """, (user_id,)
            )
            user = cursor.fetchone()
            cursor = db.execute(
                """
                SELECT * from learned_languages WHERE user_id = ?
                """, (user_id,)
            )
            learned_languages = cursor.fetchall()
            return render_template("profil.html.mako", user = user, learned_languages = learned_languages)

def exercise_au_hasard():
    language = randint(0, 2)
    exercise = randint(0, 2)
    str_language = ""
    match language:
        case 0:
            str_language = "C"
        case 1:
            str_language = "Javascript"
        case 2:
            str_language = "Python"
    return(str_language, exercise)

@app.route("/defi", methods = ["GET"])
def defi():
    try:
        if "user_id" not in session: 
            raise KeyError("Vous devez vous connécté avant d'accéder à l'exercise du jour")
    except KeyError as e:
        return render_template("erreur.html.mako", error = str(e))
    else:
        lan_ex = exercise_au_hasard()
        return render_template("exercises/"+lan_ex[0]+".html.mako", ex = lan_ex[1], lan = lan_ex[0])

        

# Démarre l'application en mode debug.
# Attention: ce doit être la dernière instruction du script !!!

app.run(debug=True)