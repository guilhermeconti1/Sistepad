
<%@page import="daos.FornecedorDAOs"%>
<%@page import="negocio.Fornecedor"%>
<%@page import="daos.EstoqueDAOs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.Estoque"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem de Estoque</title>
    </head>
    <body>

        <% String estq = (String) request.getParameter("estq");

            if (estq == null) {
                estq = "";
            }
            ArrayList<Estoque> estoque = new EstoqueDAOs().buscarEstoqueModal(estq);

        %>


        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaestoque">
                    <thead>
                        <tr>
                            <td>Nome do Suprimento</td>
                            <td>Fornecedor</td>
                            <td>Preço Unitário</td>
                            <td>Validade</td>
                            <td>Quantidade</td>
                            <td>Alterar</td>
                            <td>Excluir</td>
                        </tr>
                    </thead>
                    <%                        for (int i = 0; i < estoque.size(); i++) {
                    %>
                    <tr>
                        <!--aqui troca o código da listagem e puxa a palavra na descrição do fornecedor-->
                        <%
                            Fornecedor forne = new FornecedorDAOs().buscarFornecedor(estoque.get(i).getIdfornecedor());
                        %> 
                        <td><%= forne.getRazaoSocial()%></td>
                        <td><%= estoque.get(i).getNomesuprimento()%></td>
                        <td><%= estoque.get(i).getPrecoestoque()%></td>
                        <td><%= estoque.get(i).getValidade()%></td>
                        <td><%= estoque.get(i).getQuantidadeestoque()%></td>
                        <td><a href="/Sistepad/acoes?acao=alteracaoEstoque&idestoque=<%= estoque.get(i).getIdestoque()%>"  class= " fa fa-edit col-lg-12"></a></td>
                        <td><a href="/Sistepad/acoes?acao=excluiEstoque&idestoque=<%= estoque.get(i).getIdestoque()%>" OnClick="return confirm('Este item  excluido. Deseja realmente fazer isso?')" class= " fa fa-trash-o col-lg-12"></a></td>
                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div>
    </body>
</html>
