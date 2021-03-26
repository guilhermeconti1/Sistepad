
<%@page import="java.util.ArrayList"%>
<%@page import="daos.CategoriaProdutoDAOs"%>
<%@page import="negocio.CategoriaProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- aqui no head é o nome da aba URL -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Categoria de Produtos</title>
    </head>

    <body>
        <%@include file="menu.jsp" %>

        <%CategoriaProduto categoriaProduto = (CategoriaProduto) request.getAttribute("cp");

            if (categoriaProduto == null) {
                categoriaProduto = new CategoriaProduto();
                categoriaProduto.setCodcategoria(0);
                categoriaProduto.setDescricaocat("");
            }
        %>
        <div id="page-wrapper">
            <br>
            <br>

            <div class="panel panel-default">
                <form name="cadastroCategoria" id="cadastroCategoria" method="post" action="/Sistepad/acoes?acao=cadastroCategoriaProduto" onSubmit="return validarCampos(this)">
                    <input type="hidden" name="codcategoria" id="codcategoria" value="<%= categoriaProduto.getCodcategoria()%>">

                    <div class="panel-heading">
                        CATEGORIA DE PRODUTOS
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <!-- Div Descrição-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Descrição</label>
                                    <input type="text" class="form-control" maxlength="60" id="descricaocat" name="descricaocat" placeholder="Descrição da Categoria" value="<%= categoriaProduto.getDescricaocat()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <div class="col-lg-4">
                                <!-- Div Botões-->
                                <button type="submit" id="btngravar" name="btngravar" class="btn btn-success">Gravar Categoria</button>
                                <button type="reset" id="reset" name="reset" class="btn btn-danger">Limpar Campo</button>
                            </div>
                        </div>
                    </div>
                </form>
                <br>


                <!-- form chamada da listagem de clientes-->
                <div class="row">
                    <form name="pescat" id="pescat" method="post" action="">

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Listagem Categoria de Produtos</h3>
                                </div>

                                <br>
                                <div class="col-md-3">
                                    <input type="text"  class="form-control" id="cep" name="cep" placeholder="Digite o nome da Categoria de Produto" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarCategorias" name="btnBuscarCategorias" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparCategorias" name="btnLimparCategorias" value="Limpar" onclick = "document.pescat.reset();">

                                <div class="panel-body">
                                    <%@include file="listagemcategorias.jsp" %>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </div>

        <!--script que boqueia campo de busca da modal unidade de medida-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarCategorias").click(function () {
                    // desabilitando o campo
                    $('cep').attr("disabled", true);
                    $('#btnBuscarCategorias').attr("disabled", true);
                });
                $("#btnLimparCategorias").click(function () {
                    // habilita o campo
                    $('#cep').attr("disabled", false);
                    $('#btnBuscarCategorias').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela unidade de medida, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarCategorias').click(function () {
                $.ajax({
                    url: "listagemcategorias.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelacategorias').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela de unidade de medida, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparCategorias').click(function () {
                $.ajax({
                    url: "listagemcategorias.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelacategorias').html(html);
                });
                return false;
            }
            );
        </script>


        <!--script que verifica se os campos estão preechidos-->
        <script type="text/javascript" language="javascript">
            function validarCampos() {

                if (document.getElementById("descricaocat").value == "") {
                    alert('Você deve digitar a descrição da categoria!');
                    document.getElementById("descricaocat").focus();
                    return false
                }

            }
        </script>
    </body>
</html>