
<%@page import="java.util.ArrayList"%>
<%@page import="daos.ClienteDAOs"%>
<%@page import="negocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- aqui no head é o nome da aba URL -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistepad - Clientes</title>
    </head>

    <body>
        <%@include file="menu.jsp" %>

        <%            Cliente cliente = (Cliente) request.getAttribute("cli");

            if (cliente == null) {
                cliente = new Cliente();
                cliente.setNomecli("");
                cliente.setSexo("");
                cliente.setIdade(0);
                cliente.setCelular("");
                cliente.setCpf("");
                cliente.setEnderecocli("");
                cliente.setCidade("");
                cliente.setEstado("");
            }
        %>
        <div id="page-wrapper">
            <br>
            <br>

            <div class="panel panel-default">
                <form name="cadastroCli" id="cadastroCli" method="post" action="/Sistepad/acoes?acao=cadastroCli" onSubmit="return validarCampos(this)">
                    <input type="hidden" name="idcliente" id="idcliente" value="<%= cliente.getIdcliente()%>">
                    <div class="panel-heading">
                        CADASTRO DE CLIENTES
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <!-- Div nome-->
                            <div>
                                <div class="col-lg-6">

                                    * <label>Nome Completo</label>
                                    <input onblur="NomeClienteValidacao();" type="text" class="form-control" maxlength="60"  id="nomecli" name="nomecli" placeholder="Nome do Cliente a ser cadastrado" value="<%= cliente.getNomecli()%>">
                                    <p class="text-danger" id="nomecli-error" style="display: none;">*Preencha o campo nome cliente</p>
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>



                            <!-- Div Sexo-->
                            <div>
                                <label for="sexo" class="col-md-1">
                                    Sexo
                                </label>
                                <div class="col-md-10">
                                    <div>
                                        <%if (cliente.getSexo().equals("") || cliente.getSexo().equals("Masculino")) {
                                        %>
                                        <label class="radio">
                                            <input type="radio" name="sexo" id="sexo" value="Masculino" checked>
                                            Masculino
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="sexo" id="sexo" value="Feminino">
                                            Feminino
                                        </label>
                                        <%
                                        } else {
                                        %>
                                        <label class="radio">
                                            <input type="radio" name="sexo" id="sexo" value="Masculino">
                                            Masculino
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="sexo" id="sexo" value="Feminino" checked>
                                            Feminino
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


                            <!-- Div Idade-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Idade</label>
                                    <div>
                                        <%if (cliente.getIdade() == 0) {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero(this);" type="text" placeholder="Digite a idade"  class="form-control" id="idade" name="idade" value="">
                                        <%
                                        } else {
                                        %>
                                        <input onKeyUp="javascript:somenteNumero(this);" type="text" class="form-control" id="idade" name="idade" value="<%= cliente.getIdade()%>">
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

                            <!-- Div Celular-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>Celular</label>
                                    <input type= "text" class="form-control" maxlength="14" id="celular" name="celular" placeholder="Digite o número do celular" value="<%= cliente.getCelular()%>" OnKeyPress="MascaraTelefone(celular)">
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-6"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div CPF-->
                            <div>
                                <div class="col-lg-6">
                                    * <label>CPF</label>
                                    <input type="text" name="cpf" class="form-control" id="cpf" onblur="javascript: validarCPF(this.value);" onkeypress="javascript: mascara(this, cpf_mask);"  maxlength="14" placeholder="Digite o CPF" value="<%= cliente.getCpf()%>"> 

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
                                    <input type="text" size=120 maxlength="80"  class="form-control" id="enderecocli" name="enderecocli" placeholder="Digite o endereço" value="<%= cliente.getEnderecocli()%>">
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
                                    <input type="text" size=40 maxlength="60"  class="form-control" id="cidade" name="cidade" placeholder="Cidade" value="<%= cliente.getCidade()%>" readonly>
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-8"></div> 
                            </div>
                            <br>
                            <br>
                            <!-- Div Estado-->
                            <div>
                                <div class="col-lg-4">
                                    * <label>Estado</label>
                                    <input type="text" class="form-control" maxlength="60" id="estado" name="estado" placeholder="Estado" value="<%= cliente.getEstado()%>"readonly>
                                    <br> 
                                    <button type="button" id="btncidade" name="btncidade" class="btn btn-warning" data-toggle="modal" data-target="#abrir" >Buscar Cidade</button>
                                </div>
                                <br>
                                <br> 
                                <div class="col-lg-8"></div> 
                            </div>
                            <br>
                            <br>
                            <br>
                            <br>

                            <div class="col-lg-4">
                                <!-- Div Botões-->
                                <button type="submit" id="btngravar" name="btngravar" class="btn btn-success">Gravar Cliente</button>
                                <button type="reset" id="reset" name="reset" class="btn btn-danger">Limpar Campos</button>
                            </div>
                        </div>
                    </div>
                </form>


                <!-- form chamada da listagem de clientes-->
                <div class="row">
                    <form name="pescl" id="pescl" method="post" action="">

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-list-alt"></i> Listagem de Clientes</h3>
                                </div>

                                <br>
                                <div class="col-md-3">
                                    <input type="text"  class="form-control" id="cli" name="cli" placeholder="Digite o nome do cliente" value="">

                                </div>
                                <div class="col-md-3">
                                    <input type="text"  maxlength="14" onblur="javascript: validarCPF(this.value);" onkeypress="javascript: mascara(this, cpf_mask);" class="form-control" id="cpfbusc" name="cpfbusc" placeholder="Digite o CPF " value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarClientes" name="btnBuscarClientes" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparClientes" name="btnLimparClientes" value="Limpar" onclick = "document.pescl.reset();">

                                <div class="panel-body">
                                    <%@include file="listagemclientes.jsp" %>
                                       <a href="/Sistepad/acoes?acao=GerarCliente" class="btn btn-primary col-md-2">Relátorio (CSV)</a>
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
                                    <input type="text" class="form-control" id="busCid" name="busCid" placeholder="Cidade para cadastro" onfocus="this.value = '';" value="">
                                </div>
                                <input class="btn btn-primary" type="submit" id="btnBuscarCidade" name="btnBuscarCidade" value="Buscar">
                                <input class="btn btn-warning" type="button" id="btnLimparCidade" name="btnLimparCidade" value="Limpar" onclick = "document.pescid.reset();">

                                <%@include file="listacidades.jsp" %>

                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>





        <script type="text/javascript">
            function validarCPF(cpf) {
                var filtro = /^\d{3}.\d{3}.\d{3}-\d{2}$/i;

                if (!filtro.test(cpf))
                {
                    window.alert("CPF inválido. Tente novamente.");
                    return false;
                }

                cpf = remove(cpf, ".");
                cpf = remove(cpf, "-");

                if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" ||
                        cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" ||
                        cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" ||
                        cpf == "88888888888" || cpf == "99999999999")
                {
                    window.alert("CPF inválido. Tente novamente.");
                    return false;
                }

                soma = 0;
                for (i = 0; i < 9; i++)
                {
                    soma += parseInt(cpf.charAt(i)) * (10 - i);
                }

                resto = 11 - (soma % 11);
                if (resto == 10 || resto == 11)
                {
                    resto = 0;
                }
                if (resto != parseInt(cpf.charAt(9))) {
                    window.alert("CPF inválido. Tente novamente.");
                    return false;
                }

                soma = 0;
                for (i = 0; i < 10; i++)
                {
                    soma += parseInt(cpf.charAt(i)) * (11 - i);
                }
                resto = 11 - (soma % 11);
                if (resto == 10 || resto == 11)
                {
                    resto = 0;
                }

                if (resto != parseInt(cpf.charAt(10))) {
                    window.alert("CPF inválido. Tente novamente.");
                    return false;
                }

                return true;
            }

            function remove(str, sub) {
                i = str.indexOf(sub);
                r = "";
                if (i == -1)
                    return str;
                {
                    r += str.substring(0, i) + remove(str.substring(i + sub.length), sub);
                }

                return r;
            }

            /**
             * MASCARA ( mascara(o,f) e execmascara() ) CRIADAS POR ELCIO LUIZ
             * elcio.com.br
             */
            function mascara(o, f) {
                v_obj = o
                v_fun = f
                setTimeout("execmascara()", 1)
            }

            function execmascara() {
                v_obj.value = v_fun(v_obj.value)
            }

            function cpf_mask(v) {
                v = v.replace(/\D/g, "")                 //Remove tudo o que não é dígito
                v = v.replace(/(\d{3})(\d)/, "$1.$2")    //Coloca ponto entre o terceiro e o quarto dígitos
                v = v.replace(/(\d{3})(\d)/, "$1.$2")    //Coloca ponto entre o setimo e o oitava dígitos
                v = v.replace(/(\d{3})(\d)/, "$1-$2")   //Coloca ponto entre o decimoprimeiro e o decimosegundo dígitos
                return v
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

        <div>
            <%if (request.getAttribute("salvandocliente") != null) {
            %>
            <script type="text/javascript">
                alert("Parabéns, o cliente foi salvo!");
            </script>
            <%
                }
            %>
        </div>

        <div>
            <%if (request.getAttribute("excluindocliente") != null) {
            %>
            <script type="text/javascript">
                alert("Você acaba de excluir o cliente!");
            </script>
            <%
                }
            %>
        </div>

        <!--script que verifica se os campos estão completos-->
        <script type="text/javascript" language="javascript">
            function validarCampos() {

                if (document.getElementById("nomecli").value == "") {
                    alert('Você deve digitar o nome do cliente!');
                    document.getElementById("nomecli").focus();
                    return false
                }
               
                if (document.getElementById("celular").value == "") {
                    alert('Você deve digitar o celular do cliente!');
                    document.getElementById("celular").focus();
                    return false
                }
                if (document.getElementById("celular").value.length < 14) {
                    alert('Por favor, preencha corretamente o campo celular');
                    document.getElementById("celular").focus();
                    return false
                }
                if (document.getElementById("cpf").value == "") {
                    alert('Você deve digitar o CPF do cliente!');
                    document.getElementById("cpf").focus();
                    return false
                }
                if (document.getElementById("enderecocli").value == "") {
                    alert('Você deve digitar o endereço do cliente!');
                    document.getElementById("enderecocli").focus();
                    return false
                }
                if (document.getElementById("cidade").value == "") {
                    alert('Você deve digitar a cidade do cliente!');
                    document.getElementById("cidade").focus();
                    return false
                }
                if (document.getElementById("estado").value == "") {
                    alert('Você deve digitar o estado do cliente!');
                    document.getElementById("estado").focus();
                    return false
                }
            }
        </script>
        <script>

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
        <!--script que boqueia campo de busca da modal cidades-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarClientes").click(function () {
                    // desabilitando o campo
                    $('#cli').attr("disabled", true);
                    $('#cpfbusc').attr("disabled", true);
                    $('#btnBuscarClientes').attr("disabled", true);
                });
                $("#btnLimparClientes").click(function () {
                    // habilita o campo
                    $('#cli').attr("disabled", false);
                    $('#cpfbusc').attr("disabled", false);
                    $('#btnBuscarClientes').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela de cidades, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarClientes').click(function () {
                $.ajax({
                    url: "listagemclientes.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaclient').html(html);
                });
                return false;
            });
        </script>

        <!--script que atualiza a tabela de Clientes, quando limpamos o contéudo do campo-->
        <script lang="javascript">
            $('#btnLimparClientes').click(function () {
                $.ajax({
                    url: "listagemclientes.jsp",
                    method: "POST",
                    data: $('form').serialize(),
                    dataType: "html"
                }).done(function (html) {
                    $('#tabelaclient').html(html);
                });
                return false;
            }
            );
        </script>


        <!--script que boqueia campo de busca da modal cidades-->
        <script>
            $(document).ready(function () {
                $("#btnBuscarCidade").click(function () {
                    // desabilitando o campo
                    $('#busCid').attr("disabled", true);
                    $('#btnBuscarCidade').attr("disabled", true);
                });
                $("#btnLimparCidade").click(function () {
                    // habilita o campo
                    $('#busCid').attr("disabled", false);
                    $('#btnBuscarCidade').attr("disabled", false);
                });
            });
        </script>

        <!--script que atualiza a tabela de cidades, fazendo a busca-->
        <script lang="javascript">
            $('#btnBuscarCidade').click(function () {
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
            $('#btnLimparCidade').click(function () {
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
