<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Python Exercices</title>
    <link rel="stylesheet" type="text/css" href="../static/style.css">
</head>
    <body>
        <div class="header-container">
            <a href="${url_for('accueil')}"><img src="../static/logo.png" alt="logo" class="logo"></a><h1>Infolingo</h1>
        </div>
    %if ex == 0:
        <!-- Exercice 1 -->
        <h1>${lan} : Exercice 1 : Afficher le carré d'un nombre</h1>
        <div class="block"><p>Consigne : Écrire un programme en Python qui demande à l'utilisateur d'entrer un nombre entier, puis affiche le carré de ce nombre.</p></div>
            <div class="block_of_code">
                <p><span class="comment"># Demander à l'utilisateur d'entrer un nombre</span></p>
                <p><span class="declaration">number</span> <span class="symbole">=</span> <span class="function">int</span><span class="symbole">(</span><span class="function">input</span><span class="symbole">(</span><span class="string">"Entrez un nombre : "</span><span class="symbole">)</span><span class="symbole">)</span></p>
                <p><span class="declaration">square</span> <span class="symbole">=</span> <span class="declaration">number</span> <span class="symbole">**</span> <span class="value">2</span></p>
                <p><span class="function">print</span><span class="symbole">(</span><span class="string">"Le carré de"</span><span class="symbole">,</span> <span class="declaration">number</span><span class="symbole">,</span> <span class="string">"est :"</span><span class="symbole">,</span> <span class="declaration">square</span><span class="symbole">)</span></p>
            </div>
        <div class="block">
            <h3>Sortie :</h3>
            <p>Entrez un nombre : 4</p>
            <p>Le carré de 4 est : 16</p>
        </div>
    %elif ex == 1:
        <!-- Exercice 2 -->
        <h1>${lan} : Exercice 2 : Vérifier si un nombre est pair ou impair</h1>
        <div class="block"><p>Consigne : Écrire un programme en Python qui détermine si un nombre entré par l'utilisateur est pair ou impair.</p></div>
            <div class="block_of_code">
                <p><span class="comment"># Demander à l'utilisateur d'entrer un nombre</span></p>
                <p><span class="declaration">number</span> <span class="symbole">=</span> <span class="function">int</span><span class="symbole">(</span><span class="function">input</span><span class="symbole">(</span><span class="string">"Entrez un nombre : "</span><span class="symbole">)</span><span class="symbole">)</span></p>
                <p><span class="keyword">if</span> <span class="declaration">number</span> <span class="symbole">%</span> <span class="value">2</span> <span class="symbole">==</span> <span class="value">0</span><span class="symbole">:</span></p>
                <p>&emsp;<span class="function">print</span><span class="symbole">(</span><span class="declaration">number</span><span class="symbole">,</span> <span class="string">"est pair"</span><span class="symbole">)</span></p>
                <p><span class="keyword">else</span><span class="symbole">:</span></p>
                <p>&emsp;<span class="function">print</span><span class="symbole">(</span><span class="declaration">number</span><span class="symbole">,</span> <span class="string">"est impair"</span><span class="symbole">)</span></p>
            </div>
        <div class="block">
            <h3>Sortie :</h3>
            <p>Entrez un nombre : 7</p>
            <p>7 est impair</p>
        </div>
    %elif ex == 2:
        <!-- Exercice 3 -->
        <h1>${lan} : Exercice 3 : Calculer la somme de deux nombres</h1>
        <div class="block"><p>Consigne : Écrire un programme en Python qui demande à l'utilisateur d'entrer deux nombres entiers, puis affiche leur somme.</p></div>
            <div class="block_of_code">
                <p><span class="comment"># Demander à l'utilisateur d'entrer deux nombres</span></p>
                <p><span class="declaration">num1</span> <span class="symbole">=</span> <span class="function">int</span><span class="symbole">(</span><span class="function">input</span><span class="symbole">(</span><span class="string">"Entrez le premier nombre : "</span><span class="symbole">)</span><span class="symbole">)</span></p>
                <p><span class="declaration">num2</span> <span class="symbole">=</span> <span class="function">int</span><span class="symbole">(</span><span class="function">input</span><span class="symbole">(</span><span class="string">"Entrez le deuxième nombre : "</span><span class="symbole">)</span><span class="symbole">)</span></p>
                <p><span class="declaration">sum</span> <span class="symbole">=</span> <span class="declaration">num1</span> <span class="symbole">+</span> <span class="declaration">num2</span></p>
                <p><span class="function">print</span><span class="symbole">(</span><span class="string">"La somme est :"</span><span class="symbole">,</span> <span class="declaration">sum</span><span class="symbole">)</span></p>
            </div>
        <div class="block">
            <h3>Sortie :</h3>
            <p>Entrez le premier nombre : 3</p>
            <p>Entrez le deuxième nombre : 5</p>
            <p>La somme est : 8</p>
        </div>
    %endif
    </body>
</html>
