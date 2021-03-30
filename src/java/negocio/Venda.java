/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;


public class Venda {

    private int idvenda;
    private int idproduto;
    private int idcliente;
    private double quantidadevenda;
    private double valorunit;
    private double valortotalvenda;
    private String datavenda;

    /**
     * @return the idvenda
     */
    public int getIdvenda() {
        return idvenda;
    }

    /**
     * @param idvenda the idvenda to set
     */
    public void setIdvenda(int idvenda) {
        this.idvenda = idvenda;
    }

    /**
     * @return the idproduto
     */
    public int getIdproduto() {
        return idproduto;
    }

    /**
     * @param idproduto the idproduto to set
     */
    public void setIdproduto(int idproduto) {
        this.idproduto = idproduto;
    }

    /**
     * @return the idcliente
     */
    public int getIdcliente() {
        return idcliente;
    }

    /**
     * @param idcliente the idcliente to set
     */
    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    /**
     * @return the quantidadevenda
     */
    public double getQuantidadevenda() {
        return quantidadevenda;
    }

    /**
     * @param quantidadevenda the quantidadevenda to set
     */
    public void setQuantidadevenda(double quantidadevenda) {
        this.quantidadevenda = quantidadevenda;
    }

    /**
     * @return the valorunit
     */
    public double getValorunit() {
        return valorunit;
    }

    /**
     * @param valorunit the valorunit to set
     */
    public void setValorunit(double valorunit) {
        this.valorunit = valorunit;
    }

    /**
     * @return the valortotalvenda
     */
    public double getValortotalvenda() {
        return valortotalvenda;
    }

    /**
     * @param valortotalvenda the valortotalvenda to set
     */
    public void setValortotalvenda(double valortotalvenda) {
        this.valortotalvenda = valortotalvenda;
    }

    /**
     * @return the datavenda
     */
    public String getDatavenda() {
        return datavenda;
    }

    /**
     * @param datavenda the datavenda to set
     */
    public void setDatavenda(String datavenda) {
        this.datavenda = datavenda;
    }

public double calcularValorLiquido(double percentualDesconto) {
        double valorLiquido = 0.0;

        valorLiquido = this.valortotalvenda * (1 - (percentualDesconto / 100));

        return valorLiquido;
    }
}
  

