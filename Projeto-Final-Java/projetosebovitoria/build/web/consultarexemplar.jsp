<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.Dao, dao.ExemplarDao, classes.Exemplar, java.util.*"%>
<%@page import="dao.Dao, dao.LivroDao, classes.Livro, java.util.*"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Manutenção</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    <link href="css/menu.css" rel="stylesheet" type="text/css"/>
    <link href="css/tabela.css" rel="stylesheet" type="text/css">
    <script src="script/filtro.js"></script>
    <link rel="icon" href="img/logo/logo_pagina.png"/>
</head>
<body>
    <%@include file="acessocomum.jsp"%>
    <div class="principal-menu">
        <%@include file="menu.jsp"%>
    </div>
    <%
        List<Exemplar> list = ExemplarDao.getExemplar();
        request.setAttribute("list", list);
    %>
    <h1 class="title-table">Lista de exemplares</h1>
    <div class="barra-consulta">
        <input class="campo-consulta" id="myInput" type="text" placeholder="Digite aqui o título do livro" onkeyup="filtro(1)">
    </div>
    <table id="myTable">
        <tr class="header">
            <th style="width:10%;">Título</th>
            <th style="width:10%;">Autor</th>
            <th style="width:10%;">Editora</th>
            <th style="width:5%;">Volume</th>
            <th style="width:10%;">ISBN</th>
            <th style="width:10%;">Conservação</th>
            <th style="width:5%;">Páginas</th>
            <th style="width:5%;">Edição</th>
            <th style="width:10%;">Idioma</th>
            <th style="width:5%; ">Preço</th>
            <th style="width:5%;"></th>
            <th style="width:5%;"></th>
        </tr>
        <c:forEach items="${list}" var="exemplar">
            <tr>
				<td style="display: none;">${exemplar.getId()}</td>
				<td>${exemplar.livro.getTitulo()}</td>
				<td>${exemplar.livro.getAutor()}</td>
				<td>${exemplar.livro.getEditora()}</td>
				<td>${exemplar.livro.getVolume()}</td>
				<td>${exemplar.getIsbn()}</td>
				<td>${exemplar.getEstadoConservacao()}</td>
				<td>${exemplar.getPaginas()}</td>
				<td>${exemplar.getEdicao()}</td>
				<td>${exemplar.getIdioma()}</td>
				<td style="white-space: nowrap;"><label>R$ </label>${exemplar.getPreco()}</td>
                <td><a href="editarexemplar.jsp?id=${exemplar.getId()}">Editar</a></td>
				<td><a href="excluirexemplarcodigo.jsp?id=${exemplar.getId()}">Excluir</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

