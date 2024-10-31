/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author 20231148060031
 */
public class Banco {
    private Statement stmt;
    private ResultSet rs;
    public Connection conn;
    private static Banco b = new Banco();
    
    public Banco(){
        String url = "jdbc:mysql://tsi-04.cp0q4gi88lut.us-east-2.rds.amazonaws.com:3306/biblioteca";
        String usr = "root";
        String pas = "ifrn$2024";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url,usr,pas);
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
        }catch(Exception e){
            System.out.println("Erro" + e.getMessage());
        }
    }
    
    public String getTipo(String login) throws SQLException{
        String tipo = "";
        
        rs = stmt.executeQuery("SELECT tipo FROM usuario WHERE login = '"+login+"'");
        
        while(rs.next()){
            tipo = rs.getString("tipo");
        }
        
        return tipo;
    }
    
    public String getLivros(String titulo) throws SQLException{
        String titulos = "";
        
        rs = stmt.executeQuery("SELECT * FROM livros WHERE titulo like '%"+titulo+"%'");
        
        while(rs.next()){
            titulos += rs.getString("titulo") +"<br>";
        }
        
        return titulos;
    }
    
    public String getSenha(String login) throws SQLException{
        String senha = "";
        
        rs = stmt.executeQuery("SELECT senha FROM usuario WHERE login = '"+login+"'");
        
        while(rs.next()){
            senha = rs.getString("senha");
        }
        
        return senha;
    }
    
    public void deleteLivro(String titulo) throws SQLException{
       stmt.executeUpdate("DELETE FROM livros WHERE titulo = '"+titulo+"'");
    }
    
    public void postLivro(String id,String titulo,String autor,String edicao,String editora,String ano,String codigo,String exemplares) throws SQLException{
       stmt.executeUpdate("INSERT INTO livros VALUES ('"+id+"','"+titulo+"','"+autor+"','"+edicao+"','"+editora+"','"+ano+"','"+codigo+"','"+exemplares+"')");
    }
    
    public void putLivro(String tituloAntigo,String tituloNovo,String autor,String edicao,String editora,String ano,String codigo,String exemplares) throws SQLException{
       stmt.executeUpdate("UPDATE livros SET "
               + "titulo='"+tituloNovo+"',autor='"+autor+"',edicao='"+edicao+"',editora='"+editora+"',ano='"+ano+"',codigo='"+codigo+"',exemplares='"+exemplares+"' WHERE titulo = '"+tituloAntigo+"'");
    }
    
}
