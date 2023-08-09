<%@page import="classes.Funcionario"%>
<%@page import="dao.Dao, dao.FuncionarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Lê valores do formulário
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    // Envia os valores para o Dao e recebe o resultado da consulta
    Funcionario funcionario = FuncionarioDao.logar(email, senha);
    System.out.println("Funcionario: " + funcionario);
    
    // Verifica se algum usuário foi encontrado
    if (funcionario!=null) {
        // Cria sessão e redireciona para a tela principal
        request.getSession().setAttribute("id", funcionario.getId());
        request.getSession().setAttribute("usuario", funcionario.getNome());
        request.getSession().setAttribute("acesso", funcionario.getAcesso());
        
        response.sendRedirect("principal.jsp");
    // Redireciona erros para a tela de login
    } else {
        response.sendRedirect("index.jsp");
    }
%>
