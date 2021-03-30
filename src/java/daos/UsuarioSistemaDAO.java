/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.sql.ResultSet;
import negocio.UsuarioSistema;


public class UsuarioSistemaDAO {

    public UsuarioSistema autenticar(String login, String senha) {
        UsuarioSistema usuarioSistema = null;

        String sql = "select * from usuariosistema where login = '" + login + "' "
                + "and senha = '" + senha + "'";
        try {
            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            while (resultado.next()) {
                usuarioSistema = new UsuarioSistema();
                usuarioSistema.setIdusuario(resultado.getInt("idusuario"));
                usuarioSistema.setNomeusuario(resultado.getString("nomeusuario"));
                usuarioSistema.setLogin(resultado.getString("login"));
                usuarioSistema.setSituacao(resultado.getBoolean("situacao"));
          
                        
             
            }

        } catch (Exception e) {
            System.out.println("Erro ao autenticar: " + e);
        }
        return usuarioSistema;
    }

}
