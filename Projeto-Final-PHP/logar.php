<?php
    session_start();
    // Se o usuário não usou o formulário
    if (!isset($_POST['senha'])){
        header('Location: login.php'); // Redireciona para o formulário de login
        exit; // Interrompe o Script
    }
    
    // Dados do Formulário
    $campoemail = filter_input(INPUT_POST, 'email');
    $camposenha = filter_input(INPUT_POST, 'senha');
    
    // Faz a conexão com o BD.
    require 'conexao.php';
    
    // Cria o SQL (consulte tudo na tabela clientes com o email digitado no form)
    $sql = "select * from cliente where email='$campoemail' and status='ativo'";
    
    // Executa o SQL
    // -> - é usado pra chamar um método ou variável de uma classe
    // $this - chamar um método dentro de outro método
    $result = $conn->query($sql);
    
    // Cria uma matriz com o resultado da consulta
    $row = $result->fetch_assoc();
    
    	// Se a consulta tiver resultados
    	if ($result->num_rows > 0) {
    		// O EasyPHP não tem password_hash, por isso deixei as duas opções
    		$verificado = password_verify($camposenha, $row["senha"]);
    		if($verificado) {
    			$_SESSION['id'] = $row["id"];
    		    $_SESSION['nome'] = $row["nome"];
    			$_SESSION['email'] = $row["email"];
    			// $_SESSION['carrinho'] = '';
    			header('Location: index.php?pag=1');
    			exit;
    		} else {
    		// Senha errada
    		header("refresh:5;url=login.php");
    	    exit;
    		}
    	// Email não existe na base
    	} else {
    		header('Location: login.php'); // Redireciona para a tela de login
    		exit; // Interrompe o Script
    	}
    
    // Fecha a conexão.
    $conn->close();
?>
