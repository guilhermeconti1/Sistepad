

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad- Sistema de Gerenciamento</title>
        <!-- Bootstrap Core CSS -->
        <link href="assets/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="assets/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="/assets/dist/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="assets/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="assets/bower_components/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="assets/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>  

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Autenticação</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" name="login" id="login" method="post" action="/Sistepad/acoes?acao=login">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Digite seu login" name="login" type="text" id="login">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Digite sua senha" name="senha" type="password"  id="senha">  
                                    </div>
                                    
                                    <input type="submit" class="btn btn-lg btn-success btn-block" name="logar" id="logar" value="Entrar">                      
                                </fieldset>                            
                            </form>

                            <%
                                if (request.getAttribute("erro") != null) {
                            %>
                            <hr>
                            
                                <div class="btn-block alert-danger">
                                    Erro de autenticação: Usuário ou senha inválidos!
                                </div>
                           
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
                          <style type="text/css">
            body { background: url(assets/img/1.jpg) #204d74!important; }
        </style>

        <!-- CORE JQUERY SCRIPTS -->        
        <!-- jQuery -->
        <script src="assets/bower_components/jquery/dist/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="assets/bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="assets/bower_components/raphael/raphael-min.js"></script>
        <script src="assets/bower_components/morrisjs/morris.min.js"></script>
        <script src="assets/js/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="assets/dist/js/sb-admin-2.js"></script>
    </body>
</html>
