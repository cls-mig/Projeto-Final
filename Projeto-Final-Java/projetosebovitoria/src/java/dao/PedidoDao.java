/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Cliente;
import classes.Pedido;
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
public class PedidoDao {
    public static Pedido getPedidoByNumero(int numero) {
        Pedido pedido = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from pedido where numero=?");
            ps.setInt(1, numero);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pedido = new Pedido();
                pedido.setNumero(rs.getInt("numero"));
                pedido.setDtpedido(rs.getDate("dtpedido"));
                pedido.setQuantidade(rs.getInt("quantidade"));
                pedido.setValor(rs.getFloat("valor"));
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return pedido;
    }
    
    public static List<Pedido> getPedido() {
        List<Pedido> list = new ArrayList<Pedido>();
        List<Cliente> listcliente = new ArrayList<Cliente>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from cliente");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
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
                listcliente.add(cliente);
            }
            ps = (PreparedStatement) con.prepareStatement("select * from pedido where numero not in (select numpedido from remessa) order by numero desc;");
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setNumero(rs.getInt("numero"));
                pedido.setDtpedido(rs.getDate("dtpedido"));
                pedido.setQuantidade(rs.getInt("quantidade"));
                pedido.setValor(rs.getFloat("valor"));
                for (Cliente cliente : listcliente) {
                    if (rs.getInt("idcliente")==cliente.getId()) {
                        pedido.setCliente(cliente);
                    }
                }
                list.add(pedido);
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return list;
    }
}
