/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import classes.Exemplar;
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

public class ExemplarDao {
    public static Exemplar getExemplarById(int id) {
    Exemplar exemplar = null;
    try {
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from exemplar where id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            exemplar = new Exemplar();
            exemplar.setId(rs.getInt("id"));
            exemplar.setIsbn(rs.getString("isbn"));
            exemplar.setEstadoConservacao(rs.getString("estadoconservacao"));
            exemplar.setPaginas(rs.getInt("paginas"));
            exemplar.setEdicao(rs.getInt("edicao"));
            exemplar.setIdioma(rs.getString("idioma"));
            exemplar.setPreco(rs.getFloat("preco"));
            exemplar.setPreco(rs.getFloat("preco"));
        }
    } catch (Exception erro) {
        System.out.println(erro);
    }
    return exemplar;
    }
    
    public static int cadastrarExemplar(Exemplar exemplar, int idlivro, int idfuncionario) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into exemplar (idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (?,?,?,?,?,?,?,?,1);");
            ps.setInt(1, idlivro);
            ps.setInt(2, idfuncionario);
            ps.setString(3, exemplar.getIsbn());
            ps.setString(4, exemplar.getEstadoConservacao());
            ps.setInt(5, exemplar.getPaginas());
            ps.setInt(6, exemplar.getEdicao());
            ps.setString(7, exemplar.getIdioma());
            ps.setFloat(8, exemplar.getPreco());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static int alterarExemplar(Exemplar exemplar){
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("update exemplar set isbn=?, estadoconservacao=?, paginas=?, edicao=?, idioma=?, preco=? where id=?");
            ps.setString(1, exemplar.getIsbn());
            ps.setString(2, exemplar.getEstadoConservacao());
            ps.setInt(3, exemplar.getPaginas());
            ps.setInt(4, exemplar.getEdicao());
            ps.setString(5, exemplar.getIdioma());
            ps.setFloat(6, exemplar.getPreco());
            ps.setInt(7, exemplar.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static int excluirExemplar(Exemplar exemplar) {
    	int status = 0;
      try {
           Connection con = getConnection();
           PreparedStatement ps = (PreparedStatement) con.prepareStatement("delete from exemplar where id=? and status=1");
           ps.setInt(1, exemplar.getId());
           status = ps.executeUpdate();
      } catch (Exception erro) {
           System.out.println(erro);
      }
      return status;
    }
    
    public static List<Exemplar> getExemplar() { 
        List<Exemplar> list = new ArrayList<Exemplar>();
        List<Livro> listlivro = new ArrayList<Livro>();
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
		        listlivro.add(livro);
            }
            ps = (PreparedStatement) con.prepareStatement("select * from exemplar where status=1 order by id desc");
            rs = ps.executeQuery();
            while (rs.next()) {
                Exemplar exemplar = new Exemplar();
                exemplar.setId(rs.getInt("id"));
                exemplar.setIsbn(rs.getString("isbn"));
                exemplar.setEstadoConservacao(rs.getString("estadoconservacao"));
                exemplar.setPaginas(rs.getInt("paginas"));
                exemplar.setEdicao(rs.getInt("edicao"));
                exemplar.setIdioma(rs.getString("idioma"));
                exemplar.setPreco(rs.getFloat("preco"));
		        for (Livro livro : listlivro) {
                    if (rs.getInt("idlivro")==livro.getId()) {
                        exemplar.setLivro(livro);
                    }
                }
                list.add(exemplar);
            }
        } catch(Exception erro) {
            System.out.println(erro);
        }
        return list;
    }
}
