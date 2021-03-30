

<%@page import="daos.UnidadeMedidaDAOs"%>
<%@page import="negocio.UnidadeMedida"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem Moedas</title>
    </head>
    <body>


        <% String um = (String) request.getParameter("um");

            if (um == null) {
                um = "";
            }

            ArrayList<UnidadeMedida> unidadeMedida = new UnidadeMedidaDAOs().buscarUnidadeMedidaModal(um);
        %>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaunidade">
                    <thead>
                    <tr>
                        <td>Descrição</td>
                    </tr>
                    </thead>
                    <%
                        for (int i = 0; i < unidadeMedida.size(); i++) {
                    %>
                    <tr>
                        <td style="display: none;"><%= unidadeMedida.get(i).getCodUnidadeMedida()%></td>
                        <td><%= unidadeMedida.get(i).getNome()%></td>

                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div> 

        <!--script que pega valor da tabela categoria e preenche os campos do cadastro-->
        <script language="javascript">
            $(document).ready(function () {
                $('#tabelaunidade tr').click(function () {
                    // escreve no console
                    console.log($(this).find('td').eq(0).html());
                    console.log($(this).find('td').eq(1).html());

                    // atribui valor ao campo de dados
                    $('#codunidmed').val($(this).find('td').eq(0).html());
                    $('#nomeunidd').val($(this).find('td').eq(1).html());

                    // fecha janela após clique
                    $('#abrirunidade').modal('hide');
                });
            });
        </script>

    </body>
</html>