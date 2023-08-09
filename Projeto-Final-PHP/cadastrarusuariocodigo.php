<?php
    session_start();
    
    // Dados do Formulário
    // O 'name' é obrigatório
    $camponome = filter_input(INPUT_POST, 'nome');
    
    $data = filter_input(INPUT_POST, 'dtnascimento');
    // Converte a data para o formato do banco de dados
    $campodata = date('Y-m-d', strtotime(str_replace('/', '-', $data)));
    
    $cpf = filter_input(INPUT_POST, 'cpf');
    // Converte o CPF para o formato correto
    $campocpf = str_replace(['.', '-'], '', $cpf);
    
    $celular = filter_input(INPUT_POST, 'celular');
    // Converte o celular para o formato correto
    $campocel = str_replace(['(', ')', ' ', '-'], '', $celular);
    
    $campolograd = filter_input(INPUT_POST, 'logradouro');
    $camponum = filter_input(INPUT_POST, 'numero');
    
    $cep = filter_input(INPUT_POST, 'cep');
    // Converte o cep para o formato correto
    $campocep = str_replace('-', '', $cep);
    
    $campobairro = filter_input(INPUT_POST, 'bairro');
    $campoemail = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
    
    // O EasyPHP não tem password_hash, por isso deixei as duas opções
    $camposenha = password_hash($_POST["senha"], PASSWORD_BCRYPT);
    // $camposenha = filter_input(INPUT_POST, 'senha');
    
    // Verifica campos vazios
    // Se o filtro encontrar caracter proibido, a variável estará em branco
    if (!$camponome || !$campodata || !$campocpf || !$campolograd || !$camponum || !$campocep || !$campobairro || !$campoemail || !$camposenha) {
    	header("Location: cadastrarusuario.php?erro=1");
    	exit;
    }
    
    // Faz a conexão com o banco de dados
    require 'conexao.php';
    
    // Verifica email duplicado e retorna erro
    $sql = "select * from cliente where email='$campoemail'";
    
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
    	header("Location: cadastrarusuario.php?erro=2");
    	exit;
    }
    
    // Cria um número inteiro aleatório dentro do intervalo
    $validador = rand(10000000,99999999);
    
    // Insere na tabela os valores dos campos
    $sql = "insert cliente(nome, dtnascimento, cpf, celular, logradouro, numero, cep, bairro, email, senha, status, validador) values ('$camponome', '$campodata', '$campocpf', '$campocel', '$campolograd', '$camponum', '$campocep', '$campobairro', '$campoemail', '$camposenha', 'aguardando', $validador)";
    
    // Executa o SQL e faz tratamento de erros
    if ($conn->query($sql) === TRUE) {
        // echo "Cadastrado com sucesso. " . "\n";
        
        // Envia o email para validar a conta
        require 'enviaremail.php';
        
        // Conteúdo do email de validação
        $texto = "Clique <a href='sebolegal.000webhostapp.com/validaremail.php?id=" . $campoemail . "&validador=" . $validador . "'>aqui</a>, para confirmação do e-mail.";
        
        enviaremail($camponome, $campoemail, 'Validar conta', $texto);
    
    } else {
        //  header( "refresh:5;url=principal.php" );	
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    // Fecha a conexão.
    $conn->close();
?>
