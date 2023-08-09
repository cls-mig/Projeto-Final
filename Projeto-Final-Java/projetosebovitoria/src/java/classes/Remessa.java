/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.util.Date;

/**
 *
 * @author miguel
 */
public class Remessa {
    private Date dtenvio;
    private Date dtentrega;
    private String codrastreio;
    
    public Date getDtenvio() {
        return dtenvio;
    }
    public void setDtenvio(Date dtenvio) {
        this.dtenvio = dtenvio;
    }

    public Date getDtentega() {
        return dtentrega;
    }
    public void setDtentrega(Date dtentrega) {
        this.dtentrega = dtentrega;
    }
    
    public String getCodrastreio() {
        return codrastreio;
    }
    public void setCodrastreio(String codrastreio) {
        this.codrastreio = codrastreio;
    }
}
