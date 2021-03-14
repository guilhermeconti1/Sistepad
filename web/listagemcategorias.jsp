

<%@page import="daos.CategoriaProdutoDAOs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.CategoriaProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem de Categorias</title>
    </head>
    <body>
        
      <% String cep = (String) request.getParameter("cep");

            if (cep == null) {
                cep = "";
            }
            ArrayList<CategoriaProduto> cepe = new CategoriaProdutoDAOs().buscarCategoriaProdutosListagem(cep);

        %>
        
       
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelacategorias">
                    <thead>
                    <tr>
                        <td>Descrição</td>
                        <td>Alterar</td>
                        <td>Excluir</td>
                    </tr>
                    </thead>
                    <%
                        for (int i = 0; i < cepe.size(); i++) {
                    %>
                    <tr>
                        <td><%= cepe.get(i).getDescricaocat()%></td>

                        <td><a href="/Sistepad/acoes?acao=alteracaoCategoriaProduto&codcategoria=<%= cepe.get(i).getCodcategoria()%>" class= " fa fa-edit col-lg-12"></a></td>
                        <td><a href="/Sistepad/acoes?acao=excluiCategoriaProduto&codcategoria=<%= cepe.get(i).getCodcategoria()%>" OnClick="return confirm('Deseja realmente excluir a categoria do produto?')" class= " fa fa-trash-o col-lg-12"></a></td>
                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div>
    </body>
</html>
