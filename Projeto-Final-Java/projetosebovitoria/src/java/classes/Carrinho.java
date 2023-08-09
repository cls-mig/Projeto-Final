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
public class Carrinho {
    private Date dtcarrinho;
    private int quantidade;
	private float valor;
	
    public Date getDtcarrinho() {
        return dtcarrinho;
    }
    public void setDtcarrinho(Date dtcarrinho) {
        this.dtcarrinho = dtcarrinho;
    }
	
    public int getQuantidade() {
        return quantidade;
    }
    public void setQuantidade(int Quantidade) {
        this.quantidade = quantidade;
    }
    public float getValor() {
        return valor;
    }
    public void setValor(float valor) {
        this.valor = valor;
    }
}
