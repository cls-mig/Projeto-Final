<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    <link href="css/formulario.css" rel="stylesheet" type="text/css"/>
    <link href="css/menu.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="img/logo/logo_pagina.png"/>
</head>
<body>
    <%@include file="acessocomum.jsp"%>
    <div class="principal-menu">
        <%@include file="menu.jsp"%>
    </div>
    <form action="cadastrarlivrocodigo.jsp" method="post">
	<h3>Cadastrar livro</h3>
	<p>Título:</p>
    	<input type="text" name="titulo" required>
    	<p>Autor:</p>
    	<input type="text" name="autor" required>
        <p>Editora:</p>
    	<input type="text" name="editora" required>
        <p>Volume:</p>
    	<input type="text" name="volume">
        <p>Gênero:</p>
    	<select type="text" name="genero" required>
            <option value="Informática">Informática</option>
            <option value="Literatura">Literatura</option>
            <option value="Romance">Romance</option>
            <option value="Ação">Ação</option>
            <option value="Aventura">Aventura</option>
            <option value="Ficção">Ficção</option>
            <option value="Ficção Científica">Ficção Científica</option>
        </select>
        <p>Quantidade:</p>
        <input type="text" style="width:50%;" name="quantidade" value="0">
        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>
