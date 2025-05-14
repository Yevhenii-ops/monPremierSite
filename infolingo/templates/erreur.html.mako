<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>accueil</title>
        <link rel="stylesheet" type="text/css" href="../static/style.css">
    </head>
<body>
    <div class="header-container">
        <a href="${url_for('accueil')}"><img src="../static/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
    </div>
    <nav>
        <a href="${url_for('login')}">Connexion</a>
        <a href="${url_for('inscription')}">Inscription</a>
        <a href="${url_for('contact')}">Contact</a>
        <a href="${url_for('forum')}">Forum</a>
    </nav>
    <p style="color: red;">${error}</p>
</body>
</html>