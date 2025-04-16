<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <title>inscription</title>
        <link rel="stylesheet" type="text/css" href="../static/style.css">
    </head>
    <body>
        <div class="header-container">
            <a href="${url_for("accueil")}"><img src="../static/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
        </div>
        <h1>Inscription</h1>
        <form method="POST">
            <label>Le nom de profil</label><br>
            <label><input name="username" required></label><br>
            <label>Mot de passe</label><br>
            <label>
                <input name="password" required><br>
            </label>
            <label>Repétez le mot de passe</label><br>
            <label>
                <input name="confirm_password" required><br>
            </label>
            <button type="Submit">S'inscrire</button><br> <!--PROBLEME : le button n'est pas fixée-->
            <p>Déja inscrit ? Veuillez venir sur la page de connexion.</p>
            <a href="connexion.html">Connexion</a> 
        </form> 
    </body>
</html>