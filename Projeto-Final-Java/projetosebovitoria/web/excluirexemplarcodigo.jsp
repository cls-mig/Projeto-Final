<%@ page import="dao.Dao, dao.ExemplarDao"%>
<jsp:useBean id="e" class="classes.Exemplar"></jsp:useBean>
<jsp:setProperty property="*" name="e"/>
<%@include file="acessocomum.jsp"%>

<%
    int i = ExemplarDao.excluirExemplar(e);
    if (i>0) {
        response.sendRedirect("principal.jsp");
    } else {
        response.sendRedirect("consultarexempalr.jsp");
    }
%>