/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;


public class Produto {
  private int idproduto; 
  private int codcategoriaproduto;
  private int codunidademedida;
  private String nomeprod;
  private String descricaoprod;
  private double precoprod;
  private String dataprimeiravenda;

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
     * @return the codcategoriaproduto
     */
    public int getCodcategoriaproduto() {
        return codcategoriaproduto;
    }

    /**
     * @param codcategoriaproduto the codcategoriaproduto to set
     */
    public void setCodcategoriaproduto(int codcategoriaproduto) {
        this.codcategoriaproduto = codcategoriaproduto;
    }

    /**
     * @return the codunidademedida
     */
    public int getCodunidademedida() {
        return codunidademedida;
    }

    /**
     * @param codunidademedida the codunidademedida to set
     */
    public void setCodunidademedida(int codunidademedida) {
        this.codunidademedida = codunidademedida;
    }

    /**
     * @return the nomeprod
     */
    public String getNomeprod() {
        return nomeprod;
    }

    /**
     * @param nomeprod the nomeprod to set
     */
    public void setNomeprod(String nomeprod) {
        this.nomeprod = nomeprod;
    }

    /**
     * @return the descricaoprod
     */
    public String getDescricaoprod() {
        return descricaoprod;
    }

    /**
     * @param descricaoprod the descricaoprod to set
     */
    public void setDescricaoprod(String descricaoprod) {
        this.descricaoprod = descricaoprod;
    }

    /**
     * @return the precoprod
     */
    public double getPrecoprod() {
        return precoprod;
    }

    /**
     * @param precoprod the precoprod to set
     */
    public void setPrecoprod(double precoprod) {
        this.precoprod = precoprod;
    }

    /**
     * @return the dataprimeiravenda
     */
    public String getDataprimeiravenda() {
        return dataprimeiravenda;
    }

    /**
     * @param dataprimeiravenda the dataprimeiravenda to set
     */
    public void setDataprimeiravenda(String dataprimeiravenda) {
        this.dataprimeiravenda = dataprimeiravenda;
    }

}
