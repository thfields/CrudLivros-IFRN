<%-- 
    Document   : atualizar
    Created on : 30 de out. de 2024, 14:15:23
    Author     : 20231148060031
--%>

<%@page import="data.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String tituloAntigo = request.getParameter("tituloAntigo");
            String tituloNovo = request.getParameter("tituloNovo");
            String autor = request.getParameter("autor");
            String edicao = request.getParameter("edicao");
            String editora = request.getParameter("editora");
            String ano = request.getParameter("ano");
            String codigo = request.getParameter("codigo");
            String exemplares = request.getParameter("exemplares");
            
            if(tituloAntigo == null){
        %>
        <form action="atualizar.jsp" method="post">
            TITULO ANTIGO <input type="text" name="tituloAntigo"><br>
            TITULO NOVO <input type="text" name="tituloNovo"><br>
            AUTOR <input type="text" name="autor"><br>
            EDIÇÃO <input type="text" name="edicao"><br>
            EDITORA <input type="text" name="editora"><br>
            ANO <input type="text" name="ano"><br>
            CÓDIGO <input type="text" name="codigo"><br>
            EXEMPLARES <input type="text" name="exemplares"><br>
            
            <input type="submit" value="ATUALIZAR">
        </form>
        <%
            }else{
                Banco b = new Banco();
                b.putLivro(tituloAntigo, tituloNovo, autor, edicao, editora, ano, codigo, exemplares);
                out.print("LIVRO "+tituloNovo+" ATUALIZADO COM SUCESSO!");
            }
        %>
    </body>
</html>
