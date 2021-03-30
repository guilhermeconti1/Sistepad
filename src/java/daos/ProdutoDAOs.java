/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import negocio.Arquivo;
import controle.Formatacao;
import negocio.Produto;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.ImageIcon;


public class ProdutoDAOs {

    ResultSet resultadoQ;

    public boolean salvar(Produto prod) {
        if (prod.getIdproduto() == 0) {

            String sql = "INSERT INTO produto VALUES"
                    + " (DEFAULT, "
                    + "'" + prod.getNomeprod() + "',"
                    + "'" + prod.getDescricaoprod() + "',"
                    + "'" + prod.getCodcategoriaproduto() + "',"
                    + "'" + prod.getCodunidademedida() + "',"
                    + "'" + prod.getPrecoprod() + "',"
                    + "'" + prod.getDataprimeiravenda() + "')";

            System.out.println(sql);

            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao gravar Produto: " + e);
                return false;
            }
            return true;

        } else { // alteracao no DAOS sempre os campos do banco de dados eu trabalho
            String sql = "UPDATE produto SET "
                    + "nomeprod='" + prod.getNomeprod() + "',"
                    + "descricaoprod='" + prod.getDescricaoprod() + "',"
                    + "codcategoriaproduto='" + prod.getCodcategoriaproduto() + "',"
                    + "codunidademedida='" + prod.getCodunidademedida() + "',"
                    + "precoprod='" + prod.getPrecoprod() + "',"
                    + "dataprimeiravenda='" + prod.getDataprimeiravenda() + "'"
                    + "WHERE idproduto = " + prod.getIdproduto() + "";
            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao alterar produto: " + e);
                return false;
            }
            return true;
        }
    }

    public boolean deletar(int idproduto) {

        String sql = " DELETE FROM produto "
                + "WHERE idproduto = " + idproduto + "";

        try {
            int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao excluir produto: " + e);
            return false;
        }
        return true;
    }

    public ArrayList<Produto> buscarProduto() {

        ArrayList<Produto> produtos = new ArrayList<>();

        String sql = "select * from produto order by idproduto";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Produto produto = new Produto();
                produto.setIdproduto(resultado.getInt("idproduto"));
                produto.setNomeprod(resultado.getString("nomeprod"));
                produto.setDescricaoprod(resultado.getString("descricaoprod"));
                produto.setCodcategoriaproduto(resultado.getInt("codcategoriaproduto"));
                produto.setCodunidademedida(resultado.getInt("codunidademedida"));
                produto.setPrecoprod(resultado.getInt("precoprod"));
                produto.setDataprimeiravenda(Formatacao.ajustaDataDMA(resultado.getString("dataprimeiravenda")));

                produtos.add(produto);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar produtos: " + e);
            return null;
        }
        return produtos;
    }

    public ArrayList<Produto> buscarProdutoModal(String prod) {

        ArrayList<Produto> prd = new ArrayList<>();

        String sql = "select * from produto where nomeprod ilike '%" + prod + "%' order by nomeprod";

        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                Produto produt = new Produto();
                produt.setIdproduto(resultado.getInt("idproduto"));
                produt.setNomeprod(resultado.getString("nomeprod"));
                produt.setDescricaoprod(resultado.getString("descricaoprod"));
                produt.setCodcategoriaproduto(resultado.getInt("Codcategoriaproduto"));
                produt.setCodunidademedida(resultado.getInt("Codunidademedida"));
                produt.setPrecoprod(resultado.getInt("precoprod"));

                prd.add(produt);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Produto: " + e);
            return null;
        }
        return prd;
    }

    public ArrayList<Produto> buscarProdutoModallistagem(String prod) {

        ArrayList<Produto> prd = new ArrayList<>();

        String sql = "select * from produto where " + prod + " order by nomeprod";
        
        

        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                Produto produt = new Produto();
                produt.setIdproduto(resultado.getInt("idproduto"));
                produt.setNomeprod(resultado.getString("nomeprod"));
                produt.setDescricaoprod(resultado.getString("descricaoprod"));
                produt.setCodcategoriaproduto(resultado.getInt("Codcategoriaproduto"));
                produt.setCodunidademedida(resultado.getInt("Codunidademedida"));
                produt.setPrecoprod(resultado.getDouble("precoprod"));
                produt.setDataprimeiravenda(Formatacao.ajustaDataDMA(resultado.getString("dataprimeiravenda")));

                prd.add(produt);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Produto: " + e);
            return null;
        }
        return prd;
    }

    public Produto buscarProduto(int idproduto) {

        Produto produto = new Produto();

        String sql = "select * from produto where idproduto = " + idproduto;
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                produto.setIdproduto(resultado.getInt("idproduto"));
                produto.setNomeprod(resultado.getString("nomeprod"));
                produto.setDescricaoprod(resultado.getString("descricaoprod"));
                produto.setCodcategoriaproduto(resultado.getInt("codcategoriaproduto"));
                produto.setCodunidademedida(resultado.getInt("codunidademedida"));
                produto.setPrecoprod(resultado.getDouble("precoprod"));
                produto.setDataprimeiravenda(resultado.getString("dataprimeiravenda"));

            }

        } catch (Exception e) {
            System.out.println("Erro ao consultar produto: " + e);
            return null;
        }
        return produto;
    }

    public void gerarCSV() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\produtos.csv");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM produto ORDER BY nomeprod";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getInt("idproduto") + ";"
                            + rs.getString("nomeprod") + ";"
                            + rs.getString("descricaoprod") + ";"
                            + rs.getInt("codcategoriaproduto") + ";"
                            + rs.getInt("codunidademedida") + ";"
                            + rs.getInt("precoprod") + ";"
                            + rs.getString("dataprimeiravenda");

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
     public void gerarCSVData() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\produtosdata.csv");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM produto ORDER BY dataprimeiravenda";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getString("nomeprod")+ ";"
                         + rs.getString("dataprimeiravenda");

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
        public void gerarCSVProduto() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\produtosproduto.csv");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM produto ORDER BY nomeprod";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getString("nomeprod");
                  

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
}
