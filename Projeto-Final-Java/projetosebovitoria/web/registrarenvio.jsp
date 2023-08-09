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
    <form action="registrarenviocodigo.jsp" method="post">
        <h3>Registrar envio</h3>
    	<p>Data de envio:</p>
    	<input type="date" name="dtenvio" style="width: 20%;" required>
    	<p>Código de rastreio:</p>
    	<input type="text" style="width:20%;" name="codrastreio" required>
        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>
