<%@page import="dao.Dao, dao.LivroDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="l" class="classes.Livro"></jsp:useBean>
<jsp:setProperty property="*" name="l"/>
<!-- %@include file="acessoadmin.jsp"% -->

<%
    // Estou dizendo que essa função pertence ao objeto da classe Livro
    int i = LivroDao.cadastrarLivro(l);
    if (i>0) {
        response.sendRedirect("principal.jsp");
    } else {
        response.sendRedirect("cadastrarlivro.jsp");
    }
%>
