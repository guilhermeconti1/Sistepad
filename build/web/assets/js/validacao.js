//função auxiliar para validar nome cliente
function NomeClienteValidacao() {

    if (validarCampoComum('#nomecli')) {
        $('#nomecli-error').css('display', 'none');
    } else {
        $('#nomecli-error').css('display', 'block');
    }
}