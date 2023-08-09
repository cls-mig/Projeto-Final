/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Cliente;
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
public class ClienteDao {
    public static Cliente getClienteById(int id) {
    Cliente cliente = null;
    try {
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from cliente where id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            cliente = new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setNome(rs.getString("nome"));
            cliente.setDtnascimento(rs.getDate("dtnascimento"));
            cliente.setCpf(rs.getString("cpf"));
            cliente.setCelular(rs.getString("celular"));
            cliente.setLogradouro(rs.getString("logradouro"));
            cliente.setNumero(rs.getInt("numero"));
            cliente.setCep(rs.getInt("cep"));
            cliente.setBairro(rs.getString("bairro"));
            cliente.setEmail(rs.getString("email"));
            cliente.setSenha(rs.getString("senha"));
            cliente.setStatus(rs.getString("status"));
            cliente.setValidador(rs.getInt("validador"));
        }
    } catch (Exception erro) {
        System.out.println(erro);
    }
    return cliente;
    }
}
