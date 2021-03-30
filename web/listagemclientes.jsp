
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
            String cpf = (String) request.getParameter("cpfbusc");
            String criterio = "'1'";

            if (cli == null && cpf == null) {
                criterio = "'1'";
            } else if (cli != "" && cpf == "") {
                criterio = "nomecli ilike '%" + cli + "%'";
            } else if (cli == "" && cpf != "") {
                criterio = "cpf ilike '%" + cpf + "%'";
            } else if (cli != "" && cpf != "") {
                criterio = "nomecli ilike  '%" + cli + "%' and cpf ilike '%" + cpf + "%'";
            }
            ArrayList<Cliente> clientes = new ClienteDAOs().buscarClienteModallistagem(criterio);

        %>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaclient">
                    <thead>
                        <tr>
                            <td>Nome</td>
                            <td>Sexo</td>
                            <td>Idade</td>
                            <td>Celular</td>
                            <td>CPF</td>
                            <td>Endereço</td>
                            <td>Cidade</td>
                            <td>Estado</td>
                            <td>Alterar</td>
                            <td>Excluir</td>
                        </tr>
                    </thead>
                    <%                        for (int i = 0; i < clientes.size(); i++) {
                    %>
                    <tr>
                        <td><%= clientes.get(i).getNomecli()%></td>
                        <td><%= clientes.get(i).getSexo()%></td>
                        <td><%= clientes.get(i).getIdade()%></td>
                        <td><%= clientes.get(i).getCelular()%></td>
                        <td><%= clientes.get(i).getCpf()%></td>
                        <td><%= clientes.get(i).getEnderecocli()%></td>
                        <td><%= clientes.get(i).getCidade()%></td>
                        <td><%= clientes.get(i).getEstado()%></td>
                        <td><a href="/Sistepad/acoes?acao=alteracaoCli&idcliente=<%= clientes.get(i).getIdcliente()%>" class= " fa fa-edit col-lg-12"></a></td>
                        <td><a href="/Sistepad/acoes?acao=excluiCli&idcliente=<%= clientes.get(i).getIdcliente()%>" OnClick="return confirm('O cliente será excluido. Deseja realmente fazer isso?')" class= " fa fa-trash-o col-lg-12"></a></td>
                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div>
    </body>
</html>
