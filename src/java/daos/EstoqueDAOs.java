/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import controle.Formatacao;
import negocio.Estoque;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.ImageIcon;
import negocio.Arquivo;


public class EstoqueDAOs {

    ResultSet resultadoQ;

    public boolean salvar(Estoque est) {
        if (est.getIdestoque() == 0) {

            String sql = "INSERT INTO estoque VALUES"
                    + " (DEFAULT, "
                    + "'" + est.getIdfornecedor() + "',"
                    + "'" + est.getNomesuprimento() + "',"
                    + "'" + est.getPrecoestoque() + "',"
                    + "'" + est.getValidade() + "',"
                    + "'" + est.getQuantidadeestoque() + "')";

            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao gravar Suprimento no estoque: " + e);
                return false;
            }
            return true;

        } else { // alteracao no DAOS sempre os campos do banco de dados eu trabalho
            String sql = "UPDATE estoque SET "
                    + "idfornecedor='" + est.getIdfornecedor() + "',"
                    + "nomesuprimento='" + est.getNomesuprimento() + "',"
                    + "precoestoque='" + est.getPrecoestoque() + "',"
                    + "validade='" + est.getValidade() + "',"
                    + "quantidadeestoque='" + est.getQuantidadeestoque() + "'"
                    + "WHERE idestoque = " + est.getIdestoque() + "";

            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao alterar Suprimento do estoque: " + e);
                return false;
            }
            return true;
        }
    }

    public boolean deletar(int idestoque) {

        String sql = " DELETE FROM estoque "
                + "WHERE idestoque = " + idestoque + "";

        try {
            int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao excluir Suprimento do estoque: " + e);
            return false;
        }
        return true;
    }

    public ArrayList<Estoque> buscarEstoque() {

        ArrayList<Estoque> estoques = new ArrayList<>();

        String sql = "select * from estoque order by idestoque";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Estoque estoque = new Estoque();
                estoque.setIdestoque(resultado.getInt("idestoque"));
                estoque.setIdfornecedor(resultado.getInt("idfornecedor"));
                estoque.setNomesuprimento(resultado.getString("nomesuprimento"));
                estoque.setPrecoestoque(resultado.getDouble("precoestoque"));
                estoque.setValidade(Formatacao.ajustaDataDMA(resultado.getString("validade")));
                estoque.setQuantidadeestoque(resultado.getInt("quantidadeestoque"));

                estoques.add(estoque);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Suprimento do estoque: " + e);
            return null;
        }
        return estoques;
    }

    public Estoque buscarEstoque(int idestoque) {

        Estoque estoque = new Estoque();

        String sql = "select * from estoque where idestoque = " + idestoque + " ORDER BY idestoque";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                estoque.setIdestoque(resultado.getInt("idestoque"));
                estoque.setIdfornecedor(resultado.getInt("idfornecedor"));
                estoque.setNomesuprimento(resultado.getString("nomesuprimento"));
                estoque.setPrecoestoque(resultado.getDouble("precoestoque"));
                estoque.setValidade(Formatacao.ajustaDataDMA(resultado.getString("validade")));
                estoque.setQuantidadeestoque(resultado.getInt("quantidadeestoque"));

            }

        } catch (Exception e) {
            System.out.println("Erro ao consultar Suprimento do estoque: " + e);
            return null;
        }
        return estoque;
    }

    public ArrayList<Estoque> buscarEstoqueModal(String estq) {

        ArrayList<Estoque> est = new ArrayList<>();

        String sql = "select * from estoque where  nomesuprimento ilike '%" + estq + "%' order by nomesuprimento";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Estoque esto = new Estoque();
                esto.setIdestoque(resultado.getInt("idestoque"));
                esto.setIdfornecedor(resultado.getInt("idfornecedor"));
                esto.setNomesuprimento(resultado.getString("nomesuprimento"));
                esto.setPrecoestoque(resultado.getDouble("precoestoque"));
                esto.setValidade(Formatacao.ajustaDataDMA(resultado.getString("validade")));
                esto.setQuantidadeestoque(resultado.getInt("quantidadeestoque"));

                est.add(esto);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Estoque: " + e);
            return null;
        }
        return est;
    }

    public void gerarCSV() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\estoque.csv");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM estoque ORDER BY nomesuprimento";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getInt("idestoque") + ";"
                            + rs.getInt("idfornecedor") + ";"
                            + rs.getInt("nomesuprimento") + ";"
                            + rs.getInt("precoestoque") + ";"
                            + rs.getInt("validade") + ";"
                            + rs.getString("quantidadeestoque");

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }

}
