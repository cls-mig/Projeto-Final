<?php
    // Parâmetros para criar a conexão
    $servername = "localhost";
    $username = "";
    $password = "";
    $dbname = "";
    
    // Criando a conexão
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    // Checando a conexão
    if ($conn->connect_error) {
        die("Falha ao conectar: " . $conn->connect_error);
    }
?>

