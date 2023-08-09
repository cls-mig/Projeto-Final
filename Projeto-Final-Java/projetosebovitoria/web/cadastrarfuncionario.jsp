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
    <style>
        .tipo-usuario {
            padding-top: 5px;
            padding-bottom: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@include file="acessoadmin.jsp"%>
    <div class="principal-menu">
        <%@include file="menu.jsp"%>
    </div>
    <form action="cadastrarfuncionariocodigo.jsp" method="post">
        <h3>Cadastrar usuário</h3>
	<p>Nome:</p>
    	<input type="text" name="nome" required>
    	<p>E-mail:</p>
    	<input type="email" name="email" required>
    	<p>Senha:</p>
    	<input style="width:50%;" type="password" name="senha" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="A senha deve conter pelo menos um caracter maiúsculo, um minúsculo, um número e no mínimo oito caracteres" required>
        <div class="tipo-usuario">
            <input type="radio" name="acesso" value="comum" required><label>Comum</label>
            <input type="radio" name="acesso" value="administrador"><label>Admininistrador</label>
        </div>
        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>
