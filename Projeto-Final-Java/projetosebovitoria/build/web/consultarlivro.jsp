<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.Dao, dao.LivroDao, classes.Livro, java.util.*"%>

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
        List<Livro> list = LivroDao.getLivro();
        request.setAttribute("list", list);
    %>
    <h1 class="title-table">Lista de livros</h1>
    <div class="barra-consulta">
        <input class="campo-consulta" id="myInput" type="text" placeholder="Digite aqui o título do livro" onkeyup="filtro(1)">
    </div>
    <table id="myTable">
        <tr class="header">
            <th style="width:10%;">Título</th>
            <th style="width:10%;">Autor</th>
            <th style="width:10%;">Editora</th>
            <th style="width:5%;">Volume</th>
            <th style="width:10%;">Gênero</th>
            <th style="width:10%;">Editora</th>
            <th style="width:5%;">Qtd.</th>
            <th style="width:5%;"></th>
        </tr>
        <c:forEach items="${list}" var="livro">
            <tr>
                <td style="display: none;">${exemplar.getId()}</td>
                <td>${livro.getTitulo()}</td>
                <td>${livro.getAutor()}</td>
                <td>${livro.getEditora()}</td>
                <td>${livro.getVolume()}</td>
                <td>${livro.getGenero()}</td>
                <td>${livro.getEditora()}</td>
                <td>${livro.getQuantidade()}</td>
                <td><a href="editarlivro.jsp?id=${livro.getId()}">Editar</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

