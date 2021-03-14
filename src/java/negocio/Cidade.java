/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;


public class Cidade {
   private int codcidade;
    private String nome;
    private String estado;
    

    /**
     * @return the codcidade
     */
    public int getCodcidade() {
        return codcidade;
    }

    /**
     * @param codcidade the codcidade to set
     */
    public void setCodcidade(int codcidade) {
        this.codcidade = codcidade;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    
}