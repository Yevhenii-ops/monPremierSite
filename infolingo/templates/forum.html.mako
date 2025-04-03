<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>accueil</title>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <div class="header-container">
            <a href="accueil.html"><img src="Images/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
        </div>
        <div class="container">
            <h1>Forum Simple (Statique)</h1>
            <div class="post">
                <h3>Discussion 1: Comment apprendre HTML ?</h3>
                <p>Je suis débutant et j'aimerais savoir par où commencer pour apprendre HTML. Avez-vous des ressources ou des conseils ?</p>
                <div class="reply">
                    <p><strong>Réponse 1:</strong> Vous pouvez commencer par des tutoriels en ligne comme ceux sur W3Schools ou Mozilla Developer Network (MDN).</p>
                </div>
            </div>
            <div class="post">
                <h3>Discussion 2: Quels outils utiliser pour coder en HTML ?</h3>
                <p>Quels éditeurs recommandez-vous pour écrire du HTML ?</p>
                <div class="reply">
                    <p><strong>Réponse 1:</strong> Visual Studio Code est un excellent choix. Il est gratuit et dispose de nombreuses extensions pour HTML.</p>
                </div>
            </div>
            <div class="form">
                <h3>Ajouter une nouvelle discussion (statique)</h3>
                <form>
                    <input type="text" placeholder="Titre de la discussion" required>
                    <textarea placeholder="Votre message" required></textarea>
                    <input type="submit" value="Publier">
                </form>
            </div>
        </div>
    </body>
</html>