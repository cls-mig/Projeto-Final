<?php
    session_start();
    
    // Faz a leitura do dado na sessâo
    $campoid = $_SESSION['id'];
    
    // Faz a conexão com o banco de dados
    require 'conexao.php';
    
    // Cria o SQL (consulte tudo na tabela cliente)
    $sql = "select * from cliente where id=$campoid";
    
    // Executa o SQL
    $result = $conn->query($sql);
        
    // Se a consulta tiver resultados, exiba o formulário com os campos preenchidos de acordo com o resultado da consulta
    if ($result->num_rows > 0) {
        // Cria uma matriz com o resultado da consulta
        $row = $result->fetch_assoc();
?>
    <html>
        <head>
            <title>Meu perfil</title>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="css/tabela.css">
            <link rel="stylesheet" href="css/estilo.css">
            <link rel="stylesheet" href="css/menu.css">
            <link rel="stylesheet" href="css/cabecalho.css">
            <link rel="icon" href="img/logo-pagina.png"/>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
            </style>
            <script>
                var buscar = document.querySelector(".buscar");
                buscar.setAttribute("disabled");
            </script>
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
    // Se a consulta não tiver resultados
    } else {
    	echo "<h1>Nenhum resultado foi encontrado.</h1>";
    }
    // Fecha a conexão.
    $conn->close();
?>
