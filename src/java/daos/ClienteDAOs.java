/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import negocio.Cliente;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.ImageIcon;
import negocio.Arquivo;


public class ClienteDAOs {

    ResultSet resultadoQ;

    public boolean salvar(Cliente cli) {
        if (cli.getIdcliente() == 0) {

            String sql = "INSERT INTO cliente VALUES"
                    + " (DEFAULT, "
                    + "'" + cli.getNomecli() + "',"
                    + "'" + cli.getSexo() + "',"
                    + "'" + cli.getIdade() + "',"
                    + "'" + cli.getCelular() + "',"
                    + "'" + cli.getCpf() + "',"
                    + "'" + cli.getEnderecocli() + "',"
                    + "'" + cli.getCidade() + "',"
                    + "'" + cli.getEstado() + "')";

            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao gravar cliente: " + e);
                return false;
            }
            return true;

        } else { // alteracao
            String sql = "UPDATE cliente SET "
                    + "nomecli='" + cli.getNomecli() + "',"
                    + "sexo='" + cli.getSexo() + "',"
                    + "idade='" + cli.getIdade() + "',"
                    + "celular='" + cli.getCelular() + "',"
                    + "cpf='" + cli.getCpf() + "',"
                    + "enderecocli='" + cli.getEnderecocli() + "',"
                    + "cidade='" + cli.getCidade() + "',"
                    + "estado='" + cli.getEstado() + "'"
                    + "WHERE idcliente = " + cli.getIdcliente() + "";
            try {
                int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

            } catch (Exception e) {
                System.out.println("Erro ao alterar cliente: " + e);
                return false;
            }
            return true;
        }
    }

    public boolean deletar(int idcliente) {

        String sql = " DELETE FROM cliente "
                + "WHERE idcliente = " + idcliente + "";

        try {
            int resultado = ConexaoBD.getInstance().getConnection().createStatement().executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao excluir cliente: " + e);
            return false;
        }
        return true;
    }

    public ArrayList<Cliente> buscarCliente() {

        ArrayList<Cliente> clientes = new ArrayList<>();

        String sql = "select * from cliente order by idcliente";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdcliente(resultado.getInt("idcliente"));
                cliente.setNomecli(resultado.getString("nomecli"));
                cliente.setSexo(resultado.getString("sexo"));
                cliente.setIdade(resultado.getInt("idade"));
                cliente.setCelular(resultado.getString("celular"));
                cliente.setCpf(resultado.getString("cpf"));
                cliente.setEnderecocli(resultado.getString("enderecocli"));
                cliente.setCidade(resultado.getString("cidade"));
                cliente.setEstado(resultado.getString("estado"));

                clientes.add(cliente);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar clientes: " + e);
            return null;
        }
        return clientes;
    }

    public ArrayList<Cliente> buscarClienteModal(String cli) {

        ArrayList<Cliente> clientes = new ArrayList<>();

        String sql = "select * from cliente where nomecli ilike '%" + cli + "%' order by nomecli";

        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdcliente(resultado.getInt("idcliente"));
                cliente.setNomecli(resultado.getString("nomecli"));
                cliente.setCelular(resultado.getString("celular"));
                cliente.setCpf(resultado.getString("cpf"));
                cliente.setEnderecocli(resultado.getString("enderecocli"));
                cliente.setCidade(resultado.getString("cidade"));
                cliente.setEstado(resultado.getString("estado"));

                clientes.add(cliente);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar clientes: " + e);
            return null;
        }
        return clientes;
    }

    public ArrayList<Cliente> buscarClienteModallistagem(String cli) {

        ArrayList<Cliente> clientes = new ArrayList<>();

        String sql = "select * from cliente where " + cli + " order by nomecli";

        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdcliente(resultado.getInt("idcliente"));
                cliente.setNomecli(resultado.getString("nomecli"));
                cliente.setSexo(resultado.getString("sexo"));
                cliente.setIdade(resultado.getInt("idade"));
                cliente.setCelular(resultado.getString("celular"));
                cliente.setCpf(resultado.getString("cpf"));
                cliente.setEnderecocli(resultado.getString("enderecocli"));
                cliente.setCidade(resultado.getString("cidade"));
                cliente.setEstado(resultado.getString("estado"));

                clientes.add(cliente);
            }

        } catch (Exception e) {
            System.out.println("Erro ao listar clientes: " + e);
            return null;
        }
        return clientes;
    }

    public Cliente buscarCliente(int idcliente) {

        Cliente cliente = new Cliente();

        String sql = "select * from cliente where idcliente = " + idcliente;
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                cliente.setIdcliente(resultado.getInt("idcliente"));
                cliente.setNomecli(resultado.getString("nomecli"));
                cliente.setSexo(resultado.getString("sexo"));
                cliente.setIdade(resultado.getInt("idade"));
                cliente.setCelular(resultado.getString("celular"));
                cliente.setCpf(resultado.getString("cpf"));
                cliente.setEnderecocli(resultado.getString("enderecocli"));
                cliente.setCidade(resultado.getString("cidade"));
                cliente.setEstado(resultado.getString("estado"));
            }

        } catch (Exception e) {
            System.out.println("Erro ao consultar cliente: " + e);
            return null;
        }
        return cliente;
    }

    public void gerarCSV() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\clientes.csv");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM cliente ORDER BY nomecli";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getInt("idcliente") + ";"
                            + rs.getString("nomecli") + ";"
                            + rs.getString("sexo") + ";"
                            + rs.getInt("idade") + ";"
                            + rs.getString("celular") + ";"
                            + rs.getString("cpf") + ";"
                            + rs.getString("enderecocli") + ";"
                            + rs.getString("cidade") + ";"
                            + rs.getString("estado");

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
      public void gerarCSVNome() {
        Arquivo arquivo = new Arquivo("C:\\Users\\Geral\\FACULDADE\\Programação Internet\\FINAL\\Sistepad\\web\\arquivos csv\\clientesnome.csv");

        String saida = "";

        if (arquivo.abrirEscrita(false)) {
            try {
                String sql = "SELECT * FROM cliente ORDER BY nomecli";
                ResultSet rs = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

                while (rs.next()) {
                    saida = rs.getString("nomecli");
                       

                    arquivo.escreverLinha(saida);
                }

            } catch (Exception e) {
                System.out.println("erro em gerar arquivo: " + e);
            }
        }
        arquivo.fecharArquivo();
    }
}
