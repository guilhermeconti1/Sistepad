/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Statement;
import javax.swing.ImageIcon;
import javax.swing.table.DefaultTableModel;
import negocio.UnidadeMedida;
import javax.swing.table.TableColumn;
import negocio.Arquivo;



public class UnidadeMedidaDAOs {

    ResultSet resultadoQ;

    public boolean gravar(UnidadeMedida um) {

        if (um.getCodUnidadeMedida() == 0) { // insercao

            String sql = "INSERT INTO unidademedida VALUES"
                    + " (DEFAULT, "
                    + "'" + um.getNome() + "',"
                    + "'" + um.getStatus() + "')";

            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao gravar Unidade de Medida: " + e);
                return false;
            }
            return true;

        } else { // alteracao
            String sql = "UPDATE unidademedida SET "
                    + "nomeunidade = '" + um.getNome() + "',"
                    + "statusunidade = '" + um.getStatus() + "'"
                    + "WHERE codunidademedida = " + um.getCodUnidadeMedida() + "";
            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao alterar Unidade de Medida: " + e);
                return false;
            }
            return true;
        }
    }

    public boolean deletar(int codunidademedida) {

        String sql = " DELETE FROM unidademedida "
                + "WHERE codunidademedida = " + codunidademedida + "";

        try {
            int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao excluir Unidade Medida: " + e);
            return false;
        }
        return true;
    }

    public ArrayList<UnidadeMedida> buscarUnidadeMedida() {

        ArrayList<UnidadeMedida> unid = new ArrayList<>();

        String sql = "select * from unidademedida order by codunidademedida";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                UnidadeMedida unidadeMedida = new UnidadeMedida();
                unidadeMedida.setCodUnidadeMedida(resultado.getInt("codunidademedida"));
                unidadeMedida.setNome(resultado.getString("nomeunidade"));
                unidadeMedida.setStatus(resultado.getString("statusunidade"));

                unid.add(unidadeMedida);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Unidade de Medida: " + e);
            return null;
        }
        return unid;
    }

    public ArrayList<UnidadeMedida> buscarUnidadeMedidaModal(String um) {

        ArrayList<UnidadeMedida> unid = new ArrayList<>();

        String sql = "select * from unidademedida where statusunidade ilike 'Ativo' and nomeunidade ilike '%" + um + "%' order by nomeunidade";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                UnidadeMedida unidadeMedida = new UnidadeMedida();
                unidadeMedida.setCodUnidadeMedida(resultado.getInt("codunidademedida"));
                unidadeMedida.setNome(resultado.getString("nomeunidade"));
                //unidadeMedida.setStatus(resultado.getString("statusunidade"));

                unid.add(unidadeMedida);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Unidade de Medida: " + e);
            return null;
        }
        return unid;
    }

    public ArrayList<UnidadeMedida> buscarUnidadeMedidaListagem(String um) {

        ArrayList<UnidadeMedida> unid = new ArrayList<>();

        String sql = "select * from unidademedida where  nomeunidade ilike '%" + um + "%' order by nomeunidade";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                UnidadeMedida unidadeMedida = new UnidadeMedida();
                unidadeMedida.setCodUnidadeMedida(resultado.getInt("codunidademedida"));
                unidadeMedida.setNome(resultado.getString("nomeunidade"));
                unidadeMedida.setStatus(resultado.getString("statusunidade"));

                unid.add(unidadeMedida);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Unidade de Medida: " + e);
            return null;
        }
        return unid;
    }

    public UnidadeMedida buscarUnidadeMedida(int codunidademedida) {

        UnidadeMedida um = new UnidadeMedida();

        String sql = "select * from unidademedida where codunidademedida = " + codunidademedida;
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                um.setCodUnidadeMedida(resultado.getInt("codunidademedida"));
                um.setNome(resultado.getString("nomeunidade"));
                um.setStatus(resultado.getString("statusunidade"));

            }

        } catch (Exception e) {
            System.out.println("Erro ao consultar unidade de medida: " + e);
            return null;
        }
        return um;
    }

   public void gerarCSV() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação de aplicações\\Final\\Locadora\\Locadoraaa\\Reports\\FilmesAtraso.jrxml");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM cliente ORDER BY idcliente"; 
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = 
                            rs.getString("nomecli");
                            
                        

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
}
