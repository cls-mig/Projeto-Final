<?php
    session_start();
    
    // Verifica se o usuário logou no sistema
    if (isset($_SESSION['id'])) {
?>
<html>
<head>
    <title>Contato</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/formulario.css">
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/cabecalho.css">
    <link rel="icon" href="img/logo-pagina.png"/>
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
    <form action="comentariocodigo.php" method="post">
	    <h3>Fale conosco</h3>
    	<textarea type="text" name="comentario" placeholder="Digite sua mensagem aqui" required></textarea>
    	<input type="submit" value="Enviar">
	</form>
</body>
</html>
<?php
    // Caso o usuário não tenha logado, o botão ficará indisponível e uma mensagem ira aparecer
    } else {
?>
    	<html>
        <head>
            <title>Contato</title>
            <link rel="stylesheet" href="css/formulario.css">
            <link rel="stylesheet" href="css/estilo.css">
            <link rel="stylesheet" href="css/menu.css">
            <link rel="stylesheet" href="css/cabecalho.css">
            <link rel="icon" href="img/logo-pagina.png"/>
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
            <form action="comentariocodigo.php" method="post">
        	    <h3>Fale conosco</h3>
        	    <!-- <p>Mensagem:</p> -->
            	<textarea type="text" name="comentario" placeholder="Digite sua mensagem aqui" required></textarea>
            	<input type='submit' value='Enviar' disabled>
            	<div id="no-regsiter">
                    <p>Não possui uma conta? <a href="cadastrarusuario.php">Cadastre-se</a></p>
                </div>
        	</form>
        </body>
        </html>
<?php
    }
?>
