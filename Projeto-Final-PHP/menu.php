<ul class="menu-principal">
    <li class="dropdown">
        <a href="index.php">Início</a>
    </li>
    <!--
    <li class="dropdown">
        <a href=#>Gêneros</a>
        <div class="dropdown-generos">
            <a href=#></a>
        </div>
    </li>
    -->
    <li class="dropdown">
        <a href="comentario.php">Contato</a>
    </li>
    <?php
        if (!isset ($_SESSION['nome'])) {
            echo "<li class='dropdown-cadastrar' style='float:right'><a href='cadastrarusuario.php'>Cadastre-se</a></li>";
        }
    ?>
    <!--
    <li class="dropdown-cadastrar" style="float:right">
        <a href="cadastrarusuario.php">Cadastre-se</a>
    </li>
    -->
</ul>
