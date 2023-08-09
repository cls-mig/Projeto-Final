<?php
    session_start();
    
    // Dados do formulário
    $campoemail = filter_input(INPUT_GET, 'id');
    $validador = filter_input(INPUT_GET, 'validador');
    
    // Faz a conexão com o BD.
    require 'conexao.php';
    
    // SQL que altera um registro da tabela usuários
    $sql = "update cliente set status='ativo' where status='aguardando' and email='" . $campoemail . "' and validador=" . $validador;
    
    // Executa o sql e faz tratamento de erro.
    
    if ($conn->query($sql) === TRUE) {
        echo "Cadastro concluído!";
      
        /*
        // Grava alteração no log
        include 'log.php';
        */
      
    } else {
        echo "Erro: " . $conn->error;
    }
    //Fecha a conexão.
    $conn->close();
?>
