/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;


public class Fornecedor {
  private int idfornecedor;
  private String  razaoSocial;
  private String pessoaResponsavel; 
  private String cnpj;
  private String email; 
  private String site;
  private String fonefornec;
    private String enderecofornec;
  private String cidade;
   private String estado;

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
     * @return the razaoSocial
     */
    public String getRazaoSocial() {
        return razaoSocial;
    }

    /**
     * @param razaoSocial the razaoSocial to set
     */
    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    /**
     * @return the pessoaResponsavel
     */
    public String getPessoaResponsavel() {
        return pessoaResponsavel;
    }

    /**
     * @param pessoaResponsavel the pessoaResponsavel to set
     */
    public void setPessoaResponsavel(String pessoaResponsavel) {
        this.pessoaResponsavel = pessoaResponsavel;
    }

    /**
     * @return the cnpj
     */
    public String getCnpj() {
        return cnpj;
    }

    /**
     * @param cnpj the cnpj to set
     */
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the site
     */
    public String getSite() {
        return site;
    }

    /**
     * @param site the site to set
     */
    public void setSite(String site) {
        this.site = site;
    }

    /**
     * @return the fonefornec
     */
    public String getFonefornec() {
        return fonefornec;
    }

    /**
     * @param fonefornec the fonefornec to set
     */
    public void setFonefornec(String fonefornec) {
        this.fonefornec = fonefornec;
    }

    /**
     * @return the enderecofornec
     */
    public String getEnderecofornec() {
        return enderecofornec;
    }

    /**
     * @param enderecofornec the enderecofornec to set
     */
    public void setEnderecofornec(String enderecofornec) {
        this.enderecofornec = enderecofornec;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
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
