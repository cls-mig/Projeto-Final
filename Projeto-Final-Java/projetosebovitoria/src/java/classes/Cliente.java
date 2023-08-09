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
public class Cliente {
    private int id;
    private String nome;
    private Date dtnascimento;
    private String cpf;
    private String celular;
    private String logradouro;
    private int numero;
    private int cep;
    private String bairro;
    private String email;
    private String senha;
    private String status;
    private int validador;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public Date getDtnascimento() {
        return dtnascimento;
    }
    public void setDtnascimento(Date dtnascimento) {
        this.dtnascimento = dtnascimento;
    }
    
    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
	
    public String getCelular() {
        return nome;
    }
    public void setCelular(String celular) {
        this.celular = celular;
    }
	
    public String getLogradouro() {
        return logradouro;
    }
    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }
	
    public int getNumero() {
        return numero;
    }
    public void setNumero(int numero) {
        this.numero = numero;
    }
	
    public int getCep() {
        return cep;
    }
    public void setCep(int cep) {
        this.cep = cep;
    }
	
    public String getBairro() {
        return bairro;
    }
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
	
    public int getValidador() {
        return validador;
    }
    public void setValidador(int validador) {
        this.validador = validador;
    }
}
