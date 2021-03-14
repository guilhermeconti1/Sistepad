
<%@page import="java.util.ArrayList"%>
<%@page import="daos.UnidadeMedidaDAOs"%>
<%@page import="negocio.UnidadeMedida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- aqui no head é o nome da aba URL -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Unidade de medida</title>
    </head>

    <body>
        <%@include file="menu.jsp" %>

        <%UnidadeMedida unidadeMedida = (UnidadeMedida) request.getAttribute("um");

            if (unidadeMedida == null) {
                unidadeMedida = new UnidadeMedida();
                unidadeMedida.setCodUnidadeMedida(0);
                unidadeMedida.setNome("");
                unidadeMedida.setStatus("");
            }
        %>
        <div id="page-wrapper">
            <br>
            <br>

            <div class="panel panel-default">
                <form name="cadastroUnidade" id="cadastroUnidade" method="post" action="/Sistepad/acoes?acao=cadastroUnidadeMedida" onSubmit="return validarCampos(this)">
                    <input type="hidden" name="codunidademedida" id="codunidademedida" value="<%= unidadeMedida.getCodUnidadeMedida()%>">
                    <div class="panel-heading">
                        UNIDADE DE MEDIDA
                    </div>
                    <div class="panel-body">
                        <div class="row">

                            <!-- Div Nome-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Nome da Unidade</label>
                                    <input type="text" class="form-control" maxlength="60" id="nomeunidade" name="nomeunidade" placeholder="Descrição da Categoria" value="<%= unidadeMedida.getNome()%>">
                                </div>
                                <div class="col-lg-6"></div> 
                            </div>

                            <br> 
                            <br>
                            <br> 

                            <!-- Div Status-->
                            <div>
                                <label for="statusunidade" class="col-md-1">
                                    Status
                                </label>
                                <div class="col-md-10">
                                    <div>
                                        <%if (unidadeMedida.getStatus().equals("") || unidadeMedida.getStatus().equals("Ativo")) {
                                        %>
                                        <label class="radio">
                                            <input type="radio" name="statusunidade" id="statusunidade" value="Ativo" checked>
                                            Ativo
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="statusunidade" id="statusunidade" value="Inativo">
                                            Inativo
                                        </label>
                                        <%
                                        } else {
                                        %>
                                        <label class="radio">
                                            <input type="radio" name="statusunidade" id="statusunidade" value="Ativo">
                                            Ativo
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="statusunidade" id="sexo" value="statusunidade" checked>
                                            Inativo
                                        </label>
                                        <%
                                            }
                                            %>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>
                            <br>

                            <div class="col-lg-4">
                                <!-- Div Botões-->
                                <button type="submit" id="btngravar" name="btngravar" class="btn btn-success">Gravar Unidade</button>
                                <button type="reset" id="reset" name="reset" class="btn btn-danger">Limpar Campo</button>
                            </div>

                        </div>
                    </div>
                </form>



                <!-- form chamada da listagem unidade de medida-->
                <div class="row">
                    <form name="pesunidademed" id="pesunidademed" method="post" action="">

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Listagem Unidade de Medida</h3>
                                </div>

                                <br>
                                <div class="col-md-3">
                                    <input type="text"  class="form-control" id="um" name="um" placeholder="Digite o nome da unidade de Medida" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarUnidade" name="btnBuscarUnidade" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparUnidade" name="btnLimparUnidade" value="Limpar" onclick = "document.pesunidademed.reset();">

                                <div class="panel-body">
                                    <%@include file="listagemunidademedida.jsp" %>
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
                    url: "listagemunidademedida.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaunidademedida').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela de unidade de medida, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparUnidade').click(function () {
                $.ajax({
                    url: "listagemunidademedida.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaunidademedida').html(html);
                });
                return false;
            }
            );
        </script>

        <!--script que verifica se os campos estão preechidos-->
        <script type="text/javascript" language="javascript">
            function validarCampos() {

                if (document.getElementById("nomeunidade").value == "") {
                    alert('O nome da unidade de medida não está preenchido, por favor reveja!');
                    document.getElementById("nomeunidade").focus();
                    return false
                }

            }
        </script>

    </body>
</html>