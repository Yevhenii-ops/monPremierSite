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
            <a href="accueil.html"><img src="Images/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
        </div>
        <h1>Connexion</h1>
        <form> <!--CHOSE A FAIRE : rajouter le lien pour action-->
            <label name="username" required>Pseudo</label><br>
            <input><br>
            <label name="password" required>Le mot de passe</label><br>
            <input><br>
            <button id="connexion_button" type="sumbit">Se connecter</button><br> <!--PROBLEME : le button n'est pas fixée! Yevhenii: "Est-ce qu'il faut fixer ça ? Moi jsp"-->
            <p>Pas de compte ? Veuillez venir sur la page d'inscription : <a href="${url_for('inscription')}">Inscription</a></p>
        </form>
        
    </body>
</html>