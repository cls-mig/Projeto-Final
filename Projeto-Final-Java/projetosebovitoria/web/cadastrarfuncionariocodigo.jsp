<%@page import="dao.Dao, dao.FuncionarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="u" class="classes.Funcionario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<!-- %@include file="acessoadmin.jsp"% -->

<%
    // Estou dizendo que essa função pertence ao objeto da classe Funcionario
    int i = FuncionarioDao.cadastrarFuncionario(u);
    if (i>0) {
        response.sendRedirect("principal.jsp");
    } else {
        response.sendRedirect("cadastrarfuncionario.jsp");
    }
%>
