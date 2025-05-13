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
                % for language in learned_languages:
                    % if user['id'] == language['user_id']:
                <div class="languages">
                    <div class="language-card">
                        <h3>Langue : ${language['language']}</h3>
                        <p>Niveau : ${language['niveau_de_matrise']}</p>
                        <div class="progress-bar">
                            <div class="${language['language']}"></div>
                        </div>
                    </div>
                </div>
                    % endif
                % endfor
                <h2>Badges</h2>
                %for badge in user['badges']
                <div class="badges">
                    <div class="badge">
                        <img src="Images/badge_or.png" alt="${badge}'">
                        <p>${badge}</p>
                    </div>
                </div>
            <a href="${url_for('logout')}"><button id="déconnexion_button">Se déconnecter</button><br></a>
        </div>
    </body>
</html>