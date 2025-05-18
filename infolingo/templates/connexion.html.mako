<!--CHOSE A FAIRE PLUS TARD : rajouter le code qui permet de voir si le e-mail et le mot de clé soient juste remplis-->

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>connexion</title>
        <link rel="stylesheet" type="text/css" href="../static/style.css">
    </head>
    <body>
        <div class="header-container">
            <a href="${url_for('accueil')}"><img src="../static/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
        </div>
        <h1>Connexion</h1>
        <form method="POST"> <!--CHOSE A FAIRE : rajouter le lien pour action-->
            <label>Pseudo</label><br>
            <input name="username" required><br>
            <label>Le mot de passe</label><br>
            <input name="password" required><br>
            <button id="connexion_button" type="submit">Se connecter</button><br> <!--PROBLEME : le button n'est pas fixée! Yevhenii: "Est-ce qu'il faut fixer ça ? Moi jsp"-->
            <p>Pas de compte ? Veuillez venir sur la page d'inscription : <a href="${url_for('inscription')}">Inscription</a></p>
        </form>
        
    </body>
</html>