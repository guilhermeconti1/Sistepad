package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import daos.UnidadeMedidaDAOs;
import negocio.UnidadeMedida;
import daos.CategoriaProdutoDAOs;
import negocio.CategoriaProduto;
import daos.ProdutoDAOs;
import java.util.ArrayList;
import negocio.Produto;

public final class listagemproduto_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Sistepad - Listagem de Produto</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");
 String prod = (String) request.getParameter("prod");
            String dataprimeiravenda = (String) request.getParameter("databusc");
            String criterio = "'1'";

            if (prod == null && dataprimeiravenda == null) {
                criterio = "'1'";
            } else if (prod != "" && dataprimeiravenda == "") {
                criterio = "nomeprod ilike '%" + prod + "%'";
            } else if (prod == "" && dataprimeiravenda != "") {
                criterio = "dataprimeiravenda = '" + dataprimeiravenda + "'";
            } else if (prod != "" && dataprimeiravenda != "") {
                criterio = "nomeprod ilike  '%" + prod + "%' and dataprimeiravenda = '" + dataprimeiravenda + "'";
            }
            ArrayList<Produto> produto = new ProdutoDAOs().buscarProdutoModallistagem(criterio);

        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"panel-body\">\n");
      out.write("            <div class=\"table-responsive\">\n");
      out.write("                <table class=\"table table-hover\" id=\"tabelaprodu\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Nome do Produto</td>\n");
      out.write("                            <td>Descrição do Produto</td>\n");
      out.write("                            <td>Categoria de Produto</td>\n");
      out.write("                            <td>Unidade de Medida</td>\n");
      out.write("                            <td>Preço do Produto</td>\n");
      out.write("                            <td>Data primeira Venda</td>\n");
      out.write("                            <td>Alterar</td>\n");
      out.write("                            <td>Excluir</td>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    ");
                        for (int i = 0; i < produto.size(); i++) {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( produto.get(i).getNomeprod());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( produto.get(i).getDescricaoprod());
      out.write("</td>\n");
      out.write("                        <!--aqui troca o código da listagem e puxa a palavra na descrição da categoria de produto-->\n");
      out.write("                        ");

                            CategoriaProduto cat = new CategoriaProdutoDAOs().buscarCategoriaProduto(produto.get(i).getCodcategoriaproduto());
                        
      out.write("  \n");
      out.write("                        <td>");
      out.print( cat.getDescricaocat());
      out.write("</td>\n");
      out.write("                        <!--aqui troca o código da listagem e puxa a palavra na descrição da unidade de medida-->\n");
      out.write("                        ");

                            UnidadeMedida unide = new UnidadeMedidaDAOs().buscarUnidadeMedida(produto.get(i).getCodunidademedida());
                        
      out.write(" \n");
      out.write("                        <td>");
      out.print( unide.getNome());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( produto.get(i).getPrecoprod());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( produto.get(i).getDataprimeiravenda());
      out.write("</td>\n");
      out.write("\n");
      out.write("                        <td><a href=\"/Sistepad/acoes?acao=alteracaoProduto&idproduto=");
      out.print( produto.get(i).getIdproduto());
      out.write("\"  class= \" fa fa-edit col-lg-12\"></a></td>\n");
      out.write("                        <td><a href=\"/Sistepad/acoes?acao=excluiProduto&idproduto=");
      out.print( produto.get(i).getIdproduto());
      out.write("\" OnClick=\"return confirm('O produto será excluido. Deseja realmente fazer isso?')\" class= \" fa fa-trash-o col-lg-12\"></a></td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                        }
                    
      out.write("    \n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
