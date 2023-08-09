<?php
    session_start();
    
    // Verifica se o usuário logou no sistema
    if (isset($_SESSION['id'])) {
?>
    <html>
    <head>
        <title>Meu perfil</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/formulario.css">
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/cabecalho.css">
        <link rel="icon" href="img/logo-pagina.png"/>
        <script src="script/carrinho.js"></script>
    </head>
    <body>
        <div class="principal-cabecalho">
            <?php
                // Inclui o cabeçalho que está no arquivo
                include 'cabecalho.php';
            ?>
        </div>
        <div class="principal-menu">
            <?php
                // Inclui o menu que está no arquivo
                include 'menu.php';
            ?>
        </div>
    </body>
    </html>
<?php
    } else {
?>
    <html>
    <head>
        <title>Meu perfil</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/formulario.css">
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/cabecalho.css">
        <link rel="icon" href="img/logo-pagina.png"/>
        <script src="script/carrinho.js"></script>
    </head>
    <body>
        <div class="principal-cabecalho">
            <?php
                // Inclui o cabeçalho que está no arquivo
               include 'cabecalho.php';
            ?>
        </div>
        <div class="principal-menu">
            <?php
    	        // Inclui o menu que está no arquivo
    	        include 'menu.php';
            ?>
        </div>
    </body>
    </html>
<?php
    }
?>
