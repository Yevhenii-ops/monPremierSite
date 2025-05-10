<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>accueil</title>
        <link rel="stylesheet" type="text/css" href="../static/style.css">
    </head>
    <body>
        <div class="header-container">
            <a href="${url_for('accueil')}"><img src="../static/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
        </div>
        <h1>Déconnexion</h1>
        <div class="block"><p>Vous avez été déconnecté avec succès.</p></div>
        <button onclick="window.location.href='${url_for('accueil')}'">Retourner à la page de connexion</button>
    </body>
</html>
