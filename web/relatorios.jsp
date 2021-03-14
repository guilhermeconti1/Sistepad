

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de Relatórios</title>
    </head>

    <body>
        <%@include file="menu.jsp"%>

        <div id="page-wrapper">
            <br>
            <br>
            <div>
                <a><i class="fa fa-dashboard fa-fw"></i> Clientes</a>
                <div>
                    <a href="/Sistepad/acoes?acao=GerarCliente" class="btn btn-primary col-md-3">Listagem Completa</a>
                    <br>
                    <br>
                    <a href="/Sistepad/acoes?acao=GerarClienteNome" class="btn btn-primary col-md-3">Lisgem por Nomes</a>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
            <div>
                <a><i class="fa fa-table fa-fw"></i> Produto</a>
                <div>
                    <a href="/Sistepad/acoes?acao=GerarProduto" class="btn btn-primary col-md-3">Listagem Completa</a>
                    <br>
                    <br>
                    <a href="/Sistepad/acoes?acao=GerarProdutoNome" class="btn btn-primary col-md-3">Listagem por Nomes Produtos</a>
                    <br>
                    <br>
                    <a href="/Sistepad/acoes?acao=GerarProdutoData" class="btn btn-primary col-md-3">Lista por data de Cadastro</a>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
            <div>
                <a><i class="glyphicon glyphicon-record"></i> Unidade Medida</a>
                <div>
                    <a href="/Sistepad/acoes?acao=GerarUnidadeMedida" class="btn btn-primary col-md-3">Listagem Completa</a>
                    <br>
                    <br>
                    <a href="/Sistepad/acoes?acao=GerarProdutoNome" class="btn btn-primary col-md-3">Listagem por Nomes Produtos</a>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
