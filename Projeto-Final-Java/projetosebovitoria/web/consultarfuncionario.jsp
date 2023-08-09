<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.Dao, dao.FuncionarioDao, classes.Funcionario, java.util.*"%>

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
    <%@include file="acessoadmin.jsp"%>
    <div class="principal-menu">
        <%@include file="menu.jsp"%>
    </div>
    <%
        List<Funcionario> list = FuncionarioDao.getFuncionario();
        request.setAttribute("list", list);
    %>
    <h1 class="title-table">Lista de funcionários</h1>
    <div class="barra-consulta">
        <input class="campo-consulta" id="myInput" type="text" placeholder="Digite aqui o nome do funcionário" onkeyup="filtro(1)">
    </div>
    <table id="myTable">
        <tr class="header">
            <th style="width:10%;">Nome</th>
            <th style="width:10%;">Email</th>
            <th style="width:10%;">Acesso</th>
            <th style="width:5%;"></th>
            <th style="width:5%;"></th>
        </tr>
        <c:forEach items="${list}" var="funcionario">
            <tr>
                <td style="display: none;">${funcionario.getId()}</td>
                <td>${funcionario.getNome()}</td>
                <td>${funcionario.getEmail()}</td>
                <td style="display: none;">${funcionario.getSenha()}</td>
                <td>${funcionario.getAcesso()}</td>
                <td><a href="editarfuncionario.jsp?id=${funcionario.getId()}">Editar</a></td>
		<td><a href="excluirfuncionariocodigo.jsp?id=${funcionario.getId()}">Excluir</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

