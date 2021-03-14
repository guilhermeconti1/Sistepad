/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;



import negocio.Cidade;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CidadeDAOs {

    public ArrayList<Cidade> PopularCidade(String busCid) {
        ArrayList<Cidade> lista = new ArrayList<>();

        String sql = "select * from cidade where nome ilike '%" + busCid + "%' order by nome";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                Cidade Novacidade = new Cidade();
                Novacidade.setNome(resultado.getString("nome"));
                Novacidade.setEstado(resultado.getString("estado"));

                lista.add(Novacidade);
            }

            return lista;

        } catch (Exception e) {
            System.out.println("Erro ao listar cidades: " + e.toString());
            return null;
        }
    }

}

       
        
   

