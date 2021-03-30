
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

            if (prod == null) {
                prod = "";
            }
            ArrayList<Produto> produt = new ProdutoDAOs().buscarProdutoModal(prod);

        %>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaproduto">
                    <thead>
                        <tr>
                            <td>Produto</td>
                            <td>Descrição do produto</td>
                            <td>Categoria</td>
                            <td>Unidade de Medida</td>
                            <td>Valor Unitário</td>
                        </tr>
                    </thead>
                    <%                        for (int i = 0; i < produt.size(); i++) {
                    %>
                    <tr>
                        <td style="display: none;"><%= produt.get(i).getIdproduto()%></td>
                        <td><%= produt.get(i).getNomeprod()%></td>
                        <td><%= produt.get(i).getDescricaoprod()%></td>
                        <%
                            CategoriaProduto cat = new CategoriaProdutoDAOs().buscarCategoriaProduto(produt.get(i).getCodcategoriaproduto());
                        %>  
                        <td><%= cat.getDescricaocat()%></td>
                        <%
                            UnidadeMedida unidd = new UnidadeMedidaDAOs().buscarUnidadeMedida(produt.get(i).getCodunidademedida());
                        %>  
                        <td><%= unidd.getNome()%></td>
                        <td><%= produt.get(i).getPrecoprod()%></td>
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
                $('#tabelaproduto tr').click(function () {
                    // escreve no console
                    console.log($(this).find('td').eq(0).html());
                    console.log($(this).find('td').eq(1).html());
                    console.log($(this).find('td').eq(5).html());


                    // atribui valor ao campo de dados
                    $('#idproduto').val($(this).find('td').eq(0).html());
                    $('#nomeprod').val($(this).find('td').eq(1).html());
                    $('#valorunit').val($(this).find('td').eq(5).html());


                    // fecha janela após clique
                    $('#abrirproduto').modal('hide');
                });
            });
        </script>

    </body>
</html>



