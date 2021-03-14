
<%@page import="negocio.UsuarioSistema"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sessao = request.getSession();
    UsuarioSistema u = (UsuarioSistema) sessao.getAttribute("usuarioLogado");

    if (u != null) {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad- Sistema de Gerenciamento de Padarias</title>
        <!-- Bootstrap Core CSS -->
        <link href="assets/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="assets/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="/assets/dist/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="assets/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Minhas validações -->
        <script type="text/javascript" src="assets/js/validacao.js"></script>

        <!-- Morris Charts CSS -->
        <link href="assets/bower_components/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="assets/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">



    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 2">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="menu.jsp">Sistepad - Sistema de Gerenciamento de Padarias</a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i><%= u.getNomeusuario()%> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> <%= u.getNomeusuario()%> </a> 
                            </li>

                            <li class="divider"></li>
                            <li><a href="/Sistepad/acoes?acao=logout"><i class="fa fa-sign-out fa-fw"></i> Sair</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->        
                    </li>
                    <!-- /.dropdown -->



                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="clientes.jsp"><i class="fa  fa-users fa-fw"></i> Clientes</a>
                         
                            </li>
                            <li>
                                <a href="produto.jsp"><i class="fa fa-table fa-fw"></i> Produto</a>
                            </li>
                            <li>
                                <a href="unidademedida.jsp"><i class="glyphicon glyphicon-record"></i> Unidade de Medida</a>
                            </li>
                            <li>
                                <a href="categoriaproduto.jsp"><i class="glyphicon glyphicon-filter"></i> Categoria de Produto</a>
                            </li>
                            <li>
                                <a href="venda.jsp"><i class="fa  fa-briefcase fa-fw"></i> Vendas</a>
                            </li>
                            <li>
                                <a href="estoque.jsp"><i class="glyphicon glyphicon-list-alt"></i> Controle de Estoque</a>
                            </li>
                            <li>
                                <a href="fornecedores.jsp"><i class="fa fa-truck"></i> Fornecedores</a>
                            </li>

                          
                            <li>
                                <a href="relatorios.jsp"><i class="fa fa-dashboard fa-fw"></i> Relatórios</a>
                            </li>

                            <li>

                                <a href="/Sistepad/acoes?acao=logout"><i class="glyphicon glyphicon-remove-sign"></i> Sair</a>
                            </li>

                        </ul>

                    </div>

                </div>
                <!-- /.navbar-static-side -->


            </nav>

        </div>   






        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>

        <!-- Bootstrap Core JavaScript -->
        <!--        <script src="assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>-->
        <script src="assets/bower_components/bootstrap/dist/js/bootstrap.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="assets/bower_components/metisMenu/dist/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="assets/bower_components/raphael/raphael-min.js"></script>
        <script src="assets/bower_components/morrisjs/morris.min.js"></script>
        <script src="assets/js/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="assets/dist/js/sb-admin-2.js"></script>

        <!-- importação dos arquivos para funcionar a modal -->
        <script type="text/javascript" src="assets/js-modal/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="assets/js-modal/bootstrap.js"></script>

    </body>
</html>

