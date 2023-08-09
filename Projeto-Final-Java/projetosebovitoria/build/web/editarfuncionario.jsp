<%@page import="dao.Dao, dao.FuncionarioDao, classes.Funcionario, java.util.*"%>
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
        <%
            String id = request.getParameter("id");
            Funcionario funcionario = FuncionarioDao.getFuncionarioById(Integer.parseInt(id));
        %>
        <form action="editarfuncionariocodigo.jsp?id=<%=request.getParameter("id")%>" method="post">
            <h3>Editar funcionário</h3>
            <p>Nome:</p>
            <input type="text" name="nome" value="<%=funcionario.getNome()%>" required>
            <p>E-mail:</p>
            <input type="email" name="email" value="<%=funcionario.getEmail()%>" required>
            <%if (funcionario.getAcesso().equals("administrador")) {%>
                <div class="tipo-usuario">
                    <input type="radio" name="acesso" value="Comum"><label>Comum</label>
                    <input type="radio" name="acesso" value="Administrador" required checked><label>Admininistrador</label>
                </div>
            <%} else {%>
                <div class="tipo-usuario">
                    <input type="radio" name="acesso" value="Comum" required checked><label>Comum</label>
                    <input type="radio" name="acesso" value="Administrador"><label>Admininistrador</label>
                </div>
            <%}%>
            <p>Senha:</p>
            <input type="text" name="senha" value="<%=funcionario.getSenha()%>" required>
            <input type="submit" value="Alterar">
        </form>
    </body>
</html>