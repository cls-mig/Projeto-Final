/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import classes.Funcionario;
import static dao.Dao.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author miguel
 */
public class FuncionarioDao {
    public static Funcionario getFuncionarioById(int id) {
        Funcionario funcionario = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from funcionario where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                funcionario = new Funcionario();
                funcionario.setId(rs.getInt("id"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setAcesso(rs.getString("acesso"));
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return funcionario;
    }
    
    public static Funcionario logar(String email, String senha) {
        Funcionario funcionario = new Funcionario();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from funcionario where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            // Verifica se a consulta retornou resultado
            if (rs.next()) {
                // System.out.println("Usuário encontrado: " + rs.getString("nome"));
                if(rs.getString("senha").equals(senha)) {
                    funcionario.setId(rs.getInt("id"));
                    funcionario.setNome(rs.getString("nome"));
                    funcionario.setEmail(rs.getString("email"));
                    funcionario.setSenha(rs.getString("senha"));
                    funcionario.setAcesso(rs.getString("acesso"));
                } else {
                    // Senha errada
                    // System.out.println("Usuário não encontrado");
                    funcionario = null;
                }
            } else {
                // E-mail não existe
                funcionario = null;
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return funcionario;
    }
    
    public static int cadastrarFuncionario(Funcionario funcionario) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into funcionario (nome,email,senha,acesso) values (?,?,?,?)");
            ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getEmail());
            ps.setString(3, funcionario.getSenha());
            ps.setString(4, funcionario.getAcesso());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }
    
    public static int alterarFuncionario(Funcionario funcionario){
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("update funcionario set nome=?, email=?, acesso=? where id=?");
            ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getEmail());
            ps.setString(3, funcionario.getAcesso());
            ps.setInt(4, funcionario.getId());  
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static int excluirFuncionario(Funcionario funcionario) {
    	int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("delete from funcionario where id=?");
            ps.setInt(1, funcionario.getId());
            // ps.setInt(1, funcionario.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static List<Funcionario> getFuncionario() {
        List<Funcionario> list = new ArrayList<Funcionario>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from funcionario");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setId(rs.getInt("id"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setAcesso(rs.getString("acesso"));
                list.add(funcionario);
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return list;
    }
}
