package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import daos.ProdutoDAOs;
import daos.ClienteDAOs;
import daos.VendaDAOs;
import negocio.Produto;
import negocio.Cliente;
import negocio.Venda;
import java.util.ArrayList;
import negocio.Produto;

public final class listagemvenda_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Sistepad - Lista de Venda</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("         ");
 String cliente = (String) request.getParameter("cliente");
            String data    = (String) request.getParameter("databusc");
            String criterio = "";
            
            if (cliente == null && data == null) {
                criterio = "";
            } else if (cliente != "" && data.equalsIgnoreCase("")) {
                criterio = "and c.nomecli ilike '%" + cliente + "%'";
            } else if (cliente == "" && data.equalsIgnoreCase("")) {
                criterio = "and v.datavenda = '" + data + "'";
            } else if (cliente != "" && data.equalsIgnoreCase("")) {
                criterio = "and c.nomecli ilike  '%" + cliente + "%' and v.datavenda = '" + data + "'";
            }
            ArrayList<Venda> listarVendas = new VendaDAOs().buscarVendaModallistagem(criterio);
        
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"panel-body\">\n");
      out.write("            <div class=\"table-responsive\">\n");
      out.write("                <table class=\"table table-hover\" id=\"tabelavenda\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Código da Venda</td>\n");
      out.write("                            <td>Produto</td>\n");
      out.write("                            <td>Cliente</td>\n");
      out.write("                            <td>Quantidade</td>\n");
      out.write("                            <td>Valor Unitário</td>\n");
      out.write("                            <td>Valor total da Venda</td>\n");
      out.write("                            <td>Data da venda</td>\n");
      out.write("                            <td>Alterar</td>\n");
      out.write("                            <td>Excluir</td>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    ");

                        for (int i = 0; i < listarVendas.size(); i++) {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( listarVendas.get(i).getIdvenda());
      out.write("</td>\n");
      out.write("\n");
      out.write("                        <!--aqui troca o código da listagem e puxa a palavra na descrição do produto-->\n");
      out.write("                        ");

                            Produto ven = new ProdutoDAOs().buscarProduto(listarVendas.get(i).getIdproduto());
                        
      out.write("  \n");
      out.write("                        <td>");
      out.print( ven.getNomeprod());
      out.write("</td>\n");
      out.write("\n");
      out.write("                        <!--aqui troca o código da listagem e puxa a palavra na nome cliente-->\n");
      out.write("                        ");

                            Cliente cli = new ClienteDAOs().buscarCliente(listarVendas.get(i).getIdcliente());
                        
      out.write("  \n");
      out.write("                        <td>");
      out.print( cli.getNomecli());
      out.write("</td>\n");
      out.write("\n");
      out.write("                        <td>");
      out.print( listarVendas.get(i).getQuantidadevenda());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( listarVendas.get(i).getValorunit());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( listarVendas.get(i).getValortotalvenda());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( listarVendas.get(i).getDatavenda());
      out.write("</td>\n");
      out.write("                        <td><a href=\"/Sistepad/acoes?acao=alteracaoVenda&idvenda=");
      out.print(listarVendas.get(i).getIdvenda());
      out.write("&idproduto=");
      out.print(listarVendas.get(i).getIdproduto());
      out.write("\" class= \" fa fa-edit col-lg-12\"></a></td>\n");
      out.write("                        <td><a href=\"/Sistepad/acoes?acao=excluiVenda&idvenda=");
      out.print(listarVendas.get(i).getIdvenda());
      out.write("&idproduto=");
      out.print(listarVendas.get(i).getIdproduto());
      out.write("\" OnClick=\"return confirm('Deseja realmente excluir esta venda?')\" class= \" fa fa-trash-o col-lg-12\"></a></td>\n");
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                        }
                    
      out.write("    \n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div> \n");
      out.write("\n");
      out.write("        <!--script que pega valor da tabela cidade e preenche os campos do cadastro-->\n");
      out.write("        <script language=\"javascript\">\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('#tabelavenda tr').click(function () {\n");
      out.write("                    // escreve no console\n");
      out.write("                    console.log($(this).find('td').eq(0).html());\n");
      out.write("                    console.log($(this).find('td').eq(1).html());\n");
      out.write("\n");
      out.write("                    // atribui valor ao campo de dados\n");
      out.write("                    $('#cidade').val($(this).find('td').eq(0).html());\n");
      out.write("                    $('#estado').val($(this).find('td').eq(1).html());\n");
      out.write("\n");
      out.write("                    // fecha janela após clique\n");
      out.write("                    $('#abrirvenda').modal('hide');\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
