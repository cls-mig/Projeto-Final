<%@ page import="dao.Dao, dao.FuncionarioDao"%>
<jsp:useBean id="u" class="classes.Funcionario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%@include file="acessoadmin.jsp"%>

<%
    int i = FuncionarioDao.excluirFuncionario(u);
    if (i>0) {
        response.sendRedirect("principal.jsp");
    } else {
        response.sendRedirect("consultarfuncionario.jsp");
    }
%>
