<%@ page import="dao.Dao, dao.LivroDao"%>
<jsp:useBean id="l" class="classes.Livro"></jsp:useBean>
<jsp:setProperty property="*" name="l"/>
<%@include file="acessocomum.jsp"%>

<%
    int i = LivroDao.alterarLivro(l);
    if (i>0) {
        response.sendRedirect("principal.jsp");
    } else {
        response.sendRedirect("consultarlivro.jsp");        
    }
%>
