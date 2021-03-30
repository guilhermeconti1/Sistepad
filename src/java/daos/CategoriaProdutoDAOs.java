/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import negocio.CategoriaProduto;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;


public class CategoriaProdutoDAOs {

    ResultSet resultadoQ;

    public boolean gravar(CategoriaProduto cp) {

        if (cp.getCodcategoria() == 0) { // insercao

            String sql = "INSERT INTO categoriaproduto VALUES"
                    + " (DEFAULT, "
                    + "'" + cp.getDescricaocat() + "')";
            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao gravar Categoria de Produto: " + e);
                return false;
            }
            return true;

        } else { // alteracao
            String sql = "UPDATE categoriaproduto SET "
                    + "descricaocat = '" + cp.getDescricaocat() + "'"
                    + "WHERE codcategoria = " + cp.getCodcategoria() + "";
            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao alterar Categoria de Produto: " + e);
                return false;
            }
            return true;
        }
    }

    public boolean deletar(int codcategoria) {

        String sql = " DELETE FROM categoriaproduto "
                + "WHERE codcategoria = " + codcategoria + "";

        try {
            int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao excluir Categoria de Produto: " + e);
            return false;
        }
        return true;
    }

    public ArrayList<CategoriaProduto> buscarCategoriaProdutos() {

        ArrayList<CategoriaProduto> categ = new ArrayList<>();

        String sql = "select * from categoriaproduto order by codcategoria";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                CategoriaProduto categoriaProduto = new CategoriaProduto();
                categoriaProduto.setCodcategoria(resultado.getInt("codcategoria"));
                categoriaProduto.setDescricaocat(resultado.getString("descricaocat"));

                categ.add(categoriaProduto);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar categoria de produto: " + e);
            return null;
        }
        return categ;
    }

    public ArrayList<CategoriaProduto> buscarCategoriaProdutos(String cp) {

        ArrayList<CategoriaProduto> categ = new ArrayList<>();

        String sql = "select * from categoriaproduto where descricaocat ilike '%" + cp + "%' order by descricaocat";

        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                CategoriaProduto categoriaProduto = new CategoriaProduto();
                categoriaProduto.setCodcategoria(resultado.getInt("codcategoria"));
                categoriaProduto.setDescricaocat(resultado.getString("descricaocat"));

                categ.add(categoriaProduto);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar categoria de produto: " + e);
            return null;
        }
        return categ;
    }
    
    public ArrayList<CategoriaProduto> buscarCategoriaProdutosListagem(String cep) {

        ArrayList<CategoriaProduto> categ = new ArrayList<>();

        String sql = "select * from categoriaproduto where descricaocat ilike '%" + cep + "%' order by descricaocat";

        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                CategoriaProduto categoriaProduto = new CategoriaProduto();
                categoriaProduto.setCodcategoria(resultado.getInt("codcategoria"));
                categoriaProduto.setDescricaocat(resultado.getString("descricaocat"));

                categ.add(categoriaProduto);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar categoria de produto: " + e);
            return null;
        }
        return categ;
    }

    public CategoriaProduto buscarCategoriaProduto(int codcategoria) {

        CategoriaProduto cp = new CategoriaProduto();

        String sql = "select * from categoriaproduto where codcategoria = " + codcategoria;
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                cp.setCodcategoria(resultado.getInt("codcategoria"));
                cp.setDescricaocat(resultado.getString("descricaocat"));

            }

        } catch (Exception e) {
            System.out.println("Erro ao consultar categoria de produto: " + e);
            return null;
        }
        return cp;
    }
}
