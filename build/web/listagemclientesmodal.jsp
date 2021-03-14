


<%@page import="daos.ClienteDAOs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Listagem de Clientes</title>
    </head>
    <body>


        <% String cli = (String) request.getParameter("cli");

            if (cli == null) {
                cli = "";
            }
            ArrayList<Cliente> client = new ClienteDAOs().buscarClienteModal(cli);

        %>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaclientes">
                    <thead>
                        <tr>
                            <td>Nome</td>
                            <td>Celular</td>
                            <td>CPF</td>
                            <td>Endereço</td>
                            <td>Cidade</td>
                            <td>Estado</td>
                        </tr>
                    </thead>
                    <%                        for (int i = 0; i < client.size(); i++) {
                    %>
                    <tr>
                        <td style="display: none;"><%= client.get(i).getIdcliente()%></td>
                        <td><%= client.get(i).getNomecli()%></td>
                        <td><%= client.get(i).getCelular()%></td>
                        <td><%= client.get(i).getCpf()%></td>
                        <td><%= client.get(i).getEnderecocli()%></td>
                        <td><%= client.get(i).getCidade()%></td>
                        <td><%= client.get(i).getEstado()%></td>


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
                $('#tabelaclientes tr').click(function () {
                    // escreve no console
                    console.log($(this).find('td').eq(0).html());
                    console.log($(this).find('td').eq(1).html());
                    console.log($(this).find('td').eq(2).html());
                    console.log($(this).find('td').eq(3).html());
                    console.log($(this).find('td').eq(4).html());
                    console.log($(this).find('td').eq(5).html());
                    console.log($(this).find('td').eq(6).html());


                    // atribui valor ao campo de dados
                    $('#idcliente').val($(this).find('td').eq(0).html());
                    $('#nomecli').val($(this).find('td').eq(1).html());
                    $('#celular').val($(this).find('td').eq(2).html());
                    $('#cpf').val($(this).find('td').eq(3).html());
                    $('#enderecocli').val($(this).find('td').eq(4).html());
                    $('#cidade').val($(this).find('td').eq(5).html());
                    $('#estado').val($(this).find('td').eq(6).html());

                    // fecha janela após clique
                    $('#abrirclientes').modal('hide');
                });
            });
        </script>

    </body>
</html>



