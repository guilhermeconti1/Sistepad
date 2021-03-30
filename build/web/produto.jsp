
<%@page import="daos.UnidadeMedidaDAOs"%>
<%@page import="negocio.UnidadeMedida"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.ProdutoDAOs"%>
<%@page import="negocio.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- aqui no head é o nome da aba URL -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Produto</title>
    </head>

    <body>
        <%@include file="menu.jsp" %>
        <!-- Aqui pega a variavel da ações e confere se tem algo parecido-->
        <%Produto produtos = (Produto) request.getAttribute("prod");

            if (produtos == null) {
                produtos = new Produto();
                produtos.setCodcategoriaproduto(0);
                produtos.setCodunidademedida(0);
                produtos.setNomeprod("");
                produtos.setDescricaoprod("");
                produtos.setPrecoprod(0);
                produtos.setDataprimeiravenda("");
            }
        %>
        <div id="page-wrapper">
            <br>
            <br>

            <div class="panel panel-default">
                <form name="cadProduto" id="cadProduto" method="post" action="/Sistepad/acoes?acao=cadastroProduto" onSubmit="return validarCampos(this)">
                    <input type="hidden" name="idproduto" id="idproduto" value="<%= produtos.getIdproduto()%>">
                    <div class="panel-heading">
                        PRODUTOS
                    </div>
                    <div class="panel-body">
                        <div class="row">

                            <!-- Div Nome Produto-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Nome do Produto</label>
                                    <input type="text" class="form-control" maxlength="60" id="nomeprod" name="nomeprod" placeholder="Nome do Produto" value="<%= produtos.getNomeprod()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Descrição do Produto-->
                            <div>
                                <div class="col-lg-6">
                                    <label>Descrição do Produto</label>
                                    <input type="text" class="form-control" maxlength="60" id="descricaoprod" name="descricaoprod" placeholder="Descrição do produto" value="<%= produtos.getDescricaoprod()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>

                            <!-- Div Categoria de Produto-->
                            <div>
                                <div class="col-lg-6">
                                    * <label for="codcategoriaproduto" > Categoria</label>
                                    <input type="hidden" name="codcatpro" id="codcatpro" value="<%= produtos.getCodcategoriaproduto()%>">
                                    <%if (produtos.getCodcategoriaproduto() == 0) {
                                    %> 
                                    <input type="text" class="form-control" id="descricaocat" name="descricaocat" value="" readonly> 
                                    <%
                                    } else {
                                        CategoriaProduto cat = new CategoriaProdutoDAOs().buscarCategoriaProduto(produtos.getCodcategoriaproduto());
                                    %>
                                    <input type="text"  class="form-control" id="descricaocat" name="descricaocat" value="<%= cat.getDescricaocat()%>" readonly>      
                                    <%
                                        }
                                    %>
                                </div>
                                <br>
                                <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#abrircategoria">Buscar</button>
                            </div>
                            <br> 

                            <!-- Div Unidade de Medida-->
                            <div>
                                <div class="col-lg-6">
                                    * <label for="codunidademedida" > Moeda</label>
                                    <input type="hidden" name="codunidmed" id="codunidmed" value="<%= produtos.getCodunidademedida()%>">
                                    <%if (produtos.getCodunidademedida() == 0) {
                                    %> 
                                    <input type="text" class="form-control" id="nomeunidd" name="nomeunidd" value="" readonly> 
                                    <%
                                    } else {
                                        UnidadeMedida unide = new UnidadeMedidaDAOs().buscarUnidadeMedida(produtos.getCodunidademedida());
                                    %>
                                    <input type="text"  class="form-control" id="nomeunidd" name="nomeunidd" value="<%= unide.getNome()%>" readonly>      
                                    <%
                                        }
                                    %>
                                </div>
                                <br>

                                <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#abrirunidade">Buscar</button>
                            </div>
                            <br> 

                            <!-- Div Preço do produto-->
                            <div>
                                <div class="col-lg-6">
                                    <label>Preço do Produto</label>
                                    <div>
                                        <%if (produtos.getPrecoprod() == 0) {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero2(this);" type="text" placeholder="Preço do produto"  class="form-control" id="precoprod" name="precoprod" value="">
                                        <%
                                        } else {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero2(this);" type="text" class="form-control" id="precoprod" name="precoprod"  value="<%= produtos.getPrecoprod()%>">
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



                            <!-- Div Data primeira venda-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Data</label>
                                    <input type="date" class="form-control" maxlength="60" id="dataprimeiravenda" name="dataprimeiravenda" placeholder="Data primeira venda" value="<%= produtos.getDataprimeiravenda()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>

                            <br>
                            <br>
                            <div class="col-lg-4">
                                <!-- Div Botões-->
                                <button type="submit" id="btngravar" name="btngravar" class="btn btn-success">Gravar Produto</button>
                                <button type="reset" id="reset" name="reset" class="btn btn-danger">Limpar Campo</button>
                            </div>
                        </div>
                    </div>
                </form>
                <br>

                <!-- form chamada da listagem de produtos-->
                <div class="row">
                    <form name="pespr" id="pespr" method="post" action="">

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Listagem de Produto </h3>
                                </div>

                                <br>
                                <div class="col-md-3">
                                    <input type="text"  class="form-control" id="prod" name="prod" placeholder="Digite o nome do produto" value="">
                                </div>
                                <div class="col-md-3">
                                    <input type="date"  class="form-control" id="databusc" name="databusc" placeholder="Digite a data a ser pesquisada " value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarProd" name="btnBuscarProd" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparProd" name="btnLimparProd" value="Limpar" onclick = "document.pespr.reset();">

                                <div class="panel-body">
                                    <%@include file="listagemproduto.jsp" %>
                                     <a href="/Sistepad/acoes?acao=GerarProduto" class="btn btn-primary col-md-3">Relatório(CSV)</a>
                                </div>

                            </div>
                        </div>

                    </form>
                </div>


            </div>
        </div>
        <!-- Modal de Categoria -->
        <div class="modal fade" id="abrircategoria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="pescat" id="pescat" method="post" action="">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Lista de Categorias </h3>
                                </div>

                                <br>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="cp" name="cp" placeholder="Categoria" onfocus="this.value = '';" value="">
                                </div>

                                <input class="btn btn-primary" type="submit" id="btnBuscarCategoria" name="btnBuscarCategoria" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparCategoria" name="btnLimparCategoria" value="Limpar" onclick = "document.pescat.reset();">
                                <%@include file="listagemcategoriasmodal.jsp" %>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- Modal Unidade -->
        <div class="modal fade" id="abrirunidade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="pesuni" id="pesuni" method="post" action="">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Lista Moedas </h3>
                                </div>

                                <br>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="um" name="um" placeholder="Moedas" onfocus="this.value = '';" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarUnidade" name="btnBuscarUnidade" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparUnidade" name="btnLimparUnidade" value="Limpar" onclick = "document.pesuni.reset();">

                                <%@include file="listagemunidademedidamodal.jsp" %>

                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>

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
        <!--script que verifica se os campos estão completos-->
        <script type="text/javascript" language="javascript">
            function validarCampos() {

                if (document.getElementById("nomeprod").value == "") {
                    alert('Você deve digitar o nome do produto!');
                    document.getElementById("nomeprod").focus();
                    return false
                }
                if (document.getElementById("codcatpro").value == "") {
                    alert('Você deve selecionar a categoria de produto!');
                    document.getElementById("codcatpro").focus();
                    return false
                }
                if (document.getElementById("codunidademedida").value == "") {
                    alert('Você deve selecionar a unidade de medida!');
                    document.getElementById("codunidademedida").focus();
                    return false
                }
                if (document.getElementById("precoprod").value.length < 14) {
                    alert('Você deve informar o preço do produto');
                    document.getElementById("celular").focus();
                    return false
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
        <!--script que boqueia campo de busca da modal Produto-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarProd").click(function () {
                    // desabilitando o campo
                    $('#prod').attr("disabled", true);
                    $('#databusc').attr("disabled", true);
                    $('#btnBuscarProd').attr("disabled", true);
                });
                $("#btnLimparProd").click(function () {
                    // habilita o campo
                    $('#prod').attr("disabled", false);
                    $('#databusc').attr("disabled", false);
                    $('#btnBuscarProd').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela Produto, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarProd').click(function () {
                $.ajax({
                    url: "listagemproduto.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaprodu').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela Produto, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparProd').click(function () {
                $.ajax({
                    url: "listagemproduto.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaprodu').html(html);
                });
                return false;
            }
            );
        </script>



        <!--script que boqueia campo de busca da modal unidade de medida-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarUnidade").click(function () {
                    // desabilitando o campo
                    $('#um').attr("disabled", true);
                    $('#btnBuscarUnidade').attr("disabled", true);
                });
                $("#btnLimparUnidade").click(function () {
                    // habilita o campo
                    $('#um').attr("disabled", false);
                    $('#btnBuscarUnidade').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela unidade de medida, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarUnidade').click(function () {
                $.ajax({
                    url: "listagemunidademedidamodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaunidade').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela unidade de medida, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparUnidade').click(function () {
                $.ajax({
                    url: "listagemunidademedidamodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaunidade').html(html);
                });
                return false;
            }
            );
        </script>



        <!--script que boqueia campo de busca da modal categoria de produto-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarCategoria").click(function () {
                    // desabilitando o campo
                    $('#cp').attr("disabled", true);
                    $('#btnBuscarCategoria').attr("disabled", true);
                });
                $("#btnLimparCategoria").click(function () {
                    // habilita o campo
                    $('#cp').attr("disabled", false);
                    $('#btnBuscarCategoria').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela Categoria de produto, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarCategoria').click(function () {
                $.ajax({
                    url: "listagemcategoriasmodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaCategoria').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela categoria de produto, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparCategoria').click(function () {
                $.ajax({
                    url: "listagemcategoriasmodal.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaCategoria').html(html);
                });
                return false;
            }
            );
        </script>

    </body>
</html>