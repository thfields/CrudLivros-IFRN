<%-- 
    Document   : menu
    Created on : 17 de out. de 2024, 15:53:20
    Author     : 20231148060031
--%>

<%@page import="data.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <%
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            Banco b = new Banco();
            
            String senhaBanco = b.getSenha(login);
            
            String tipo = b.getTipo(login);
                       
            out.print("BEM VINDO " + tipo +" "+login +"<br>");
                        
            if(senha.equals(senhaBanco)){
        %>
    <center>
        <h1><a href="consultar.jsp">CONSULTAR LIVRO</a></h1>
        <h1><a href="deletar.jsp">DELETAR LIVRO</a></h1>
        <h1><a href="cadastrar.jsp">CADASTRAR LIVRO</a></h1>
        <h1><a href="atualizar.jsp">ATUALIZAR LIVRO</a></h1>
    </center>
        <%
            }else{
                
        %>
        <h1>Usuário ou senha incorretos</h1>
        <a href="index.jsp">Clique aqui para voltar</a>
        <%
            }
        %>
    </body>
</html>
