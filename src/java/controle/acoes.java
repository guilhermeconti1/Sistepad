/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import daos.CategoriaProdutoDAOs;
import daos.ClienteDAOs;
import daos.EstoqueDAOs;
import daos.FornecedorDAOs;
import daos.ProdutoDAOs;
import daos.UnidadeMedidaDAOs;
import daos.UsuarioSistemaDAO;
import daos.VendaDAOs;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import negocio.CategoriaProduto;
import negocio.Cliente;
import negocio.Estoque;
import negocio.Fornecedor;
import negocio.Produto;
import negocio.UnidadeMedida;
import negocio.UsuarioSistema;
import negocio.Venda;


public class acoes extends HttpServlet {

    HttpServletRequest requisicao;
    HttpServletResponse resposta;
    PrintWriter saida;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        requisicao = request;
        resposta = response;
        saida = response.getWriter();
        requisicao.setCharacterEncoding("utf-8");

        if (requisicao.getParameter("acao").equals("login")) {
            autenticar();
        } else if (requisicao.getParameter("acao").equals("menu")) {
            encaminharPagina("menu.jsp");
        } else if (requisicao.getParameter("acao").equals("cadastroCli")) {
            cadastroCliente();
        } else if (requisicao.getParameter("acao").equals("alteracaoCli")) {
            mudarCliente();
        } else if (requisicao.getParameter("acao").equals("excluiCli")) {
            excluirCliente();
        } else if (requisicao.getParameter("acao").equals("cadastroFornec")) {
            cadastroFornecedor();
        } else if (requisicao.getParameter("acao").equals("alteracaoFornec")) {
            mudarFornecedor();
        } else if (requisicao.getParameter("acao").equals("excluiFornec")) {
            excluirFornecedor();
        } else if (requisicao.getParameter("acao").equals("cadastroCategoriaProduto")) {
            cadastroCategoriaProduto();
        } else if (requisicao.getParameter("acao").equals("alteracaoCategoriaProduto")) {
            mudarCategoriaProduto();
        } else if (requisicao.getParameter("acao").equals("excluiCategoriaProduto")) {
            excluirCategoriaProduto();
        } else if (requisicao.getParameter("acao").equals("cadastroUnidadeMedida")) {
            cadastroUnidadeMedida();
        } else if (requisicao.getParameter("acao").equals("alteracaoUnidadeMedida")) {
            mudarUnidadeMedida();
        } else if (requisicao.getParameter("acao").equals("excluiUnidadeMedida")) {
            excluirUnidadeMedida();
        } else if (requisicao.getParameter("acao").equals("cadastroProduto")) {
            cadastroProduto();
        } else if (requisicao.getParameter("acao").equals("alteracaoProduto")) {
            mudarProduto();
        } else if (requisicao.getParameter("acao").equals("excluiProduto")) {
            excluirProduto();
        } else if (requisicao.getParameter("acao").equals("cadastroEstoque")) {
            cadastroEstoque();
        } else if (requisicao.getParameter("acao").equals("alteracaoEstoque")) {
            mudarEstoque();
        } else if (requisicao.getParameter("acao").equals("excluiEstoque")) {
            excluirEstoque();
        } else if (requisicao.getParameter("acao").equals("cadastroVenda")) {
            cadastroVenda();
        } else if (requisicao.getParameter("acao").equals("alteracaoVenda")) {
            mudarVenda();
        } else if (requisicao.getParameter("acao").equals("excluiVenda")) {
            excluirVenda();
        } else if (requisicao.getParameter("acao").equals("GerarCliente")) {
            GerarCliente();
        } else if (requisicao.getParameter("acao").equals("GerarClienteNome")) {
            GerarClienteNome();
        } else if (requisicao.getParameter("acao").equals("GerarProduto")) {
            GerarProduto();
        } else if (requisicao.getParameter("acao").equals("GerarProdutoData")) {
            GerarProdutoData();
        } else if (requisicao.getParameter("acao").equals("GerarProdutoNome")) {
            GerarProdutoNome();
        } else if (requisicao.getParameter("acao").equals("GerarVenda")) {
            GerarVenda();
        } else if (requisicao.getParameter("acao").equals("GerarFornecedor")) {
            GerarFornecedor();
        } else if (requisicao.getParameter("acao").equals("GerarEstoque")) {
            GerarEstoque();
        } else if (requisicao.getParameter("acao").equals("GerarUnidadeMedida")) {
            GerarUnidadeMedida();
        } else if (requisicao.getParameter("acao").equals("logout")) {
            logout();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void GerarProduto() {
        new ProdutoDAOs().gerarCSV();

        try {
            resposta.sendRedirect("arquivos csv/produtos.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarProdutoData() {
        new ProdutoDAOs().gerarCSVData();

        try {
            resposta.sendRedirect("arquivos csv/produtosdata.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarVenda() {
        new VendaDAOs().gerarCSV();

        try {
            resposta.sendRedirect("arquivos csv/vendas.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarFornecedor() {
        new FornecedorDAOs().gerarCSV();

        try {
            resposta.sendRedirect("arquivos csv/fornecedor.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarEstoque() {
        new EstoqueDAOs().gerarCSV();

        try {
            resposta.sendRedirect("arquivos csv/estoque.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarProdutoNome() {
        new ProdutoDAOs().gerarCSVProduto();

        try {
            resposta.sendRedirect("arquivos csv/produtosproduto.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarCliente() {
        new ClienteDAOs().gerarCSV();

        try {
            resposta.sendRedirect("arquivos csv/clientes.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarClienteNome() {
        new ClienteDAOs().gerarCSVNome();

        try {
            resposta.sendRedirect("arquivos csv/clientesnome.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void GerarUnidadeMedida() {
        new ClienteDAOs().gerarCSV();

        try {
            resposta.sendRedirect("arquivos csv/unidademedida.csv");
        } catch (Exception e) {
            System.out.println("erro no arquivo: " + e);
        }
    }

    private void autenticar() {
        String login = requisicao.getParameter("login");
        String senha = requisicao.getParameter("senha");

        UsuarioSistema usuarioSistema = new UsuarioSistemaDAO().autenticar(login, senha);

        if (usuarioSistema != null) {

            HttpSession sessao = requisicao.getSession();
            sessao.setAttribute("usuarioLogado", usuarioSistema);

            encaminharPagina("menu.jsp");
        } else {
            requisicao.setAttribute("erro", "errrouuuu");
            encaminharPagina("index.jsp");
        }
    }

    //método para deslogar o usuário
    private void logout() {

        HttpSession sessao = requisicao.getSession();
        sessao.invalidate();

        try {
            resposta.sendRedirect("index.jsp");
        } catch (Exception e) {
            System.out.println("erro logout: " + e);
        }
    }

    private void cadastroCliente() {
        int idcliente = Integer.parseInt(requisicao.getParameter("idcliente"));
        String nomecli = requisicao.getParameter("nomecli");
        String sexo = requisicao.getParameter("sexo");
        int idade = Integer.parseInt(requisicao.getParameter("idade"));
        String celular = requisicao.getParameter("celular");
        String cpf = requisicao.getParameter("cpf");
        String enderecocli = requisicao.getParameter("enderecocli");
        String cidade = requisicao.getParameter("cidade");
        String estado = requisicao.getParameter("estado");

        Cliente cliente = new Cliente();
        cliente.setIdcliente(idcliente);
        cliente.setNomecli(nomecli);
        cliente.setSexo(sexo);
        cliente.setIdade(idade);
        cliente.setCelular(celular);
        cliente.setCpf(cpf);
        cliente.setEnderecocli(enderecocli);
        cliente.setCidade(cidade);
        cliente.setEstado(estado);

        if (new ClienteDAOs().salvar(cliente)) {
            encaminharPagina("clientes.jsp");
        } else {
            requisicao.setAttribute("origem", "clientes.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void mudarCliente() {
        int idcliente = Integer.parseInt(requisicao.getParameter("idcliente"));

        Cliente c = new ClienteDAOs().buscarCliente(idcliente);

        if (c != null) {
            requisicao.setAttribute("cli", c);
            encaminharPagina("clientes.jsp");
        }
    }

    private void excluirCliente() {
        int idcliente = Integer.parseInt(requisicao.getParameter("idcliente"));
        if (new ClienteDAOs().deletar(idcliente)) {
            encaminharPagina("clientes.jsp");
        } else {
            requisicao.setAttribute("origem", "clientes.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void cadastroFornecedor() {
        int idfornecedor = Integer.parseInt(requisicao.getParameter("idfornecedor"));
        String RazaoSocial = requisicao.getParameter("razaosocial");
        String PessoaResponsavel = requisicao.getParameter("pessoaresponsavel");
        String cnpj = requisicao.getParameter("cnpj");
        String email = requisicao.getParameter("email");
        String site = requisicao.getParameter("site");
        String fonefornec = requisicao.getParameter("fonefornec");
        String enderecofornec = requisicao.getParameter("enderecofornec");
        String cidade = requisicao.getParameter("cidade");
        String estado = requisicao.getParameter("estado");

        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setIdfornecedor(idfornecedor);
        fornecedor.setRazaoSocial(RazaoSocial);
        fornecedor.setPessoaResponsavel(PessoaResponsavel);
        fornecedor.setCnpj(cnpj);
        fornecedor.setEmail(email);
        fornecedor.setSite(site);
        fornecedor.setFonefornec(fonefornec);
        fornecedor.setEnderecofornec(enderecofornec);
        fornecedor.setCidade(cidade);
        fornecedor.setEstado(estado);

        if (new FornecedorDAOs().salvar(fornecedor)) {
            encaminharPagina("fornecedores.jsp");
        } else {
            requisicao.setAttribute("origem", "fornecedores.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void mudarFornecedor() {
        int idfornecedor = Integer.parseInt(requisicao.getParameter("idfornecedor"));

        Fornecedor f = new FornecedorDAOs().buscarFornecedor(idfornecedor);

        if (f != null) {
            requisicao.setAttribute("fornec", f);
            encaminharPagina("fornecedores.jsp");
        }
    }

    private void excluirFornecedor() {
        int idfornecedor = Integer.parseInt(requisicao.getParameter("idfornecedor"));
        if (new FornecedorDAOs().deletar(idfornecedor)) {
            encaminharPagina("fornecedores.jsp");
        } else {
            requisicao.setAttribute("origem", "fornecedores.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void cadastroCategoriaProduto() {
        int codcategoria = Integer.parseInt(requisicao.getParameter("codcategoria"));
        String Descricaocat = requisicao.getParameter("descricaocat");

        CategoriaProduto categoriaProduto = new CategoriaProduto();
        categoriaProduto.setCodcategoria(codcategoria);
        categoriaProduto.setDescricaocat(Descricaocat);

        if (new CategoriaProdutoDAOs().gravar(categoriaProduto)) {
            encaminharPagina("categoriaproduto.jsp");
        } else {
            requisicao.setAttribute("origem", "categoriaproduto.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void mudarCategoriaProduto() {
        int codcategoria = Integer.parseInt(requisicao.getParameter("codcategoria"));

        CategoriaProduto c = new CategoriaProdutoDAOs().buscarCategoriaProduto(codcategoria);

        if (c != null) {
            requisicao.setAttribute("cp", c);
            encaminharPagina("categoriaproduto.jsp");
        }
    }

    private void excluirCategoriaProduto() {
        int codcategoria = Integer.parseInt(requisicao.getParameter("codcategoria"));
        if (new CategoriaProdutoDAOs().deletar(codcategoria)) {
            encaminharPagina("categoriaproduto.jsp");
        } else {
            requisicao.setAttribute("origem", "categoriaproduto.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void cadastroUnidadeMedida() {
        int codunidademedida = Integer.parseInt(requisicao.getParameter("codunidademedida"));
        String Nome = requisicao.getParameter("nomeunidade");
        String Status = requisicao.getParameter("statusunidade");

        UnidadeMedida unidadeMedida = new UnidadeMedida();
        unidadeMedida.setCodUnidadeMedida(codunidademedida);
        unidadeMedida.setNome(Nome);
        unidadeMedida.setStatus(Status);

        if (new UnidadeMedidaDAOs().gravar(unidadeMedida)) {
            encaminharPagina("unidademedida.jsp");
        } else {
            requisicao.setAttribute("origem", "unidademedida.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void mudarUnidadeMedida() {
        int codunidademedida = Integer.parseInt(requisicao.getParameter("codunidademedida"));

        UnidadeMedida u = new UnidadeMedidaDAOs().buscarUnidadeMedida(codunidademedida);

        if (u != null) {
            requisicao.setAttribute("um", u);
            encaminharPagina("unidademedida.jsp");
        }
    }

    private void excluirUnidadeMedida() {
        int codunidademedida = Integer.parseInt(requisicao.getParameter("codunidademedida"));
        if (new UnidadeMedidaDAOs().deletar(codunidademedida)) {
            encaminharPagina("unidademedida.jsp");
        } else {
            requisicao.setAttribute("origem", "unidademedida.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void cadastroProduto() {
        //os parametros da qui devem ser aqueles do jsp do produto
        int idproduto = Integer.parseInt(requisicao.getParameter("idproduto"));
        String nomeprod = requisicao.getParameter("nomeprod");
        String descricaoprod = requisicao.getParameter("descricaoprod");
        int codcategoriaproduto = Integer.parseInt(requisicao.getParameter("codcatpro"));
        int codunidademedida = Integer.parseInt(requisicao.getParameter("codunidmed"));
        double precoprod = Double.parseDouble(requisicao.getParameter("precoprod"));
        String dataprimeiravenda = requisicao.getParameter("dataprimeiravenda");

        Produto prod = new Produto();
        prod.setIdproduto(idproduto);
        prod.setNomeprod(nomeprod);
        prod.setDescricaoprod(descricaoprod);
        prod.setCodcategoriaproduto(codcategoriaproduto);
        prod.setCodunidademedida(codunidademedida);
        prod.setPrecoprod(precoprod);
        prod.setDataprimeiravenda(dataprimeiravenda);

        if (new ProdutoDAOs().salvar(prod)) {
            encaminharPagina("produto.jsp");
        } else {
            requisicao.setAttribute("origem", "produto.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void mudarProduto() {
        int idproduto = Integer.parseInt(requisicao.getParameter("idproduto"));

        Produto p = new ProdutoDAOs().buscarProduto(idproduto);

        if (p != null) {
            requisicao.setAttribute("prod", p);
            encaminharPagina("produto.jsp");
        }
    }

    private void excluirProduto() {
        int idproduto = Integer.parseInt(requisicao.getParameter("idproduto"));
        if (new ProdutoDAOs().deletar(idproduto)) {
            encaminharPagina("produto.jsp");
        } else {
            requisicao.setAttribute("origem", "produto.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void cadastroEstoque() {
        //os parametros da qui devem ser aqueles do jsp do estoque
        int idestoque = Integer.parseInt(requisicao.getParameter("idestoque"));
        int idfornecedor = Integer.parseInt(requisicao.getParameter("idfornecedorr"));
        String nomesuprimento = requisicao.getParameter("nomesuprimento");
        double precoestoque = Double.parseDouble(requisicao.getParameter("precoestoque"));
        String validade = requisicao.getParameter("validade");
        int quantidadeestoque = Integer.parseInt(requisicao.getParameter("quantidadeestoque"));

        Estoque est = new Estoque();
        est.setIdestoque(idestoque);
        est.setIdfornecedor(idfornecedor);
        est.setNomesuprimento(nomesuprimento);
        est.setPrecoestoque(precoestoque);
        est.setValidade(validade);
        est.setQuantidadeestoque(quantidadeestoque);

        if (new EstoqueDAOs().salvar(est)) {
            encaminharPagina("estoque.jsp");
        } else {
            requisicao.setAttribute("origem", "estoque.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void mudarEstoque() {
        int idestoque = Integer.parseInt(requisicao.getParameter("idestoque"));

        Estoque e = new EstoqueDAOs().buscarEstoque(idestoque);

        if (e != null) {
            requisicao.setAttribute("est", e);
            encaminharPagina("estoque.jsp");
        }
    }

    private void excluirEstoque() {
        int idestoque = Integer.parseInt(requisicao.getParameter("idestoque"));
        if (new EstoqueDAOs().deletar(idestoque)) {
            encaminharPagina("estoque.jsp");
        } else {
            requisicao.setAttribute("origem", "estoque.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    private void cadastroVenda() {

        String validacao;
        validacao = requisicao.getParameter("validacao");
        int idvenda = Integer.parseInt(requisicao.getParameter("idvenda"));
        int idproduto = Integer.parseInt(requisicao.getParameter("idproduto"));
        int idcliente = Integer.parseInt(requisicao.getParameter("idcliente"));
        double quantidadevenda = Double.parseDouble(requisicao.getParameter("quantidadevenda"));
        double valorunit = Double.parseDouble(requisicao.getParameter("valorunit"));
        double valortotalvenda = Double.parseDouble(requisicao.getParameter("valortotalvenda"));
        String datavenda = requisicao.getParameter("datavenda");

        Venda v = new Venda();
        v.setIdvenda(idvenda);
        v.setIdproduto(idproduto);
        v.setIdcliente(idcliente);
        v.setQuantidadevenda(quantidadevenda);
        v.setValorunit(valorunit);
        v.setValortotalvenda(valortotalvenda);
        v.setDatavenda(datavenda);

        if (new VendaDAOs().salvar(v, validacao)) {
            requisicao.setAttribute("validacao", "S");
            requisicao.setAttribute("anterior", v);
            encaminharPagina("venda.jsp");
        } else {
            requisicao.setAttribute("cadastrado", "sim");
            encaminharPagina("venda.jsp");
        }

    }

    private void mudarVenda() {
        int idvenda = Integer.parseInt(requisicao.getParameter("idvenda"));
        int idproduto = Integer.parseInt(requisicao.getParameter("idproduto"));

        Venda ven = new VendaDAOs().buscaVenda(idvenda, idproduto);

        if (ven != null) {
            requisicao.setAttribute("validacao", "A");
            requisicao.setAttribute("v", ven);
            encaminharPagina("venda.jsp");
        }
    }

    private void excluirVenda() {
        int idvenda = Integer.parseInt(requisicao.getParameter("idvenda"));
        int idproduto = Integer.parseInt(requisicao.getParameter("idproduto"));

        if (new VendaDAOs().deletar(idvenda, idproduto)) {
            requisicao.setAttribute("validacao", "S");
            encaminharPagina("venda.jsp");
        } else {
            requisicao.setAttribute("origem", "venda.jsp");
            encaminharPagina("erro.jsp");
        }
    }

    // metodo generico que sempre sera chamado para encaminhar as paginas
    private void encaminharPagina(String pagina) {
        try {
            RequestDispatcher rd = requisicao.getRequestDispatcher(pagina);
            rd.forward(requisicao, resposta);
        } catch (Exception e) {
            System.out.println("Erro de encaminhamento = " + e);
        }
    }

}
