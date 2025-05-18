<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JavaScript Exercices</title>
    <link rel="stylesheet" type="text/css" href="../static/style.css">
</head>
<body>
        <div class="header-container">
            <a href="${url_for('accueil')}"><img src="../static/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
        </div>

%if ex == 0:
    <!-- Exercice 1 -->
    <h1>${lan} : Exercice 1 : Afficher "Hello, World!"</h1>
    <div class="block"><p>Consigne : Écrire un programme en JavaScript qui affiche "Hello, World!" dans la console.</p></div>
    <div class="block_of_code">
        <p><span class="comment">// Ce programme affiche "Hello, World!"</span></p>
        <p><span class="function">console.log</span>(<span class="string">"Hello, World!"</span>);</p>
    </div>
    <div class="block">
        <h3>Sortie :</h3>
        <p>"Hello, World!" sera affiché dans la console du navigateur.</p>
    </div>
%elif ex == 1:
    <!-- Exercice 2 -->
    <h1>${lan} : Exercice 2 : Calculer le carré d'un nombre</h1>
    <div class="block"><p>Consigne : Écrire un programme en JavaScript qui demande à l'utilisateur d'entrer un nombre, puis affiche le carré de ce nombre.</p></div>
    <div class="block_of_code">
        <p><span class="comment">// Demande à l'utilisateur d'entrer un nombre et calcule le carré</span></p>
        <p><span class="declaration">let</span> <span class="variable">number</span> = <span class="function">prompt</span>(<span class="string">"Entrez un nombre : "</span>);</p>
        <p><span class="declaration">let</span> <span class="variable">square</span> = <span class="variable">number</span> * <span class="variable">number</span>;</p>
        <p><span class="function">console.log</span>(<span class="string">"Le carré de " </span> + <span class="variable">number</span> + <span class="string">" est : " </span> + <span class="variable">square</span>);</p>
    </div>
    <div class="block">
        <h3>Sortie :</h3>
        <p>Entrez un nombre : 4</p>
        <p>Le carré de 4 est : 16</p>
    </div>
%elif ex == 2:
    <!-- Exercice 3 -->
    <h1>${lan} : Exercice 3 : Vérifier si un nombre est pair ou impair</h1>
    <div class="block"><p>Consigne : Écrire un programme en JavaScript qui détermine si un nombre entré par l'utilisateur est pair ou impair.</p></div>
    <div class="block_of_code">
        <p><span class="comment">// Vérifie si un nombre est pair ou impair</span></p>
        <p><span class="declaration">let</span> <span class="variable">number</span> = <span class="function">prompt</span>(<span class="string">"Entrez un nombre : "</span>);</p>
        <p><span class="condition">if</span> (<span class="variable">number</span> % <span class="value">2</span> == <span class="value">0</span>)</p>
        <p>&emsp;<span class="function">console.log</span>(<span class="string">"Le nombre " </span> + <span class="variable">number</span> + <span class="string">" est pair."</span>);</p>
        <p><span class="condition">else</span></p>
        <p>&emsp;<span class="function">console.log</span>(<span class="string">"Le nombre " </span> + <span class="variable">number</span> + <span class="string">" est impair."</span>);</p>
    </div>
    <div class="block">
        <h3>Sortie :</h3>
        <p>Entrez un nombre : 7</p>
        <p>Le nombre 7 est impair.</p>
    </div>
%endif
</body>
</html>
