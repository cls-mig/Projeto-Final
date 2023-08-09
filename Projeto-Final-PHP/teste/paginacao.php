<?php
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

// Cria a consulta SQL
    $sql = "select e.id, l.titulo, l.autor, l.genero, l.editora, e.estadoconservacao, e.preco from livro l, exemplar e where l.id=e.idlivro and e.status=1 and e.id not in (select idexemplar from itempedido) order by e.id desc limit $numpag, $total";
            
    // Conta a quantidade total de registros na tabela exemplar
    $sql_pag = "select count(*) as Contagem from exemplar";
            
    // Executa o SQL
    $result = $conn->query($sql);
    $result_pag = $conn->query($sql_pag);
    
    // Recupera o resultado da contagem
    $row_pag = $result_pag->fetch_assoc();
    $contagem = $row_pag["Contagem"];
            
    if ($contagem%$total==0) {
        $contagem = $contagem/$total;
    } else {
        $contagem = $contagem/$total + 1;
    }
?>

<div id="paginacao">
    <?php
        for ($i=1; $i <= $contagem; $i++) {
            echo "<a href='index.php?pag=$i'>$i</a>";
        } 
	?>
</div>
