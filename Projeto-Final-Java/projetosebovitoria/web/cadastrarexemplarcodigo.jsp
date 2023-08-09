<%@page import="dao.Dao, dao.ExemplarDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="e" class="classes.Exemplar"></jsp:useBean>
<jsp:setProperty property="*" name="e"/>

<%
    // Estou dizendo que essa função pertence ao objeto da classe Exemplar
    int idlivro = Integer.parseInt(request.getParameter("id"));
    int idfuncionario = Integer.parseInt(request.getSession().getAttribute("id").toString());
    
    int i = ExemplarDao.cadastrarExemplar(e, idlivro, idfuncionario);
    if (i>0) {
        response.sendRedirect("principal.jsp");
    } else {
        response.sendRedirect("listarlivro.jsp");
    }
%>

