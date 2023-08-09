<%@page import="dao.Dao, dao.LivroDao, classes.Livro, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="css/formulario.css" rel="stylesheet" type="text/css"/>
        <link href="css/menu.css" rel="stylesheet" type="text/css"/>
        <title>Manutenção</title>
    </head>
    <body>
	<%@include file="acessocomum.jsp"%>
	<div class="principal-menu">
            <%@include file="menu.jsp"%>
	</div>
        <%
            String id = request.getParameter("id");
            Livro livro = LivroDao.getLivroById(Integer.parseInt(id));
        %>
        <form action="editarlivrocodigo.jsp?id=<%=request.getParameter("id")%>" method="post">
            <p>Título:</p>
            <input type="text" name="titulo" value="<%=livro.getTitulo()%>" required>
            <p>Autor:</p>
            <input type="text" name="autor" value="<%=livro.getAutor()%>" required>
            <p>Editora:</p>
            <input type="text" name="editora" value="<%=livro.getEditora()%>" required>
            <p>Volume:</p>
            <input type="text" name="volume"value="<%if (livro.getVolume()==null) {%><%} else if (livro.getVolume()!=null) {%><%=livro.getVolume()%><%}%>">
            <p>Gênero:</p>
            <select type="text" name="genero" required>
                <option value="Informática" <%if (livro.getGenero().equals("Informática")) {%> selected <%}%>>Informática</option>
                <option value="Literatura" <%if (livro.getGenero().equals("Literatura")) {%> selected <%}%>>Literatura</option>
                <option value="Romance" <%if (livro.getGenero().equals("Romance")) {%> selected <%}%>>Romance</option>
                <option value="Ação" <%if (livro.getGenero().equals("Ação")) {%> selected <%}%>>Ação</option>
                <option value="Aventura" <%if (livro.getGenero().equals("Aventura")) {%> selected <%}%>>Aventura</option>
                <option value="Ficção" <%if (livro.getGenero().equals("Ficção")) {%> selected <%}%>>Ficção</option>
                <option value="Ficção Científica" <%if (livro.getGenero().equals("Ficção Científica")) {%> selected <%}%>>Ficção Científica</option>
            </select>
            <p>Quantidade:</p>
            <input type="text" style="width:50%;" name="quantidade" value="<%=livro.getQuantidade()%>" readonly>
            <input type="submit" value="Alterar">
        </form>
    </body>
</html>