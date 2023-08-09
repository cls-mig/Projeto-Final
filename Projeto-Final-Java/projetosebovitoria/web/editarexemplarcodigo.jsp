<%@ page import="dao.Dao, dao.ExemplarDao"%>
<jsp:useBean id="e" class="classes.Exemplar"></jsp:useBean>
<jsp:setProperty property="*" name="e"/>
<%@include file="acessocomum.jsp"%>

<%
    int i = ExemplarDao.alterarExemplar(e);
    if (i>0) {
        response.sendRedirect("principal.jsp");
    } else {
        response.sendRedirect("consultarexemplar.jsp");        
    }
%>
