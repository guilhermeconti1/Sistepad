

<%@page import="daos.FornecedorDAOs"%>
<%@page import="negocio.Fornecedor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem de Fornecedores</title>
    </head>
    <body>


        <% String fn = (String) request.getParameter("fn");

            if (fn == null) {
                fn = "";
            }
            ArrayList<Fornecedor> fornecedorr = new FornecedorDAOs().buscarFornecedorModal(fn);
        %>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelafornecedor">
                    <thead>
                    <tr>
                        <td>Razão Social</td>
                        <td>CNPJ</td>
                        <td>Fone</td>
                        <td>Endereço</td>
                        <td>Cidade</td>
                        <td>Estado</td>
                    </tr>
                    </thead>
                    <%
                        for (int i = 0; i < fornecedorr.size(); i++) {
                    %>
                    <tr>
                        <td style="display: none;"><%= fornecedorr.get(i).getIdfornecedor()%></td>
                        <td><%= fornecedorr.get(i).getRazaoSocial()%></td>
                        <td><%= fornecedorr.get(i).getCnpj()%></td>
                        <td><%= fornecedorr.get(i).getFonefornec()%></td>
                        <td><%= fornecedorr.get(i).getEnderecofornec()%></td>
                        <td><%= fornecedorr.get(i).getCidade()%></td>
                        <td><%= fornecedorr.get(i).getEstado()%></td>
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
                $('#tabelafornecedor tr').click(function () {
                    // escreve no console
                    console.log($(this).find('td').eq(0).html());
                    console.log($(this).find('td').eq(1).html());
                    console.log($(this).find('td').eq(2).html());
                    console.log($(this).find('td').eq(3).html());
                    console.log($(this).find('td').eq(4).html());
                    console.log($(this).find('td').eq(5).html());
                    console.log($(this).find('td').eq(6).html());


                    // atribui valor ao campo de dados
                    $('#idfornecedorr').val($(this).find('td').eq(0).html());
                    $('#razaosocial').val($(this).find('td').eq(1).html());
                    $('#cnpj').val($(this).find('td').eq(2).html());
                    $('#fonefornec').val($(this).find('td').eq(3).html());
                    $('#enderecofornec').val($(this).find('td').eq(4).html());
                    $('#cidade').val($(this).find('td').eq(5).html());
                    $('#estado').val($(this).find('td').eq(6).html());




                    // fecha janela após clique
                    $('#abrirfornecedor').modal('hide');
                });
            });
        </script>

    </body>
</html>