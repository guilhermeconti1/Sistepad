
<%@page import="daos.UnidadeMedidaDAOs"%>
<%@page import="negocio.UnidadeMedida"%>
<%@page import="daos.CategoriaProdutoDAOs"%>
<%@page import="negocio.CategoriaProduto"%>
<%@page import="daos.ProdutoDAOs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem de Produto</title>
    </head>
    <body>

        <% String prod = (String) request.getParameter("prod");
            String dataprimeiravenda = (String) request.getParameter("databusc");
            String criterio = "'1'";

            if (prod == null && dataprimeiravenda == null) {
                criterio = "'1'";
            } else if (prod != "" && dataprimeiravenda.equalsIgnoreCase("")) {
                criterio = "nomeprod ilike '%" + prod + "%'";
            } else if (prod.equalsIgnoreCase("") && dataprimeiravenda.equalsIgnoreCase("")) {
                criterio = "dataprimeiravenda = '" + dataprimeiravenda + "'";
            } else if (prod != "" && dataprimeiravenda.equalsIgnoreCase("")) {
                criterio = "nomeprod ilike  '%" + prod + "%' and dataprimeiravenda = '" + dataprimeiravenda + "'";
            }
            ArrayList<Produto> produto = new ProdutoDAOs().buscarProdutoModallistagem(criterio);

        %>


        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaprodu">
                    <thead>
                        <tr>
                            <td>Nome do Produto</td>
                            <td>Descrição do Produto</td>
                            <td>Categoria de Produto</td>
                            <td>Unidade de Medida</td>
                            <td>Preço do Produto</td>
                            <td>Data primeira Venda</td>
                            <td>Alterar</td>
                            <td>Excluir</td>
                        </tr>
                    </thead>
                    <%                        for (int i = 0; i < produto.size(); i++) {
                    %>
                    <tr>
                        <td><%= produto.get(i).getNomeprod()%></td>
                        <td><%= produto.get(i).getDescricaoprod()%></td>
                        <!--aqui troca o código da listagem e puxa a palavra na descrição da categoria de produto-->
                        <%
                            CategoriaProduto cat = new CategoriaProdutoDAOs().buscarCategoriaProduto(produto.get(i).getCodcategoriaproduto());
                        %>  
                        <td><%= cat.getDescricaocat()%></td>
                        <!--aqui troca o código da listagem e puxa a palavra na descrição da unidade de medida-->
                        <%
                            UnidadeMedida unide = new UnidadeMedidaDAOs().buscarUnidadeMedida(produto.get(i).getCodunidademedida());
                        %> 
                        <td><%= unide.getNome()%></td>
                        <td><%= produto.get(i).getPrecoprod()%></td>
                        <td><%= produto.get(i).getDataprimeiravenda()%></td>

                        <td><a href="/Sistepad/acoes?acao=alteracaoProduto&idproduto=<%= produto.get(i).getIdproduto()%>"  class= " fa fa-edit col-lg-12"></a></td>
                        <td><a href="/Sistepad/acoes?acao=excluiProduto&idproduto=<%= produto.get(i).getIdproduto()%>" OnClick="return confirm('O produto será excluido. Deseja realmente fazer isso?')" class= " fa fa-trash-o col-lg-12"></a></td>
                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div>
    </body>
</html>
