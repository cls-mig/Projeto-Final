<?php
    session_start();
?>
<html>
    <head>
        <title>Sebo Vitória</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/rodape.css">
        <link rel="stylesheet" href="css/cabecalho.css">
        <link rel="stylesheet" href="css/tabela.css">
        <link rel="stylesheet" href="css/carrinho.css">
        <link rel="stylesheet" href="css/tabelacarrinho.css">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="script/filtro.js" defer></script>
        <script src="script/carrinho.js" defer></script>
        <link rel="icon" href="img/logo-pagina.png"/>
    </head>
    <body>
        <div class="principal-cabecalho">
            <?php
                // Coloca o cabeçalho que está no arquivo
                include 'cabecalho.php'
            ?>
        </div>
        <div class="principal-menu">
            <?php
    	        // Coloca o menu que está no arquivo
    	        include 'menu.php';
            ?>
        </div>
        <?php
            // Faz a conexão com o BD.
            require 'conexao.php';
            /*
            // Lê a página que será exibida
            if (!isset ($_GET['pag'])) {
                $numpag = 1;
            } else {
                $numpag = $_GET["pag"];
            }
            
            // Quantidade de registros a serem exibidos
            $total = 15;

            // Indica o registro limite para paginação
            if ($numpag!=1) {
                $numpag = $numpag - 1;
                $numpag = $numpag * $total + 1;
            }
            
            $numpag--;
            */
            // Cria a consulta SQL
            $sql = "select e.id, l.titulo, l.autor, l.genero, l.editora, e.estadoconservacao, e.preco from livro l, exemplar e where l.id=e.idlivro and e.status=1 and e.id not in (select idexemplar from itempedido) order by e.id desc";
            
            // Conta a quantidade total de registros na tabela exemplar
            // $sql_pag = "select count(*) as Contagem from exemplar";
            
            // Executa o SQL
            $result = $conn->query($sql);
            // $result_pag = $conn->query($sql_pag);
            /*
            // Recupera o resultado da contagem
            $row_pag = $result_pag->fetch_assoc();
            $contagem = $row_pag["Contagem"];
            
            if ($contagem%$total==0) {
                $contagem = $contagem/$total;
            } else {
                $contagem = $contagem/$total + 1;
            }
            */
        	// Se a consulta tiver resultados
        	if ($result->num_rows > 0) {
        ?>
        <h1>Exemplares cadastrados</h1>
        <div id="principal-tabela">
            <?php
        	   // Inclui a tabela que está no arquivo
        	   include 'tabela.php';
            ?>
        </div>
        <div id="no-results-msg">
            <p>Nenhum exemplar encontrado</p>
        </div>
        
        <?php
            include 'carrinho.php';
        ?>
        
        <?php
        	}
        	// Fecha a conexão.
        	$conn->close();
        ?>
        <div class="principal-rodape">
            <?php
    	        // Coloca o rodapé que está no arquivo
    	        include 'rodape.php';
            ?>
        </div>
    </body>
</html>
