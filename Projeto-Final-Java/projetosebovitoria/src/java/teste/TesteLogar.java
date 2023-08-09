/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package teste;

import classes.Funcionario;
import dao.FuncionarioDao;

/**
 *
 * @author miguel
 */
public class TesteLogar {
    public static void main(String[] args) {
        String email = "carlosmiguel7952@gmail.com";
        String senha = "administrador01";
        Funcionario funcionario = FuncionarioDao.logar(email, senha);
        if (funcionario != null) {
            System.out.println("Usuário encontrado: " + funcionario.getNome());
        } else {
            System.out.println("Usuário não encontrado");
        }
    }
}
