
<%@page import="daos.ProdutoDAOs"%>
<%@page import="daos.ClienteDAOs"%>
<%@page import="daos.VendaDAOs"%>
<%@page import="negocio.Produto"%>
<%@page import="negocio.Cliente"%>
<%@page import="negocio.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Lista de Venda</title>
    </head>
    <body>
        
         <% String cliente = (String) request.getParameter("cliente");
            String data    = (String) request.getParameter("databusc");
            String criterio = "";
            
            if (cliente == null && data == null) {
                criterio = "";
            } else if (cliente != "" && data.equalsIgnoreCase("")) {
                criterio = "and c.nomecli ilike '%" + cliente + "%'";
            } else if (cliente.equalsIgnoreCase("") && data != "") {
                criterio = "and v.datavenda = '" + data + "'";
            } else if (cliente != "" && data.equalsIgnoreCase("")) {
                criterio = "and c.nomecli ilike  '%" + cliente + "%' and v.datavenda = '" + data + "'";
            }
            ArrayList<Venda> listarVendas = new VendaDAOs().buscarVendaModallistagem(criterio);
        %>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelavenda">
                    <thead>
                        <tr>
                            <td>Código da Venda</td>
                            <td>Produto</td>
                            <td>Cliente</td>
                            <td>Quantidade</td>
                            <td>Valor Unitário</td>
                            <td>Valor total da Venda</td>
                            <td>Data da venda</td>
                            <td>Alterar</td>
                            <td>Excluir</td>
                        </tr>
                    </thead>
                    <%
                        for (int i = 0; i < listarVendas.size(); i++) {
                    %>
                    <tr>
                        <td><%= listarVendas.get(i).getIdvenda()%></td>

                        <!--aqui troca o código da listagem e puxa a palavra na descrição do produto-->
                        <%
                            Produto ven = new ProdutoDAOs().buscarProduto(listarVendas.get(i).getIdproduto());
                        %>  
                        <td><%= ven.getNomeprod()%></td>

                        <!--aqui troca o código da listagem e puxa a palavra na nome cliente-->
                        <%
                            Cliente cli = new ClienteDAOs().buscarCliente(listarVendas.get(i).getIdcliente());
                        %>  
                        <td><%= cli.getNomecli()%></td>

                        <td><%= listarVendas.get(i).getQuantidadevenda()%></td>
                        <td><%= listarVendas.get(i).getValorunit()%></td>
                        <td><%= listarVendas.get(i).getValortotalvenda()%></td>
                        <td><%= listarVendas.get(i).getDatavenda()%></td>
                        <td><a href="/Sistepad/acoes?acao=alteracaoVenda&idvenda=<%=listarVendas.get(i).getIdvenda()%>&idproduto=<%=listarVendas.get(i).getIdproduto()%>" class= " fa fa-edit col-lg-12"></a></td>
                        <td><a href="/Sistepad/acoes?acao=excluiVenda&idvenda=<%=listarVendas.get(i).getIdvenda()%>&idproduto=<%=listarVendas.get(i).getIdproduto()%>" OnClick="return confirm('Deseja realmente excluir esta venda?')" class= " fa fa-trash-o col-lg-12"></a></td>

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
                $('#tabelavenda tr').click(function () {
                    // escreve no console
                    console.log($(this).find('td').eq(0).html());
                    console.log($(this).find('td').eq(1).html());

                    // atribui valor ao campo de dados
                    $('#cidade').val($(this).find('td').eq(0).html());
                    $('#estado').val($(this).find('td').eq(1).html());

                    // fecha janela após clique
                    $('#abrirvenda').modal('hide');
                });
            });
        </script>

    </body>
</html>

