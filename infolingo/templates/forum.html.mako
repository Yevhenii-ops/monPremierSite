## Les propositions :
## - Rajouter une possibilité de cliquer sur les pseudos des utilisateurs
## - Rajouter une possibilité de repondre aux réponses
## - Rajouter un système de filtrage

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
                <form method="POST">
                    <input type="text" placeholder="Titre de la discussion" required name="title">
                    <textarea placeholder="Votre message" required name="content"></textarea>
                    <input type="submit" value="Publier" name="ask">
                </form>
                <% i = 1%>
            % if questions is not None:
                % for question in questions :
                <div class="post">
                    % for user in users:
                        %if user['id'] == question['user_id']:
                            <% username = user['username']%>
                        %endif
                    %endfor
                    <h3>${username} : ${question['title']} ?</h3>
                    <p>${question['content']}</p>
                    <h3>Ajouter une réponse</h3>
                    <form method="POST">
                        <textarea placeholder="Votre réponse" required name="content"></textarea>
                        <input type="hidden" name="question_id" value="${i}">
                        <input type="submit" value="Publier" name="answer">
                    </form>
                        % if answers is not None:
                                <% j = 1%>
                            % for answer in answers:
                                % if answer['question_id'] == question['id']:
                                    % for user in users:
                                        % if user['id'] == question['user_id']:
                                            <% username = user['username']%>
                                    %endif
                                    % endfor
                                    <div class="reply">
                                        <p><strong>${username} : </strong>${answer['content']}</p>                  
                                    </div>
                                <% j = j + 1%>
                                % endif
                            % endfor
                        % endif

                        ## Il faut rajouter le button qui permet de répondre à une question.
                </div>
                    <% i = i + 1%>
                % endfor
            % endif
        </div>
    </body>