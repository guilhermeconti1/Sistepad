
<%@page import="daos.EstoqueDAOs"%>
<%@page import="negocio.Fornecedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.EstoqueDAOs"%>
<%@page import="negocio.Estoque"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- aqui no head é o nome da aba URL -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Estoque de Produtos</title>
    </head>

    <body>
        <%@include file="menu.jsp" %>
        <!-- Aqui pega a variavel da ações e confere se tem algo parecido-->
        <%Estoque estoques = (Estoque) request.getAttribute("est");

            if (estoques == null) {
                estoques = new Estoque();
                estoques.setIdfornecedor(0);
                estoques.setNomesuprimento("");
                estoques.setPrecoestoque(0);
                estoques.setValidade("");
                estoques.setQuantidadeestoque(0);
            }
        %>
        <div id="page-wrapper">
            <br>
            <br>

            <div class="panel panel-default">
                <form name="cadEstoque" id="cadProduto" method="post" action="/Sistepad/acoes?acao=cadastroEstoque" onSubmit="return validarCampos(this)">
                    <input type="hidden" name="idestoque" id="idestoque" value="<%= estoques.getIdestoque()%>">
                    <div class="panel-heading">
                        ESTOQUE
                    </div>
                    <div class="panel-body">
                        <div class="row">

                            <!-- Div Fornecedor-->
                            <div>
                                <div class="col-lg-6">
                                    * <label for="idfornecedor" > Fornecedor</label>
                                    <input type="hidden" name="idfornecedorr" id="idfornecedorr" value="<%= estoques.getIdfornecedor()%>">
                                    <%if (estoques.getIdfornecedor() == 0) {
                                    %> 
                                    <input type="text" class="form-control" id="razaosocial" name="razaosocial" value="" readonly> 
                                    <%
                                    } else {
                                        Fornecedor fn = new FornecedorDAOs().buscarFornecedor(estoques.getIdfornecedor());
                                    %>
                                    <input type="text"  class="form-control" id="razaosocial" name="razaosocial" value="<%= fn.getRazaoSocial()%>" readonly>      
                                    <%
                                        }
                                    %>
                                </div>
                                <br>
                                <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#abrirfornecedor">Buscar</button>
                            </div>
                            <br>    


                            <!-- Div Nome Suprimento-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Nome do Suprimento</label>
                                    <input type="text" class="form-control" maxlength="60" id="nomesuprimento" name="nomesuprimento" placeholder="Nome do Suprimento" value="<%= estoques.getNomesuprimento()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>  

                            <!-- Div Preço do suprimento-->
                            <div>
                                <div class="col-lg-6">
                                    *<label>Preço do Suprimento</label>
                                    <div>
                                        <%if (estoques.getPrecoestoque() == 0) {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero2(this);" type="text" placeholder="Preço do suprimento"  class="form-control" id="precoestoque" name="precoestoque" value="">
                                        <%
                                        } else {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero2(this);" type="text" class="form-control" id="precoestoque" name="precoestoque"  value="<%= estoques.getPrecoestoque()%>">
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

                            <!-- Div Data Validade-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Validade</label>
                                    <input type="date" class="form-control" maxlength="8" id="validade" name="validade" placeholder="Data de Validade" value="<%= estoques.getValidade()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>

                            <!-- Div Quantidade em estoque-->
                            <div>
                                <div class="col-lg-6">
                                    *<label>Quantidade em Estoque</label>
                                    <div>
                                        <%if (estoques.getPrecoestoque() == 0) {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero(this);" type="text" placeholder="Quantidade"  class="form-control" id="quantidadeestoque" name="quantidadeestoque" value="">
                                        <%
                                        } else {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero(this);" type="text" class="form-control" id="quantidadeestoque" name="quantidadeestoque"  value="<%= estoques.getQuantidadeestoque()%>">
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

                            <div class="col-lg-4">
                                <!-- Div Botões-->
                                <button type="submit" id="btngravar" name="btngravar" class="btn btn-success">Gravar Suprimento</button>
                                <button type="reset" id="reset" name="reset" class="btn btn-danger">Limpar Campo</button>
                            </div>
                        </div>
                    </div>
                </form>
                <br>


                <!-- form chamada da listagem de estoque-->
                <div class="row">
                    <form name="pesfor" id="pesfor" method="post" action="">

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Listagem de Estoque</h3>
                                </div>

                                <br>
                                <div class="col-md-3">
                                    <input type="text"  class="form-control" id="estq" name="estq" placeholder="Digite o suprimento" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarEstoque" name="btnBuscarEstoque" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparEstoque" name="btnLimparEstoque" value="Limpar" onclick = "document.pesfor.reset();">

                                <div class="panel-body">
                                    <%@include file="listagemestoque.jsp" %>
                                    <a href="/Sistepad/acoes?acao=GerarEstoque" class="btn btn-primary col-md-2">Relátorio (CSV)</a>
                                </div>

                            </div>
                        </div>

                    </form>
                </div>




            </div>
        </div>
        <!-- Modal de Fornecedor -->
        <div class="modal fade" id="abrirfornecedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="pesforn" id="pesforn" method="post" action="">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Lista de Fornecedores </h3>
                                </div>

                                <br>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="fn" name="fn" placeholder="Fornecedor" onfocus="this.value = '';" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarFornecedor" name="btnBuscarFornecedor" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparFornecedor" name="btnLimparFornecedor" value="Limpar" onclick = "document.pesforn.reset();">
                                <%@include file="listagemfornecedormodal.jsp" %>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
<!--script que verifica se os campos estão completos-->
        <script type="text/javascript" language="javascript">
            function validarCampos() {

                if (document.getElementById("razaosocial").value == "") {
                    alert('Você deve selecionar um fornecedor!');
                    document.getElementById("razaosocial").focus();
                    return false
                }
                if (document.getElementById("nomesuprimento").value == "") {
                    alert('Você deve informar o nome do suprimento!');
                    document.getElementById("nomesuprimento").focus();
                    return false
                }
                if (document.getElementById("precoestoque").value == "") {
                    alert('Você deve informar o preço do suprimento!');
                    document.getElementById("precoestoque").focus();
                    return false
                }
                if (document.getElementById("validade").value == "") {
                    alert('Você deve informar a validade do suprimento!');
                    document.getElementById("validade").focus();
                    return false
                }
                if (document.getElementById("quantidadeestoque").value == "") {
                    alert('Você deve informar a quantidade!');
                    document.getElementById("quantidadeestoque").focus();
                    return false
                }
  
            }
        </script>
        <!--script que boqueia campo de busca da modal fornecedores-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarEstoque").click(function () {
                    // desabilitando o campo
                    $('#estq').attr("disabled", true);
                    $('#btnBuscarEstoque').attr("disabled", true);
                });
                $("#btnLimparEstoque").click(function () {
                    // habilita o campo
                    $('#estq').attr("disabled", false);
                    $('#btnBuscarEstoque').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela de fornecedores, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarEstoque').click(function () {
                $.ajax({
                    url: "listagemestoque.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaestoque').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela de fornecedores, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparEstoque').click(function () {
                $.ajax({
                    url: "listagemestoque.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaestoque').html(html);
                });
                return false;
            }
            );
        </script>

        <script language="javascript">
            function somenteNumero2(campo) {
                var digits = "0123456789."
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

        <!--script que boqueia campo de busca da modal Fornecedor-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarFornecedor").click(function () {
                    // desabilitando o campo
                    $('#fn').attr("disabled", true);
                    $('#btnBuscarFornecedor').attr("disabled", true);
                });
                $("#btnLimparFornecedor").click(function () {
                    // habilita o campo
                    $('#fn').attr("disabled", false);
                    $('#btnBuscarFornecedor').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela Fornecedor, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarFornecedor').click(function () {
                $.ajax({
                    url: "listagemfornecedormodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelafornecedor').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela Fornecedor, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparFornecedor').click(function () {
                $.ajax({
                    url: "listagemfornecedormodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelafornecedor').html(html);
                });
                return false;
            }
            );
        </script>


    </body>
</html>