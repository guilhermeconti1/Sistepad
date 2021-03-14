/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;
import negocio.Arquivo;
import controle.Formatacao;
import negocio.Venda;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.ImageIcon;
import negocio.Produto;


public class VendaDAOs {

    ResultSet resultadoQ;

    public boolean salvar(Venda v, String validacao) {
        if (validacao.equals("S")) { // insercao
            String sql = "INSERT INTO venda VALUES"
                    + "('" + v.getIdvenda() + "',"
                    + "'" + v.getIdproduto() + "',"
                    + "'" + v.getIdcliente() + "',"
                    + "'" + v.getQuantidadevenda() + "',"
                    + "'" + v.getValorunit() + "',"
                    + "'" + v.getValortotalvenda() + "',"
                    + "'" + v.getDatavenda() + "')";
            System.out.println(sql);
            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao gravar Venda: " + e);
                return false;
            }
            return true;
        } else { // alteracao
            String sql = " UPDATE venda SET "
                    + "idvenda='" + v.getIdvenda() + "',"
                    + "idproduto='" + v.getIdproduto() + "',"
                    + "idcliente='" + v.getIdcliente() + "',"
                    + "quantidadevenda='" + v.getQuantidadevenda() + "',"
                    + "valorunit='" + v.getValorunit() + "',"
                    + "valortotalvenda='" + v.getValortotalvenda() + "',"
                    + "datavenda='" + v.getDatavenda() + "'"
                    + "WHERE idvenda = " + v.getIdvenda() + "and idproduto =" + v.getIdproduto() + "";

            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao alterar pvenda: " + e);
                return false;
            }
            return true;
        }
    }

    public boolean deletar(int idvenda, int idproduto) {

        String sql = " DELETE FROM venda "
                + "WHERE idvenda = " + idvenda + " and idproduto = " + idproduto + "";

        System.out.println(sql);
        try {
            int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao excluir venda: " + e);
            return false;
        }
        return true;
    }

    public ArrayList<Venda> buscarVenda(String v) {

        ArrayList<Venda> vendas = new ArrayList<>();

        String sql = "select * from venda where " + v + "  order by idvenda";

        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Venda venda = new Venda();
                venda.setIdvenda(resultado.getInt("idvenda"));
                venda.setIdproduto(resultado.getInt("idproduto"));
                venda.setIdcliente(resultado.getInt("idcliente"));
                venda.setQuantidadevenda(resultado.getDouble("quantidadevenda"));
                venda.setValorunit(resultado.getDouble("valorunit"));
                venda.setValortotalvenda(resultado.getDouble("valortotalvenda"));
                venda.setDatavenda(Formatacao.ajustaDataDMA(resultado.getString("datavenda")));

                vendas.add(venda);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar vendas: " + e);
            return null;
        }
        return vendas;
    }
    
    public ArrayList<Venda> buscarVendaModallistagem(String filtro) {

        ArrayList<Venda> listvenda = new ArrayList<>();
        
        String sql = "";
            
        if (filtro.equals("")) {
            sql = "select v.*, c.nomecli from venda v, cliente c where c.idcliente = v.idcliente order by v.idvenda";
        } else {
            sql = "select v.*, c.nomecli from venda v, cliente c where c.idcliente = v.idcliente " + filtro + " order by v.idvenda";
        }
        
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                //referencia nomes do banco
                Venda venda = new Venda();
                venda.setDatavenda(Formatacao.ajustaDataDMA(resultado.getString("datavenda")));
                venda.setIdcliente(resultado.getInt("idcliente"));
                venda.setIdproduto(resultado.getInt("idproduto"));
                venda.setIdvenda(resultado.getInt("idvenda"));
                venda.setQuantidadevenda(resultado.getDouble("quantidadevenda"));
                venda.setValortotalvenda((resultado.getDouble("valortotalvenda")));
                venda.setValorunit(resultado.getDouble("valorunit"));
                
                listvenda.add(venda);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar Produto: " + e);
            return null;
        }
        return listvenda;
    }

    public Venda buscaVenda(int idvenda, int idproduto) {

        Venda venda = new Venda();

        String sql = "select * from venda where idvenda = " + idvenda + " and idproduto = " + idproduto + "";

        System.out.println(sql);
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                venda.setIdvenda(resultado.getInt("idvenda"));
                venda.setIdproduto(resultado.getInt("idproduto"));
                venda.setIdcliente(resultado.getInt("idcliente"));
                venda.setQuantidadevenda(resultado.getDouble("quantidadevenda"));
                venda.setValorunit(resultado.getDouble("valorunit"));
                venda.setValortotalvenda(resultado.getDouble("valortotalvenda"));
                venda.setDatavenda(resultado.getString("datavenda"));

            }

        } catch (Exception e) {
            System.out.println("Erro ao consultar venda: " + e);
            return null;
        }
        return venda;
    }
     public void gerarCSV() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\vendas.csv");

        
        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM venda ORDER BY idvenda";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getInt("idvenda") + ";"
                            + rs.getInt("idproduto") + ";"
                            + rs.getInt("idcliente") + ";"
                                 + rs.getInt("quantidadevenda") + ";"
                             + rs.getInt("valorunit") + ";"
                             + rs.getInt("valortotalvenda") + ";"
                            + rs.getString("datavenda");

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
}
