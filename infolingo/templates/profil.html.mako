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
        <div class="profile-container">
            <div class="profile-header">
                <img src="Images/user_profile.jpg" alt="Photo de profil utilisateur">
                <h1>${user['username']}</h1>
                <p>Apprenant des langages de programmation</p>
            </div>
            <div class="profile-details">
                <h2>Langues Apprises</h2>
                <div class="languages">
                    <div class="language-card">
                        <h3>Python</h3>
                        <p>Niveau : Intermédiaire</p>
                        <div class="progress-bar">
                            <div class="python"></div>
                        </div>
                    </div>

                    <div class="language-card">
                        <h3>JavaScript</h3>
                        <p>Niveau : Débutant</p>
                        <div class="progress-bar">
                            <div class="javascript"></div>
                        </div>
                    </div>
                    <div class="language-card">
                        <h3>C</h3>
                        <p>Niveau : Débutant</p>
                        <div class="progress-bar">
                            <div class="c"></div>
                        </div>
                    </div>
                </div>
                <h2>Badges</h2>
                <div class="badges">
                    <div class="badge">
                        <img src="Images/badge_or.png" alt="Badge Or">
                        <p>Badge Or</p>
                    </div>
                    <div class="badge">
                        <img src="Images/badge_silver.png" alt="Badge Argent">
                        <p>Badge Argent</p>
                    </div>
                    <div class="badge">
                        <img src="Images/badge_bronze.png" alt="Badge Bronze">
                        <p>Badge Bronze</p>
                    </div>
                </div>
            <a href="deconnexion.html"><button id="déconnexion_button">Se déconnecter</button><br></a>
        </div>
    </body>
</html>