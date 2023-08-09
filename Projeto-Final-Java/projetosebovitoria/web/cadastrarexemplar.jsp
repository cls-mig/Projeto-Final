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
    <form action="cadastrarexemplarcodigo.jsp?id=<%=request.getParameter("id")%>" method="post">
	<h3>Cadastrar exemplar</h3>
	<p>ISBN:</p>
    	<input type="text" name="isbn">
    	<p>Estado de conservação:</p>
        <select type="text" name="estadoConservacao" required>
            <option value="Novo">Novo</option>
            <option value="Bom estado">Bom estado</option>
            <option value="Desgastado">Desgastado</option>
        </select>
        <p>Número de páginas:</p>
    	<input type="text" name="paginas" required>
        <p>Edição:</p>
    	<input type="text" name="edicao" required>
        <p>Idioma:</p>
    	<select type="text" name="idioma" required>
            <option value="Português">Português</option>
        </select>
        <p>Preço:</p>
        <input type="text" style="width:50%;" name="preco" required>
        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>
