<!-- 1. Il faut rajouter UI pour pouvoir voter pour les questions/reponses-->

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
        <div class="container">
            <h1>Forum Simple (Statique)</h1>
            <div class="form">
                <h3>Ajouter une nouvelle discussion (statique)</h3>
                <form>
                    <input type="text" placeholder="Titre de la discussion" required>
                    <textarea placeholder="Votre message" required></textarea>
                    <input type="submit" value="Publier">
                </form>
                <% i = 1%>
            % if questions is not None:
                % for question in questions :
                <div class="post" question-id="${i}">
                    <h3>Discussion ${question['index']}: ${question['title']} ?</h3>
                    <p>${question['content']}</p>
                        % if question['answers'] is not Null:
                                <% j = 1%>
                            % for answer in question['answers']:
                            <div class="reply" reply-id="${j}">
                                <p><strong>Réponse ${answer['index']}:</strong>${answer['content']}</p>                  
                            </div>
                            <% j = j + 1%>
                            % endfor
                        % endif
                </div>
                    <% i = i + 1%>
                % endfor
            % endif
        </div>
    </body>