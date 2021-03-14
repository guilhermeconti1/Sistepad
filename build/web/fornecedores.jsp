

<%@page import="java.util.ArrayList"%>
<%@page import="daos.FornecedorDAOs"%>
<%@page import="negocio.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad- Fornecedores</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>


        <%            Fornecedor forn = (Fornecedor) request.getAttribute("fornec");

            if (forn == null) {
                forn = new Fornecedor();
                forn.setRazaoSocial("");
                forn.setPessoaResponsavel("");
                forn.setCnpj("");
                forn.setEmail("");
                forn.setSite("");
                forn.setFonefornec("");
                forn.setEnderecofornec("");
                forn.setCidade("");
                forn.setEstado("");
            }
        %>
        <div id="page-wrapper">
            <br>
            <br>

            <div class="panel panel-default">
                <form name="cadastroFornec" id="cadastroFornec" method="post" action="/Sistepad/acoes?acao=cadastroFornec" onSubmit="return validarCampos(this)">
                    <input type="hidden" name="idfornecedor" id="idfornecedor" value="<%= forn.getIdfornecedor()%>">
                    <div class="panel-heading">
                        CADASTRO DE FORNECEDORES
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <!-- Div Razão Social-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Razão Social</label>
                                    <input type="text" class="form-control" maxlength="60" id="razaosocial" name="razaosocial" placeholder="Razão social do fornecedor" value="<%= forn.getRazaoSocial()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Pessoa Responsável-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Pessoa Responsável</label>
                                    <input type="text" name="pessoaresponsavel" onKeyUp="javascript:soLetras(this);" class="form-control" maxlength="60" id="pessoaresponsavel"  placeholder="Digite o nome da pessoa responsável" value="<%= forn.getPessoaResponsavel()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div CNPJ-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>CNPJ</label>
                                    <input type="text" name="cnpj" onKeyUp="javascript:ChamarInteiro(this);" class="form-control" id="cnpj" maxlength="18" placeholder="Digite o CNPJ" value="<%= forn.getCnpj()%>"> 
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Email-->
                            <div>
                                <div class="col-lg-6">
                                    <label>E-mail</label>
                                    <input  type="email"  class="form-control" id="email"  name="email" placeholder="Digite o email" value="<%= forn.getEmail()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Site-->
                            <div>
                                <div class="col-lg-6">
                                    <label>Site</label>
                                    <input type="text" class="form-control" id="site" maxlength="60" name="site" placeholder="Digite o site do fornecedor" value="<%= forn.getSite()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Fone-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Telefone</label>
                                    <input type="text" class="form-control" id="fonefornec" maxlength="14" name="fonefornec" placeholder="Digite o telefone" value="<%= forn.getFonefornec()%>" OnKeyPress="MascaraTelefone(fonefornec)">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Endereço-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Endereço</label>
                                    <input type="text" class="form-control" maxlength="60"  id="enderecofornec" name="enderecofornec" placeholder="Digite o endereço " value="<%= forn.getEnderecofornec()%>">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Cidade-->
                            <div>
                                <div class="col-lg-4">
                                    * <label>Cidade</label>
                                    <input type="text" class="form-control" maxlength="60" id="cidade" name="cidade" placeholder="Cidade" value="<%= forn.getCidade()%>" readonly>
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-8"></div> 
                            </div>
                            <br>
                            <br>

                            <!-- Div Estado-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Estado</label>

                                    <input type="text" class="form-control" maxlength="60" id="estado" name="estado" placeholder="Estado" value="<%= forn.getEstado()%>" readonly>
                                    <br>
                             
                                    <button type="button" id="btncidade" name="btncidade" class="btn btn-warning" data-toggle="modal" data-target="#abrir">Buscar Cidade</button>
                                </div>
                                <br>
                                <br>
                                <br>

                                <div class="col-lg-8"></div> 
                            </div>
                            <br>
                            <br>
                            <br>



                            <div class="col-lg-6">
                                <!-- Div Botões-->
                                <button type="submit" id="btngravar" name="btngravar" class="btn btn-success">Gravar Fornecedores</button>

                                <button type="reset" id="reset" name="reset" class="btn btn-danger">Apagar Campos</button>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- form chamada da listagem de fornecedores-->
                <div class="row">
                    <form name="pesfor" id="pesfor" method="post" action="">

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Listagem de Fornecedores</h3>
                                </div>

                                <br>
                                <div class="col-md-3">
                                    <input type="text"  class="form-control" id="fn" name="fn" placeholder="Digite a Razão Social" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarFornecedores" name="btnBuscarFornecedores" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparFornecedores" name="btnLimparFornecedores" value="Limpar" onclick = "document.pesfor.reset();">

                                <div class="panel-body">
                                    <%@include file="listagemfornecedores.jsp" %>
                                     <a href="/Sistepad/acoes?acao=GerarFornecedor" class="btn btn-primary col-md-2">Relátorio (CSV)</a>
                                </div>

                            </div>
                        </div>

                    </form>
                </div>



            </div>                
        </div>



        <!-- Modal de Cidades -->
        <div class="modal fade" id="abrir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="pescid" id="pescid" method="post" action="">
                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Lista de Cidades </h3>
                                </div>
                                <br>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="busCid" name="busCid" placeholder="Digite o nome da cidade" onfocus="this.value = '';" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscar" name="btnBuscar" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimpar" name="btnLimpar" value="Limpar" onclick = "document.pescid.reset();">
                                <%@include file="listacidades.jsp" %>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script language="JavaScript1.2">
            var valido;
            function validar() {
                var str = document.cadastro.email.value;
                var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                if (filter.test(str))
                    valido = true;
                else {
                    alert("Este endereço de e-mail não é válido!");
                    document.cadastro.email.focus();
                    valido = false;
                }
                return valido;
            }
        </script>

        <div>
            <%if (request.getAttribute("clientesalvo") != null) {
            %>
            <script type="text/javascript">
                alert("Fornecedor salvo com sucesso!!!");
            </script>
            <%
                }
            %>
        </div>

        <div>
            <%if (request.getAttribute("clienteexcluido") != null) {
            %>
            <script type="text/javascript">
                alert("Fornecedor excluido com sucesso!!!");
            </script>
            <%
                }
            %>
        </div>

        <div>
            <%if (request.getAttribute("nomecadastrado") != null) {
            %>
            <script type="text/javascript">
                alert("Este Fornecedor já existe!!!");
            </script>
            <%
                }
            %>
        </div>
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
        <!--script que verifica se os campos estão completos-->
        <script type="text/javascript" language="javascript">
            function validarCampos() {
                if (document.getElementById("razaosocial").value == "") {
                    alert('Você deve digitar a razão social');
                    document.getElementById("razaosocial").focus();
                    return false
                }
                if (document.getElementById("pessoaresponsavel").value == "") {
                    alert('Você deve digitar a pessoa responsável!');
                    document.getElementById("pessoaresponsavel").focus();
                    return false
                }

                if (document.getElementById("cnpj").value == "") {
                    alert('Você deve digitar o CNPJ!');
                    document.getElementById("cnpj").focus();
                    return false
                }
                if (document.getElementById("fonefornec").value == "") {
                    alert('Você deve digitar o Telefone!');
                    document.getElementById("fonefornec").focus();
                    return false
                }
                if (document.getElementById("fonefornec").value.length < 14) {
                    alert('Você deve digitar o número do telefone corretamente!');
                    document.getElementById("fonefornec").focus();
                    return false
                }
                if (document.getElementById("enderecofornec").value == "") {
                    alert('Você deve digitar o endereço!');
                    document.getElementById("enderecofornec").focus();
                    return false
                }
                if (document.getElementById("cidade").value == "") {
                    alert('Você deve digitar a cidade!');
                    document.getElementById("cidade").focus();
                    return false
                }
                if (document.getElementById("estado").value == "") {
                    alert('Você deve digitar o estado!');
                    document.getElementById("estado").focus();
                    return false
                }
            }
        </script>

        <!--script só letras-->
        <script> language = "javascript" >
                    function soLetras(e) {
                        var expressao;

                        expressao = /^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/;

                        if (!expressao.test(String.fromCharCode(e.keyCode)))
                        {
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    }
        </script>
        <!--script que colocar mascara no campo de telefone-->
        <script>
            //adiciona mascara ao telefone
            function MascaraTelefone(tel) {
                if (mascaraInteiro(tel) == false) {
                    event.returnValue = false;
                }
                return formataCampo(tel, '(00) 0000-0000', event);

                //valida numero inteiro com mascara
                function mascaraInteiro() {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.returnValue = false;
                        return false;
                    }
                    return true;
                }

                //formata de forma generica os campos
                function formataCampo(campo, Mascara, evento) {
                    var boleanoMascara;

                    var Digitato = evento.keyCode;
                    exp = /\-|\.|\/|\(|\)| /g
                    campoSoNumeros = campo.value.toString().replace(exp, "");

                    var posicaoCampo = 0;
                    var NovoValorCampo = "";
                    var TamanhoMascara = campoSoNumeros.length;
                    ;

                    if (Digitato != 8) { // backspace
                        for (i = 0; i <= TamanhoMascara; i++) {
                            boleanoMascara = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                                    || (Mascara.charAt(i) == "/"))
                            boleanoMascara = boleanoMascara || ((Mascara.charAt(i) == "(")
                                    || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " "))
                            if (boleanoMascara) {
                                NovoValorCampo += Mascara.charAt(i);
                                TamanhoMascara++;
                            } else {
                                NovoValorCampo += campoSoNumeros.charAt(posicaoCampo);
                                posicaoCampo++;
                            }
                        }
                        campo.value = NovoValorCampo;
                        return true;
                    } else {
                        return true;
                    }
                }

            }
        </script>
        <!--script que boqueia campo de busca da modal fornecedores-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarFornecedores").click(function () {
                    // desabilitando o campo
                    $('#fn').attr("disabled", true);
                    $('#btnBuscarFornecedores').attr("disabled", true);
                });
                $("#btnLimparFornecedores").click(function () {
                    // habilita o campo
                    $('#fn').attr("disabled", false);
                    $('#btnBuscarFornecedores').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela de fornecedores, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarFornecedores').click(function () {
                $.ajax({
                    url: "listagemfornecedores.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaforn').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela de fornecedores, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparFornecedores').click(function () {
                $.ajax({
                    url: "listagemfornecedores.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaforn').html(html);
                });
                return false;
            }
            );
        </script>




        <!--script que boqueia campo de busca da modal cidades-->
        <script>
            $(document).ready(function () {
                $("#btnBuscar").click(function () {
                    // desabilitando o campo
                    $('#busCid').attr("disabled", true);
                    $('#btnBuscar').attr("disabled", true);
                });
                $("#btnLimpar").click(function () {
                    // habilita o campo
                    $('#busCid').attr("disabled", false);
                    $('#btnBuscar').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela de cidades, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscar').click(function () {
                $.ajax({
                    url: "listacidades.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tableTrClick').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela de cidades, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimpar').click(function () {
                $.ajax({
                    url: "listacidades.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tableTrClick').html(html);
                });
                return false;
            }
            );
        </script>



    </body>
</html>
