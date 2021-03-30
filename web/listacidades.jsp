

<%@page import="daos.CidadeDAOs"%>
<%@page import="negocio.Cidade"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Lista de Cidades</title>
    </head>
    <body>


        <% String busCid = (String) request.getParameter("busCid");

            if (busCid == null) {
                busCid = "";
            }

            ArrayList<Cidade> listarCidades = new CidadeDAOs().PopularCidade(busCid);
        %>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tableTrClick">
                    <thead>
                    <tr>
                        <td>Cidade</td>
                        <td>Estado</td>
                    </tr>
                    </thead>
                    <%
                        for (int i = 0; i < listarCidades.size(); i++) {
                    %>
                    <tr>
                        <td><%= listarCidades.get(i).getNome()%></td>
                        <td><%= listarCidades.get(i).getEstado()%></td>                  
                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div> 

        <!--script que pega valor da tabela cidade e preenche os campos do cadastro-->
        <script language="javascript">
            $(document).ready(function () {
                $('#tableTrClick tr').click(function () {
                    // escreve no console
                    console.log($(this).find('td').eq(0).html());
                    console.log($(this).find('td').eq(1).html());

                    // atribui valor ao campo de dados
                    $('#cidade').val($(this).find('td').eq(0).html());
                    $('#estado').val($(this).find('td').eq(1).html());

                    // fecha janela após clique
                    $('#abrir').modal('hide');
                });
            });
        </script>

    </body>
</html>