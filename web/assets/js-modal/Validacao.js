// JavaScript Document
//adiciona mascara de cnpj
function MascaraCNPJ(cnpj) {
    if (mascaraInteiro(cnpj) == false) {
        event.returnValue = false;
    }
    return formataCampo(cnpj, '00.000.000/0000-00', event);
}

//adiciona mascara de cep
function MascaraCep(cep) {
    if (mascaraInteiro(cep) == false) {
        event.returnValue = false;
    }
    return formataCampo(cep, '00.000-000', event);
}

//adiciona mascara de data
function MascaraData(data) {
    if (mascaraInteiro(data) == false) {
        event.returnValue = false;
    }
    return formataCampo(data, '00/00/0000', event);
}

//adiciona mascara ao telefone
function MascaraTelefone(tel) {
    if (mascaraInteiro(tel) == false) {
        event.returnValue = false;
    }
    return formataCampo(tel, '(00) 0000-0000', event);
}

//adiciona mascara ao CPF
function MascaraCPF(cpf) {
    if (mascaraInteiro(cpf) == false) {
        event.returnValue = false;
    }
    return formataCampo(cpf, '000.000.000-00', event);
}

//valida telefone
function ValidaTelefone(tel) {
    exp = /\(\d{2}\)\ \d{4}\-\d{4}/
    if (!exp.test(tel.value))
        alert('Numero de Telefone Invalido!');
}

//valida CEP
function ValidaCep(cep) {
    exp = /\d{2}\.\d{3}\-\d{3}/
    if (!exp.test(cep.value))
        alert('Numero de Cep Invalido!');
}

//valida data
function ValidaData(data) {
    exp = /\d{2}\/\d{2}\/\d{4}/
    if (!exp.test(data.value))
        alert('Data Invalida!');
}

//valida o CPF digitado
function ValidarCPF(Objcpf) {
    var cpf = Objcpf.value;
    exp = /\.|\-/g
    cpf = cpf.toString().replace(exp, "");
    var digitoDigitado = eval(cpf.charAt(9) + cpf.charAt(10));
    var soma1 = 0, soma2 = 0;
    var vlr = 11;

    for (i = 0; i < 9; i++) {
        soma1 += eval(cpf.charAt(i) * (vlr - 1));
        soma2 += eval(cpf.charAt(i) * vlr);
        vlr--;
    }
    soma1 = (((soma1 * 10) % 11) == 10 ? 0 : ((soma1 * 10) % 11));
    soma2 = (((soma2 + (2 * soma1)) * 10) % 11);

    var digitoGerado = (soma1 * 10) + soma2;
    if (digitoGerado != digitoDigitado)
        alert('CPF Invalido!');
}


//valida numero inteiro com mascara
function mascaraInteiro() {
    if (event.keyCode < 48 || event.keyCode > 57) {
        event.returnValue = false;
        return false;
    }
    return true;
}

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

