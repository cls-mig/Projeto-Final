<ul>
    <li class="dropdown">
        <a href=#>Cadastrar</a>
        <div style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" class="dropdown-content">
            <a href="cadastrarlivro.jsp">Livro</a>
            <a href="listarlivro.jsp">Exemplar</a>
            <a style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" href="cadastrarfuncionario.jsp">Funcion�rio</a>
        </div>
    </li>
    <li class="dropdown">
        <a href=#>Manuten��o</a>
        <div style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" class="dropdown-content">
            <a href="consultarlivro.jsp">Livros</a>
            <a href="consultarexemplar.jsp">Exemplares</a>
            <a style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" href="consultarfuncionario.jsp">Funcion�rios</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="#">Remessas</a>
        <div style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" class="dropdown-content">
            <a href="listarpedido.jsp">Registrar envio</a>
            <a style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" href="registrarentrega.jsp">Registrar entrega</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="#">Relat�rios</a>
        <div style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" class="dropdown-content">
            <a href="#">Estoque</a>
            <a href="#">Vendas</a>
            <a style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" href="#">Coment�rios</a>
        </div>
    </li>
    <li class="dropdown" style="float:right">
       <a href="principal.jsp" class="dropdown-usuario">Usu�rio: <%=request.getSession().getAttribute("usuario")%></a>
       <div style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" class="dropdown-content">
           <a style="border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;" href="sair.jsp">Sair</a>
       </div>
     </li>
</ul>
