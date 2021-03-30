/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;


public class Estoque {

    private int idestoque;
    private int idfornecedor;
    private String nomesuprimento;
    private double precoestoque;
    private String validade;
    private int quantidadeestoque;

    /**
     * @return the idestoque
     */
    public int getIdestoque() {
        return idestoque;
    }

    /**
     * @param idestoque the idestoque to set
     */
    public void setIdestoque(int idestoque) {
        this.idestoque = idestoque;
    }

    /**
     * @return the idfornecedor
     */
    public int getIdfornecedor() {
        return idfornecedor;
    }

    /**
     * @param idfornecedor the idfornecedor to set
     */
    public void setIdfornecedor(int idfornecedor) {
        this.idfornecedor = idfornecedor;
    }

    /**
     * @return the nomesuprimento
     */
    public String getNomesuprimento() {
        return nomesuprimento;
    }

    /**
     * @param nomesuprimento the nomesuprimento to set
     */
    public void setNomesuprimento(String nomesuprimento) {
        this.nomesuprimento = nomesuprimento;
    }

    /**
     * @return the precoestoque
     */
    public double getPrecoestoque() {
        return precoestoque;
    }

    /**
     * @param precoestoque the precoestoque to set
     */
    public void setPrecoestoque(double precoestoque) {
        this.precoestoque = precoestoque;
    }

    /**
     * @return the validade
     */
    public String getValidade() {
        return validade;
    }

    /**
     * @param validade the validade to set
     */
    public void setValidade(String validade) {
        this.validade = validade;
    }

    /**
     * @return the quantidadeestoque
     */
    public int getQuantidadeestoque() {
        return quantidadeestoque;
    }

    /**
     * @param quantidadeestoque the quantidadeestoque to set
     */
    public void setQuantidadeestoque(int quantidadeestoque) {
        this.quantidadeestoque = quantidadeestoque;
    }
}