//valida o CNPJ digitado
function ValidarCNPJ(ObjCnpj) {
    var cnpj = ObjCnpj.value;
    var valida = new Array(6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
    var dig1 = new Number;
    var dig2 = new Number;

    exp = /\.|\-|\//g
    cnpj = cnpj.toString().replace(exp, "");
    var digito = new Number(eval(cnpj.charAt(12) + cnpj.charAt(13)));

    for (i = 0; i < valida.length; i++) {
        dig1 += (i > 0 ? (cnpj.charAt(i - 1) * valida[i]) : 0);
        dig2 += cnpj.charAt(i) * valida[i];
    }
    dig1 = (((dig1 % 11) < 2) ? 0 : (11 - (dig1 % 11)));
    dig2 = (((dig2 % 11) < 2) ? 0 : (11 - (dig2 % 11)));

    if (((dig1 * 10) + dig2) != digito)
        return false;

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

function nu(campo) {
    var digits = "0123456789"
    var campo_temp
    for (var i = 0; i < campo.value.length; i++) {
        campo_temp = campo.value.substring(i, i + 1)
        if (digits.indexOf(campo_temp) == -1) {
            campo.value = campo.value.substring(0, i);
            break;
        }
    }
}

function ValRG(numero) {
    /*
     ##  Igor Carvalho de Escobar
     ##    www.webtutoriais.com
     ##   Java Script Developer
     */
    var numero = numero.split("");
    tamanho = numero.length;
    vetor = new Array(tamanho);

    if (tamanho >= 1)
    {
        vetor[0] = parseInt(numero[0]) * 2;
    }
    if (tamanho >= 2) {
        vetor[1] = parseInt(numero[1]) * 3;
    }
    if (tamanho >= 3) {
        vetor[2] = parseInt(numero[2]) * 4;
    }
    if (tamanho >= 4) {
        vetor[3] = parseInt(numero[3]) * 5;
    }
    if (tamanho >= 5) {
        vetor[4] = parseInt(numero[4]) * 6;
    }
    if (tamanho >= 6) {
        vetor[5] = parseInt(numero[5]) * 7;
    }
    if (tamanho >= 7) {
        vetor[6] = parseInt(numero[6]) * 8;
    }
    if (tamanho >= 8) {
        vetor[7] = parseInt(numero[7]) * 9;
    }
    if (tamanho >= 9) {
        vetor[8] = parseInt(numero[8]) * 100;
    }

    total = 0;

    if (tamanho >= 1) {
        total += vetor[0];
    }
    if (tamanho >= 2) {
        total += vetor[1];
    }
    if (tamanho >= 3) {
        total += vetor[2];
    }
    if (tamanho >= 4) {
        total += vetor[3];
    }
    if (tamanho >= 5) {
        total += vetor[4];
    }
    if (tamanho >= 6) {
        total += vetor[5];
    }
    if (tamanho >= 7) {
        total += vetor[6];
    }
    if (tamanho >= 8) {
        total += vetor[7];
    }
    if (tamanho >= 9) {
        total += vetor[8];
    }


    resto = total % 11;
    if (resto != 0) {
        document.getElementById('camada').innerHTML = "<font face=verdana size=2 color=red>RG Inválido!</font><br><br>";
    }
    else {
        document.getElementById('camada').innerHTML = "<font face=verdana size=2 color=forestgreen>RG Válido!</font><br><br>";
    }
}



function validardadosUsuario()
{
    /*
     Para validar o Nome a funcao:
     - testa se ha pelo menos 2 caracteres antes do primeiro espaco
     - se ha espaco depois desses 2 primeiros caracteres
     - se o ultimo sobrenome e composto por pelo menos 2 caracteres
     - se o tamanho do nome nao e inferior a 5
     --> funcao alternativa para testar se sobrenome tem pelo menos 2 caracteres: nome.substring(nome.substring(2,nome.length).indexOf(" ")+1,nome.length).length <= 2
     */

    nome = document.usuarios.nome.value;
    if (nome.substring(0, 2).indexOf(" ") != -1 || nome.substring(2, nome.length).indexOf(" ") == -1 ||
            nome.substring(nome.length - 2, nome.length).indexOf(" ") != -1 || nome.length < 5)
    {
        alert("Preencha campo NOME corretamente!");
        document.usuarios.nome.focus();
        return false;
    }


    if (document.usuarios.usuario.value == "")
    {
        alert("Preencha o campo USUÁRIO corretamente!");
        document.usuarios.usuario.focus();
        return false;
    }

    if (document.usuarios.senha.value == "" || document.usuarios.senha.value.length < 8)
    {
        alert("Preencha o campo SENHA corretamente!");
        document.usuarios.senha.focus();
        return false;
    }

    if (document.usuarios.rg.value == "" || document.usuarios.rg.value.length < 10)
    {
        alert("Preencha o campo RG corretamente!");
        document.usuarios.rg.focus();
        return false;
    }
    if (document.usuarios.cpf.value == "" || document.usuarios.cpf.value.length < 14)
    {
        alert("Preencha o campo CPF corretamente!");
        document.usuarios.cpf.focus();
        return false;
    }

    if (document.usuarios.telefone.value == "" || document.usuarios.telefone.value.length < 14)
    {
        alert("Preencha o campo TELEFONE corretamente!");
        document.usuarios.telefone.focus();
        return false;
    }

    if (document.usuarios.rua.value == "")
    {
        alert("Preencha o campo ENDEREÇO corretamente!");
        document.usuarios.rua.focus();
        return false;
    }

    if (document.usuarios.numero.value == "")
    {
        alert("Preencha o campo NUMERO corretamente!");
        document.usuarios.numero.focus();
        return false;
    }

    //Tentei validar desse jeito, mas não está funcionando corretamente.
//    if (document.usuarios.comboSetor.options[comboSetor.selectedIndex].value == 0)
//    {
//        alert("Escolha um setor!");
//        document.usuarios.comboSetor.focus();
//    }


    /* IF antigo para validacao da mensagem. Teste do tamanho agregado ao IF anterior
     if (document.dados.tx_mensagem.value.length < 50)
     {
     alert("Ã‰ necessario preencher o campo MENSAGEM com mais de 50 caracteres!");
     document.dados.tx_mensagem.style.backgroundColor = "yellow";
     document.dados.tx_mensagem.focus();
     return false;
     }
     document.dados.tx_mensagem.style.backgroundColor = "white";
     */
    return true;
}


function validaCombo() {
    if (document.usuarios.comboSetor.selectedIndex == 0)
    {
        alert("Escolha um setor!");
        document.usuarios.comboSetor.focus();
        return false;
    }
    return true;
}

function validardadosFornecedor()
{
    /*
     Para validar o Nome a funcao:
     - testa se ha pelo menos 2 caracteres antes do primeiro espaco
     - se ha espaco depois desses 2 primeiros caracteres
     - se o ultimo sobrenome e composto por pelo menos 2 caracteres
     - se o tamanho do nome nao e inferior a 5
     --> funcao alternativa para testar se sobrenome tem pelo menos 2 caracteres: nome.substring(nome.substring(2,nome.length).indexOf(" ")+1,nome.length).length <= 2
     */

    razaosocial = document.fornecedor.razaosocial.value;
    if (razaosocial.substring(0, 2).indexOf(" ") != -1 || razaosocial.substring(2, razaosocial.length).indexOf(" ") == -1 ||
            razaosocial.substring(razaosocial.length - 2, razaosocial.length).indexOf(" ") != -1 || razaosocial.length < 5)
    {
        alert("Preencha campo RAZÃO SOCIAL corretamente!");
        document.fornecedor.razaosocial.focus();
        return false;
    }

    fantasia = document.fornecedor.fantasia.value;
    if (fantasia.substring(0, 2).indexOf(" ") != -1 || fantasia.substring(2, fantasia.length).indexOf(" ") == -1 ||
            fantasia.substring(fantasia.length - 2, fantasia.length).indexOf(" ") != -1 || fantasia.length < 5)
    {
        alert("Preencha campo FANTASIA corretamente!");
        document.fornecedor.fantasia.focus();
        return false;
    }


    if (document.fornecedor.cnpj.value == "")
    {
        alert("Preencha o campo CNPF corretamente!");
        document.fornecedor.cnpj.focus();
        return false;
    }

    if (document.fornecedor.telefone.value == "")
    {
        alert("Preencha o campo TELEFONE corretamente!");
        document.fornecedor.telefone.focus();
        return false;
    }

    if (document.fornecedor.rua.value == "")
    {
        alert("Preencha o campo ENDEREÇO corretamente!");
        document.fornecedor.rua.focus();
        return false;
    }

    if (document.fornecedor.numero.value == "")
    {
        alert("Preencha o campo NUMERO corretamente!");
        document.fornecedor.numero.focus();
        return false;
    }



    return true;
}



