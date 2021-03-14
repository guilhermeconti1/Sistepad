
<%@page import="daos.UnidadeMedidaDAOs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.UnidadeMedida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem de Unidade Medida</title>
    </head>
    <body>

        
        <% String um = (String) request.getParameter("um");

            if (um == null) {
                um = "";
            }
            ArrayList<UnidadeMedida> unid = new UnidadeMedidaDAOs().buscarUnidadeMedidaListagem(um);

        %>
        

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaunidademedida">
                    <thead>
                    <tr>
                        <td>Nome</td>
                        <td>Status</td>
                        <td>Alterar</td>
                        <td>Excluir</td>
                    </tr>
                    </thead>
                    <%
                        for (int i = 0; i < unid.size(); i++) {
                    %>
                    <tr>
                        <td><%= unid.get(i).getNome()%></td>
                        <td><%= unid.get(i).getStatus()%></td>

                        <td><a href="/Sistepad/acoes?acao=alteracaoUnidadeMedida&codunidademedida=<%= unid.get(i).getCodUnidadeMedida()%>"  class= " fa fa-edit col-lg-12"></a></td>
                        <td><a href="/Sistepad/acoes?acao=excluiUnidadeMedida&codunidademedida=<%= unid.get(i).getCodUnidadeMedida()%>" OnClick="return confirm('Deseja realmente excluir esta Unidade de medida?')" class= " fa fa-trash-o col-lg-12"></a></td>
                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div>
    </body>
</html>
