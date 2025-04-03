# S'assure de pouvoir démarrer le serveur depuis n'importe quel dossier.
import os
import datetime
from flask_mako import render_template, MakoTemplates
from flask_sqlite import SQLiteExtension
from flask_sqlite import get_db
from flask import abort
os.chdir(os.path.dirname(os.path.realpath(__file__)))

from flask import Flask   # Importe le type Flask.
from random import randint
app = Flask("Infolingo")  # Crée une application Flask nommée "SuperSite".
MakoTemplates(app)
SQLiteExtension(app)

@app.route("/")
def accueil():
    return render_template("accueil.html.mako")

# Démarre l'application en mode debug.
# Attention: ce doit être la dernière instruction du script !!!

app.run(debug=True)