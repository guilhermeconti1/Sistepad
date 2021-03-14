/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;


public class UnidadeMedida {
 private int CodUnidadeMedida;
 private String nome;
private String status; 

    /**
     * @return the CodUnidadeMedida
     */
    public int getCodUnidadeMedida() {
        return CodUnidadeMedida;
    }

    /**
     * @param CodUnidadeMedida the CodUnidadeMedida to set
     */
    public void setCodUnidadeMedida(int CodUnidadeMedida) {
        this.CodUnidadeMedida = CodUnidadeMedida;
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
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
}
