

<%@page import="daos.CategoriaProdutoDAOs"%>
<%@page import="negocio.CategoriaProduto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem de Categorias de Produtos</title>
    </head>
    <body>


        <% String cp = (String) request.getParameter("cp");

            if (cp == null) {
                cp = "";
            }

            ArrayList<CategoriaProduto> categoriaProduto = new CategoriaProdutoDAOs().buscarCategoriaProdutos(cp);
        %>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaCategoria">
                    <thead>
                        <tr>
                            <td>Descrição</td>

                        </tr>
                    </thead>
                    <%
                        for (int i = 0; i < categoriaProduto.size(); i++) {
                    %>
                    <tr>
                        <td style="display: none;"><%= categoriaProduto.get(i).getCodcategoria()%></td>
                        <td><%= categoriaProduto.get(i).getDescricaocat()%></td>

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
                $('#tabelaCategoria tr').click(function () {
                    // escreve no console
                    console.log($(this).find('td').eq(0).html());
                    console.log($(this).find('td').eq(1).html());

                    // atribui valor ao campo de dados
                    $('#codcatpro').val($(this).find('td').eq(0).html());
                    $('#descricaocat').val($(this).find('td').eq(1).html());

                    // fecha janela após clique
                    $('#abrircategoria').modal('hide');
                });
            });
        </script>

    </body>
</html>