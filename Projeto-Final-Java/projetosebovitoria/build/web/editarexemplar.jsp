<%@page import="dao.Dao, dao.ExemplarDao, classes.Exemplar, java.util.*"%>
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
            Exemplar exemplar = ExemplarDao.getExemplarById(Integer.parseInt(id));
        %>
	<form action="editarexemplarcodigo.jsp?id=<%=request.getParameter("id")%>" method="post">
            <h3>Editar exemplar</h3>
            <p>ISBN:</p>
            <input type="text" name="isbn" value="<%if (exemplar.getIsbn()==null) {%><%} else if (exemplar.getIsbn()!=null) {%><%=exemplar.getIsbn()%><%}%>">
            <p>Estado de conservação:</p>
            <!-- select não recebe o atributo value -->
            <select type="text" name="estadoConservacao" required>
		<option value="Novo" <%if (exemplar.getEstadoConservacao().equals("Novo")) {%> selected <%}%>>Novo</option>
		<option value="Bom estado" <%if (exemplar.getEstadoConservacao().equals("Bom estado")) {%> selected <%}%>>Bom estado</option>
		<option value="Desgastado" <%if (exemplar.getEstadoConservacao().equals("Desgastado")) {%> selected <%}%>>Desgastado</option>
            </select>
            <p>Número de páginas:</p>
            <input type="text" name="paginas" value="<%=exemplar.getPaginas()%>" required>
            <p>Edição:</p>
            <input type="text" name="edicao" value="<%=exemplar.getEdicao()%>" required>
            <p>Idioma:</p>
            <select type="text" name="idioma" required>
		<option value="Português" <%if (exemplar.getIdioma().equals("Português")) {%> selected <%}%>>Português</option>
            </select>
            <p>Preço:</p>
            <input type="text" style="width:50%;" name="preco" value="<%=exemplar.getPreco()%>" required>
            <input type="submit" value="Alterar">
        </form>
    </body>
</html>