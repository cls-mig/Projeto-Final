<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.getSession().invalidate();
    response.sendRedirect("index.jsp");
%>
