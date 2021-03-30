

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Erro</title>
    </head>
    <body>
        <h1>Erro no login, tente novamente!</h1>
        
        <a href="<%= request.getAttribute("origem") %>">Voltar</a>
    </body>
</html>
