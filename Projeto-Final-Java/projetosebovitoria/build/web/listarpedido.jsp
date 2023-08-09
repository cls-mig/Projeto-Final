<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.Dao, dao.PedidoDao, classes.Pedido, java.util.*"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Cadastro</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    <link href="css/menu.css" rel="stylesheet" type="text/css"/>
    <link href="css/tabela.css" rel="stylesheet" type="text/css">
    <link rel="icon" href="img/logo/logo_pagina.png"/>
</head>
<body>
    <%@include file="acessocomum.jsp"%>
    <div class="principal-menu">
        <%@include file="menu.jsp"%>
    </div>
    <%
    	List<Pedido> list = PedidoDao.getPedido();
        request.setAttribute("list", list);
    %>
    <h1 class="title-table">Lista de pedidos:</h1>
    <table id="myTable" style="width: 60%;">
        <tr class="header">
            <th style="width:5%;">Número</th>
            <th style="width:10%;">Data</th>
            <th style="width:10%;">Qtd.</th>
            <th style="width:10%;">Valor</th>
            <th style="width:5%;"></th>
            <th style="width:5%;"></th>
        </tr>
            <c:forEach items="${list}" var="pedido">
                <tr>
                    <td style="display: none">${pedido.cliente.getId()}</td>
                    <td>${pedido.getNumero()}</td>
                    <td>${pedido.getDtpedido()}</td>
                    <td>${pedido.getQuantidade()}</td>
                    <td>${pedido.getValor()}</td>
                    <td style="white-space: nowrap;"><a href="consultaritens.jsp?id=${pedido.getNumero()}">Ver itens</a></td>
                    <td><a href="registrarenvio.jsp?id=${pedido.getNumero()}">Registrar</a></td>
                </tr>
            </c:forEach>
    </table>
</body>
</html>

