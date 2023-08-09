<div class="logo-marca" style="float: left;">
    <a href="index.php?pag=1" class="logo-cabecalho">
        <img src="img/logo-marca.png">
    </a>
</div>
<div class="consultar-livros">
    <select name="filtro" class="filtrar-consulta">
        <option value='1'>Título</option>
        <option value='2'>Autor</option>
        <option value='3'>Gênero</option>
        <option value='4'>Editora</option>
    </select>
    <input class="barra-pesquisa" type="text" id="myInput" placeholder="O que você está procurando?" onkeydown="if (event.keyCode == 13) myFunction()">
    <button class="buscar" onclick="myFunction()">Buscar</button>
</div>
<div class="carrinho" style="float: right;">
    <a onclick="abrirCarrinho()" class="carrinho-compras">
        <img src="img/carrinho.png">
    </a>
</div>
<div class="perfil" style="float: right;">
    <ul class="usuario">
        <li class="perfil-usuario">
            <a>
                <img class="icone-perfil" src="img/perfil-usuario.png">
                <?php
                    // A variável $logado verifica se o usuário logou, ou não
                    if (!isset ($_SESSION['nome'])) {
                        $logado = "Olá, usuário!";
                    }
                    else {
                        $logado = "Olá, " . $_SESSION['nome'] . "!";
                    }
                    echo $logado;
                ?>
            </a>
            <div style="border-radius: 20px;" class="dropdown-usuario">
                <?php
                    // Se a sessão não foi iniciada
                    if (!isset ($_SESSION['nome'])) {
                        echo "<a style='border-radius: 20px;' href='login.php'>Entrar</a>";
                        // echo "<a class='dropdown-entrar' href='login.php'>Entrar</a>";
                    }
                ?>
                <!-- <a href="login.php">Entrar</a> -->
                <?php
                    if (isset ($_SESSION['nome'])) {
                        echo "<a style='border-top-right-radius: 20px; border-top-left-radius: 20px;' href='perfilusuario.php'>Meu perfil</a>";
                        echo "<a href='#'>Meus pedidos</a>";
                        echo "<a style='border-bottom-right-radius: 20px; border-bottom-left-radius: 20px;' href='sair.php'>Sair</a>";
                    }
                ?>
                <!-- <a href="login.php">Sair</a> -->
            </div>
        </li>
    </ul>
</div>
