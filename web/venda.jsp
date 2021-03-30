
<%@page import="daos.ClienteDAOs"%>
<%@page import="negocio.Cliente"%>
<%@page import="daos.ProdutoDAOs"%>
<%@page import="negocio.Produto"%>
<%@page import="daos.VendaDAOs"%>
<%@page import="negocio.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.VendaDAOs"%>
<%@page import="negocio.Venda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- aqui no head é o nome da aba URL -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - despesas</title>
    </head>

    <body>
        <%@include file="menu.jsp" %>
        <!-- Aqui pega a variavel da ações e confere se tem algo parecido-->

        <%String validacao = (String) request.getAttribute("validacao");

            if (validacao == null) {
                validacao = "S";
            }

            Venda v;
            Venda anterior = (Venda) request.getAttribute("anterior");
            if (validacao.equals("S") && anterior == null) {
                v = new Venda();
                v.setIdvenda(0);
                v.setIdproduto(0);
                v.setIdcliente(0);
                v.setQuantidadevenda(0);
                v.setValorunit(0);
                v.setValortotalvenda(0);
                v.setDatavenda("");

            } else if (validacao.equals("S") && anterior != null) {
                v = (Venda) request.getAttribute("anterior");
                v.setIdproduto(0);
                v.setQuantidadevenda(0);
                v.setValorunit(0);
                v.setValortotalvenda(0);

            } else {
                v = (Venda) request.getAttribute("v");
            }
        %>
        <div id="page-wrapper">
            <br>
            <br>

            <div class="panel panel-default">
                <form name="cadVenda" id="cadVenda" method="post" action="/Sistepad/acoes?acao=cadastroVenda&validacao=<%=validacao%>" onSubmit="return validarCampos(this)">

                    <div class="panel-heading">
                        VENDA
                    </div>
                    <div class="panel-body">
                        <div class="row">


                            <!-- Div Codigo da venda-->
                            <div class="col-lg-12">
                                * <label>Código da Venda</label>
                            </div>
                            <div>
                                <div class="col-lg-6">
                                    <%if (v.getIdvenda() == 0) {
                                    %>
                                    <input onKeyUp="javascript:somenteNumero(this);" placeholder="Digite o código da venda" type="text"  class="form-control" id="idvenda" name="idvenda" value="">
                                    <%
                                    } else {
                                    %>
                                    <input onKeyUp="javascript:somenteNumero(this);" type="text" class="form-control" id="idvenda" name="idvenda" value="<%= v.getIdvenda()%>" readonly>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="col-lg-2">
                                    <a href="venda.jsp" class="btn btn-success">Nova venda</a>
                                </div>
                                <br>
                                <br> 
                            </div>
                            <br>
                            <br>  

                            <!-- Div Produto-->
                            <div>
                                <div class="col-lg-6">
                                    * <label for="idproduto" > Produto</label>
                                    <input type="hidden" name="idproduto" id="idproduto" value="<%= v.getIdproduto()%>">
                                    <%if (v.getIdproduto() == 0) {
                                    %> 
                                    <input type="text" class="form-control" id="nomeprod" name="nomeprod" value="" readonly> 
                                    <%
                                    } else {
                                        Produto pn = new ProdutoDAOs().buscarProduto(v.getIdproduto());
                                    %>
                                    <input type="text"  class="form-control" id="nomeprod" name="nomeprod" value="<%= pn.getNomeprod()%>" readonly>      
                                    <%
                                        }
                                    %>
                                </div>
                                <br>
                                <div>
                                    <%if (v.getIdproduto() == 0) {
                                    %>
                                    <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#abrirproduto">Buscar</button>

                                    <%
                                    } else {
                                    %>
                                    <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#abrirproduto" disabled>Buscar</button> 
                                    <%
                                        }
                                    %>
                                </div>

                            </div>
                            <br> 


                            <!-- Div Cliente-->
                            <div>
                                <div class="col-lg-6">
                                    * <label for="idcliente" > Cliente</label>
                                    <input type="hidden" name="idcliente" id="idcliente" value="<%= v.getIdcliente()%>">
                                    <%if (v.getIdcliente()
                                                == 0) {
                                    %> 
                                    <input type="text" class="form-control" id="nomecli" name="nomecli" value="" readonly> 
                                    <%
                                    } else {
                                        Cliente cn = new ClienteDAOs().buscarCliente(v.getIdcliente());
                                    %>
                                    <input type="text"  class="form-control" id="nomecli" name="nomecli" value="<%= cn.getNomecli()%>" readonly>      
                                    <%
                                        }
                                    %>
                                </div>
                                <br>
                                <div>
                                    <%if (v.getIdcliente() == 0) {
                                    %>
                                    <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#abrirclientes">Buscar</button>
                                    <%
                                    } else {
                                    %>
                                    <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#abrirclientes" disabled>Buscar</button>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <br> 
                            <!-- Div Quantidade-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Quantidade</label>
                                    <div>
                                        <%if (v.getQuantidadevenda()
                                                    == 0) {
                                        %>
                                        <input onKeyUp="multiplicar();" onKeyUp="javascript:somenteNumero(this);" type="text" placeholder="Quantidade"  class="form-control" id="quantidadevenda" name="quantidadevenda" value="">
                                        <%
                                        } else {
                                        %>
                                        <input onKeyUp="multiplicar();" onKeyUp="javascript:somenteNumero(this);" type="text" class="form-control" id="quantidadevenda" name="quantidadevenda" value="<%= v.getQuantidadevenda()%>">
                                        <%
                                            }
                                        %>
                                    </div>

                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>

                            <!-- Div Valor Unitário-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Valor Unitário</label>
                                    <div>
                                        <%if (v.getValorunit()
                                                    == 0) {
                                        %>
                                        <input onKeyUp="multiplicar();" onKeyUp="javascript:somenteNumero(this);" type="text" placeholder="Valor unitário"  class="form-control" id="valorunit" name="valorunit" value="" readonly>
                                        <%
                                        } else {
                                        %>
                                        <input onKeyUp="multiplicar();" onKeyUp="javascript:somenteNumero(this);" type="text" class="form-control" id="valorunit" name="valorunit" value="<%= v.getValorunit()%>" readonly> 
                                        <%
                                            }
                                        %>
                                    </div>

                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Valor Total-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Valor Total da Venda</label>
                                    <div>
                                        <%if (v.getValortotalvenda()
                                                    == 0) {
                                        %>
                                        <input onKeyUp="multiplicar();" onKeyUp="javascript:somenteNumero(this);" type="text" placeholder="Valor total da venda"  class="form-control" id="valortotalvenda" name="valortotalvenda" value="" readonly> 
                                        <%
                                        } else {
                                        %>
                                        <input onKeyUp="multiplicar();" onKeyUp="javascript:somenteNumero(this);" type="text" class="form-control" id="valortotalvenda" name="valortotalvenda" value="<%= v.getValortotalvenda()%>"readonly> 
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <br>
                                <br> 
                            </div>
                            <br>
                            <br>

                            <!-- Div Data da Venda-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Data da Venda</label>
                                    <input type="date" class="form-control" maxlength="60" id="datavenda" name="datavenda" placeholder="Data da Venda" value="<%= v.getDatavenda()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <div class="col-lg-4">
                                <!-- Div Botões-->
                                <button type="submit" id="btngravar" name="btngravar" class="btn btn-success">Gravar Venda</button>
                                <button type="reset" id="reset" name="reset" class="btn btn-danger">Limpar Campo</button>
                            </div>
                        </div>
                    </div>
                </form>
               
                <!-- form chamada da listagem da lista estoque-->
                <div class="row">
                <form name="pespr" id="pespr" method="post" action="">    
                    
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-list-alt"></i> Venda </h3>
                            </div>
                            <br>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="cliente" name="cliente" placeholder="Digite o nome do cliente" value="">
                            </div>
                            <div class="col-md-3">
                                <input type="date" class="form-control" id="databusc" name="databusc" placeholder="Digite a data a ser pesquisada " value="">
                            </div>
                            <input class="btn btn-primary" type="submit" id="btnBuscar" name="btnBuscar" value="Buscar">
                            <input class="btn btn-warning" type="button" id="btnLimpar" name="btnLimpar" value="Limpar" onclick="document.pespr.reset();">
                            <div class="panel-body">
                            <%@include file="listagemvenda.jsp" %>
                            <a href="/Sistepad/acoes?acao=GerarVenda" class="btn btn-primary col-md-2">Relátorio (CSV)</a>
                        </div>
                            </div>
                    </div>
                </form>
                </div> 
            </div>
        </div>
        <!-- Modal de Produto -->
        <div class="modal fade" id="abrirproduto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="pesprod" id="pesprod" method="post" action="">
                        <div class="col-lg-02">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Lista de Produtos </h3>
                                </div>

                                <br>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="prod" name="prod" placeholder="Produto" onfocus="this.value = '';" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarProduto" name="btnBuscarProduto" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparProduto" name="btnLimparProduto" value="Limpar" onclick = "document.pesprod.reset();">
                                <%@include file="listagemprodutomodal.jsp" %>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- Modal de Cliente -->
        <div class="modal fade" id="abrirclientes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="pesclie" id="pesclie" method="post" action="">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Lista de Clientes </h3>
                                </div>

                                <br>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="cli" name="cli" placeholder="Cliente" onfocus="this.value = '';" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarCliente" name="btnBuscarCliente" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparCliente" name="btnLimparCliente" value="Limpar" onclick = "document.pesclie.reset();">
                                <%@include file="listagemclientesmodal.jsp" %>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <div>
            <%if (request.getAttribute("cadastrado") != null) {
            %>
            <script type="text/javascript">
                alert("Este item já está cadastrado nesta venda!!!");
            </script>
            <%
                }
            %>
        </div>
  <!--script que verifica se os campos estão completos-->
        <script type="text/javascript" language="javascript">
            function validarCampos() {

                if (document.getElementById("idvenda").value == "") {
                    alert('Você deve digitar o id da nova venda!');
                    document.getElementById("idvenda").focus();
                    return false
                }
                if (document.getElementById("nomeprod").value == "") {
                    alert('Você deve selecionar um produto para a sua venda!');
                    document.getElementById("nomeprod").focus();
                    return false
                }
                if (document.getElementById("nomecli").value == "") {
                    alert('Você deve selecionar um cliente para a sua venda!');
                    document.getElementById("nomecli").focus();
                    return false
                }
                if (document.getElementById("quantidadevenda").value == "") {
                    alert('Você deve digitar a quantidade para gerar a venda!');
                    document.getElementById("quantidadevenda").focus();
                    return false
                }
                if (document.getElementById("datavenda").value == "") {
                    alert('Você deve informar a data da venda!');
                    document.getElementById("datavenda").focus();
                    return false
                }
  
            }
        </script>
        <script>
            function multiplicar() {
                m1 = document.getElementById("quantidadevenda").value;
                m2 = document.getElementById("valorunit").value;
                r = m1 * m2;
                document.getElementById("valortotalvenda").value = r;
            }
        </script>
        <!--script que boqueia campo de busca da modal Produto-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarProduto").click(function () {
                    // desabilitando o campo
                    $('#prod').attr("disabled", true);
                    $('#btnBuscarProduto').attr("disabled", true);
                });
                $("#btnLimparProduto").click(function () {
                    // habilita o campo
                    $('#prod').attr("disabled", false);
                    $('#btnBuscarProduto').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela Produto, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarProduto').click(function () {
                $.ajax({
                    url: "listagemprodutomodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaproduto').html(html);
                });
                return false;
            });
        </script>


        <!--script que atualiza a tabela Produto, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparProduto').click(function () {
                $.ajax({
                    url: "listagemprodutomodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaproduto').html(html);
                });
                return false;
            }
            );
        </script>

        <!--script que boqueia campo de busca da modal Cliente-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarCliente").click(function () {
                    // desabilitando o campo
                    $('#cli').attr("disabled", true);
                    $('#btnBuscarCliente').attr("disabled", true);
                });
                $("#btnLimparCliente").click(function () {
                    // habilita o campo
                    $('#cli').attr("disabled", false);
                    $('#btnBuscarCliente').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela Cliente, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarCliente').click(function () {
                $.ajax({
                    url: "listagemclientesmodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaclientes').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela Cliente, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparCliente').click(function () {
                $.ajax({
                    url: "listagemclientesmodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaclientes').html(html);
                });
                return false;
            }
            );
        </script>

        <script language="javascript">
            function somenteNumero(campo) {
                var digits = "0123456789"
                var campo_temp
                for (var i = 0; i < campo.value.length; i++) {
                    campo_temp = campo.value.substring(i, i + 1)
                    if (digits.indexOf(campo_temp) == -1) {
                        campo.value = campo.value.substring(0, i);
                    }
                }
            }
        </script>                 
        <script language="javascript">
            function ChamarInteiro(campo) {
                var digits = "0123456789"
                var campo_temp
                for (var i = 0; i < campo.value.length; i++) {
                    campo_temp = campo.value.substring(i, i + 1)
                    if (digits.indexOf(campo_temp) == -1) {
                        campo.value = campo.value.substring(0, i);
                    }
                }
            }
        </script> 

    </body>
</html>