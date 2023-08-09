<?php
    session_start();
    
    // date_default_timezone_set('America/Sao_Paulo');
    
    // O 'name' é obrigatório
    $campoid = $_SESSION['id'];
    $campocoment = filter_input(INPUT_POST, 'comentario');
    $campodata = date("Y-m-d") . " " . date("H:i:s");
    
    // Verifica campos vazios
    // Se o filtro encontrar caracter proibido, a variável estará em branco
    if (!$campocoment) {
    	header("Location: comentario.php?erro=1");
    	exit;
    }
    
    // Faz a conexão com o banco de dados
    require 'conexao.php';
    
    // Insere na tabela o valor do campo
    $sql = "insert into comentario (idcliente, mensagem, data) values ($campoid, '$campocoment', '$campodata')";
    
    // Executa o SQL e faz tratamento de erros
    if ($conn->query($sql) === TRUE) {
        echo 'Mensagem enviada com sucesso!';
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    // Fecha a conexão.
    $conn->close();
?>
