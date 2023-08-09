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
public class Teste {
    public static void main(String [] args){ 
        Funcionario funcionario = new Funcionario();
        funcionario = FuncionarioDao.logar("carlosmiguel7952@gmail.com", "administrador01");
        System.out.println(funcionario.getEmail());
    }
}
