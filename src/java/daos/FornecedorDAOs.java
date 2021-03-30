/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import negocio.Fornecedor;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.ImageIcon;
import negocio.Arquivo;


public class FornecedorDAOs {

    ResultSet resultadoQ;

    public boolean salvar(Fornecedor fornec) {
        if (fornec.getIdfornecedor() == 0) {

            String sql = "INSERT INTO fornecedor VALUES"
                    + " (DEFAULT, "
                    + "'" + fornec.getRazaoSocial() + "',"
                    + "'" + fornec.getPessoaResponsavel() + "',"
                    + "'" + fornec.getCnpj() + "',"
                    + "'" + fornec.getEmail() + "',"
                    + "'" + fornec.getSite() + "',"
                    + "'" + fornec.getFonefornec() + "',"
                    + "'" + fornec.getEnderecofornec() + "',"
                    + "'" + fornec.getCidade() + "',"
                    + "'" + fornec.getEstado() + "')";

            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao gravar fornecedor: " + e);
                return false;
            }
            return true;

        } else { // alteracao
            String sql = "UPDATE fornecedor SET "
                    + "razaosocial='" + fornec.getRazaoSocial() + "',"
                    + "pessoaresponsavel='" + fornec.getPessoaResponsavel() + "',"
                    + "cnpj='" + fornec.getCnpj() + "',"
                    + "email='" + fornec.getEmail() + "',"
                    + "site='" + fornec.getSite() + "',"
                    + "fonefornec='" + fornec.getFonefornec() + "',"
                    + "enderecofornec='" + fornec.getEnderecofornec() + "',"
                    + "cidade ='" + fornec.getCidade() + "',"
                    + "estado='" + fornec.getEstado() + "'"
                    + "WHERE idfornecedor = " + fornec.getIdfornecedor() + "";
            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao alterar fornecedor: " + e);
                return false;
            }
            return true;
        }
    }

    public boolean deletar(int idfornecedor) {

        String sql = " DELETE FROM fornecedor "
                + "WHERE idfornecedor = " + idfornecedor + "";

        try {
            int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao excluir fornecedor: " + e);
            return false;
        }
        return true;
    }

    public ArrayList<Fornecedor> buscarFornecedor() {

        ArrayList<Fornecedor> fornecedores = new ArrayList<>();

        String sql = "select * from fornecedor order by idfornecedor";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setIdfornecedor(resultado.getInt("idfornecedor"));
                fornecedor.setRazaoSocial(resultado.getString("razaosocial"));
                fornecedor.setPessoaResponsavel(resultado.getString("pessoaresponsavel"));
                fornecedor.setCnpj(resultado.getString("cnpj"));
                fornecedor.setEmail(resultado.getString("email"));
                fornecedor.setSite(resultado.getString("site"));
                fornecedor.setFonefornec(resultado.getString("fonefornec"));
                fornecedor.setEnderecofornec(resultado.getString("enderecofornec"));
                fornecedor.setCidade(resultado.getString("cidade"));
                fornecedor.setEstado(resultado.getString("estado"));

                fornecedores.add(fornecedor);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar fornecedor: " + e);
            return null;
        }
        return fornecedores;
    }

    public ArrayList<Fornecedor> buscarFornecedorModal(String fn) {

        ArrayList<Fornecedor> forne = new ArrayList<>();

        String sql = "select * from fornecedor where  razaosocial ilike '%" + fn + "%' order by razaosocial";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setIdfornecedor(resultado.getInt("idfornecedor"));
                fornecedor.setRazaoSocial(resultado.getString("razaosocial"));
                fornecedor.setCnpj(resultado.getString("cnpj"));
                fornecedor.setFonefornec(resultado.getString("fonefornec"));
                fornecedor.setEnderecofornec(resultado.getString("enderecofornec"));
                fornecedor.setCidade(resultado.getString("cidade"));
                fornecedor.setEstado(resultado.getString("estado"));

                forne.add(fornecedor);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Fornecedor: " + e);
            return null;
        }
        return forne;
    }

    public ArrayList<Fornecedor> buscarFornecedorModal2(String fn) {

        ArrayList<Fornecedor> forne = new ArrayList<>();

        String sql = "select * from fornecedor where  razaosocial ilike '%" + fn + "%' order by razaosocial";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setIdfornecedor(resultado.getInt("idfornecedor"));
                fornecedor.setRazaoSocial(resultado.getString("razaosocial"));
                fornecedor.setPessoaResponsavel(resultado.getString("pessoaresponsavel"));
                fornecedor.setCnpj(resultado.getString("cnpj"));
                fornecedor.setEmail(resultado.getString("email"));
                fornecedor.setSite(resultado.getString("site"));
                fornecedor.setFonefornec(resultado.getString("fonefornec"));
                fornecedor.setEnderecofornec(resultado.getString("enderecofornec"));
                fornecedor.setCidade(resultado.getString("cidade"));
                fornecedor.setEstado(resultado.getString("estado"));

                forne.add(fornecedor);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Fornecedor: " + e);
            return null;
        }
        return forne;
    }

    public Fornecedor buscarFornecedor(int idfornecedor) {

        Fornecedor fornecedor = new Fornecedor();

        String sql = "select * from fornecedor where idfornecedor = " + idfornecedor;
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                fornecedor.setIdfornecedor(resultado.getInt("idfornecedor"));
                fornecedor.setRazaoSocial(resultado.getString("razaosocial"));
                fornecedor.setPessoaResponsavel(resultado.getString("pessoaresponsavel"));
                fornecedor.setCnpj(resultado.getString("cnpj"));
                fornecedor.setEmail(resultado.getString("email"));
                fornecedor.setSite(resultado.getString("site"));
                fornecedor.setFonefornec(resultado.getString("fonefornec"));
                fornecedor.setEnderecofornec(resultado.getString("enderecofornec"));
                fornecedor.setCidade(resultado.getString("cidade"));
                fornecedor.setEstado(resultado.getString("estado"));
            }

        } catch (Exception e) {
            System.out.println("Erro ao consultar fornecedor: " + e);
            return null;
        }
        return fornecedor;
    }

    public void gerarCSV() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\fornecedor.csv");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM fornecedor ORDER BY idfornecedor";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getInt("idfornecedor") + ";"
                            + rs.getInt("razaosocial") + ";"
                            + rs.getInt("pessoaresponsavel") + ";"
                            + rs.getInt("cnpj") + ";"
                            + rs.getInt("email") + ";"
                            + rs.getInt("site") + ";"
                            + rs.getInt("fonefornec") + ";"
                            + rs.getInt("enderecofornec") + ";"
                            + rs.getInt("cidade") + ";"
                            + rs.getString("estado");

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
}
