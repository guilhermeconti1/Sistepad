/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;


public class UsuarioSistema {

    private int idusuario;
    private String nomeusuario;
    private String login;
    private String senha;
    private boolean situacao;

    /**
     * @return the idusuario
     */
    public int getIdusuario() {
        return idusuario;
    }

    /**
     * @param idusuario the idusuario to set
     */
    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    /**
     * @return the nomeusuario
     */
    public String getNomeusuario() {
        return nomeusuario;
    }

    /**
     * @param nomeusuario the nomeusuario to set
     */
    public void setNomeusuario(String nomeusuario) {
        this.nomeusuario = nomeusuario;
    }

    /**
     * @return the login
     */
    public String getLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the situacao
     */
    public boolean isSituacao() {
        return situacao;
    }

    /**
     * @param situacao the situacao to set
     */
    public void setSituacao(boolean situacao) {
        this.situacao = situacao;
    }

}