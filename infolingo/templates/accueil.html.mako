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
        <nav>

            % if is_logged is False:
                <a href="${url_for('inscription')}">Inscription</a>
                <a href="${url_for('login')}">Connexion</a>
            %endif
            <a href="${url_for('contact')}">Contact</a>
            <a href="${url_for('forum')}">Forum</a>
            % if is_logged is True:
                 <a href="${url_for('logout')}">Déconnexion</a>
                 <a href="${url_for('profil')}">Profil</a>
                 <a href = "${url_for('defi')}">Exercise du jour</a>
            %endif

        </nav>
        <h2>
            Bienvenue sur Infolingo, le site pour apprendre à coder facilement.<br>Ici, vous pourrez découvrir comment coder tout en vous exerçant. De plus, grâce au forum, vous pourrez échanger avec d'autres utilisateurs du site.

        </h2>
        <h2>
            Vous pouvez apprendre soit le C, soit le Python, soit le JavaScript.<br>De plus, à la fin de chaque chapitre d'apprentissage, vous pourrez vous exercer et consulter les solutions des exercices.
        </h2>
        <footer>
                <div class="social-buttons">
                    <a href="https://www.facebook.com" target="_blank">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook">
                    </a>
                    <a href="https://www.instagram.com" target="_blank">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png" alt="Instagram">
                    </a>
                    <a href="https://www.telegram.org" target="_blank">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg" alt="Telegram">
                    </a>
                </div>
            </div>
            <h4>Le site a été developpé par Gwenael et Yevhenii</h4>
        </footer>
    </body>
</html>