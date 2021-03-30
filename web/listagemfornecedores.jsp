

<%@page import="daos.FornecedorDAOs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.Fornecedor"%>
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
            ArrayList<Fornecedor> fornecedor = new FornecedorDAOs().buscarFornecedorModal2(fn);

        %>
 
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-hover" id="tabelaforn">
                    <thead>
                    <tr>
                        <td>Razão Social</td>
                        <td>Pessoa Responsável</td>
                        <td>CNPJ</td>
                        <td>Email</td>
                        <td>Site</td>
                        <td>Fone</td>
                        <td>Endereço</td>
                        <td>Cidade</td>
                        <td>Estado</td>
                        <td>Alterar</td>
                        <td>Excluir</td>
                    </tr>
                    </thead>
                    <%
                        for (int i = 0; i < fornecedor.size(); i++) {
                    %>
                    <tr>
                        <td><%= fornecedor.get(i).getRazaoSocial()%></td>
                        <td><%= fornecedor.get(i).getPessoaResponsavel()%></td>
                        <td><%= fornecedor.get(i).getCnpj()%></td>
                        <td><%= fornecedor.get(i).getEmail()%></td>
                        <td><%= fornecedor.get(i).getSite()%></td>
                        <td><%= fornecedor.get(i).getFonefornec()%></td>
                       <td><%= fornecedor.get(i).getEnderecofornec()%></td>
                        <td><%= fornecedor.get(i).getCidade()%></td>
                        <td><%= fornecedor.get(i).getEstado()%></td>
                        <td><a href="/Sistepad/acoes?acao=alteracaoFornec&idfornecedor=<%= fornecedor.get(i).getIdfornecedor()%>"  class= " fa fa-edit col-lg-12"></a></td>
                        <td><a href="/Sistepad/acoes?acao=excluiFornec&idfornecedor=<%= fornecedor.get(i).getIdfornecedor()%>" OnClick="return confirm('Deseja realmente excluir o fornecedor')" class= " fa fa-trash-o col-lg-12"></a></td>
                    </tr>
                    <%
                        }
                    %>    
                </table>
            </div>
        </div>
    </body>
</html>
