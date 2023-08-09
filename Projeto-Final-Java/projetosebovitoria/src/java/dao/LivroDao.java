/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Livro;
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
public class LivroDao {
    public static Livro getLivroById(int id) {
        Livro livro = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from livro where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                livro = new Livro();
                livro.setId(rs.getInt("id"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livro.setEditora(rs.getString("editora"));
                livro.setVolume(rs.getString("volume"));
                livro.setGenero(rs.getString("genero"));
                livro.setQuantidade(rs.getInt("quantidade"));
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return livro;
    }
    
    public static int cadastrarLivro(Livro livro) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into livro (titulo,autor,editora,volume,genero,quantidade) values (?,?,?,?,?,?);");
            ps.setString(1, livro.getTitulo());
            ps.setString(2, livro.getAutor());
            ps.setString(3, livro.getEditora());
            ps.setString(4, livro.getVolume());
            ps.setString(5, livro.getGenero());
            ps.setInt(6, livro.getQuantidade());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }
    
    public static int alterarLivro(Livro livro){
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("update livro set titulo=?, autor=?, editora=?, volume=?, genero=?, quantidade=? where id=?");
            ps.setString(1, livro.getTitulo());
            ps.setString(2, livro.getAutor());
            ps.setString(3, livro.getEditora());
            ps.setString(4, livro.getVolume());
            ps.setString(5, livro.getGenero());
            ps.setInt(6, livro.getQuantidade());
            ps.setInt(7, livro.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }
    
    public static List<Livro> getLivro() {
	    List<Livro> list = new ArrayList<Livro>();
	    try {
	        Connection con = getConnection();
	        PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from livro");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Livro livro = new Livro();
	            livro.setId(rs.getInt("id"));
	            livro.setTitulo(rs.getString("titulo"));
	            livro.setAutor(rs.getString("autor"));
	            livro.setEditora(rs.getString("editora"));
	            livro.setVolume(rs.getString("volume"));
	            livro.setGenero(rs.getString("genero"));
                livro.setQuantidade(rs.getInt("quantidade"));
	            list.add(livro);
	        }
	    } catch (Exception erro) {
	        System.out.println(erro);
	    }
	    return list;
    }
}
