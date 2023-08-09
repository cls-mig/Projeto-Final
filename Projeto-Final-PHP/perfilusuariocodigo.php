<?php
    session_start();
    
    if (isset($_POST['submit_alterar'])) {
        $campoid = $_SESSION['id'];
        // Dados do formulário
        $camponome = filter_input(INPUT_POST, 'nome');
        // $camponome = $_POST['nome'];
        
        $data = filter_input(INPUT_POST, 'dtnascimento');
        // Converte a data para o formato do banco de dados
        $campodata = date('Y-m-d', strtotime(str_replace('/', '-', $data)));
        
        $cpf = filter_input(INPUT_POST, 'cpf');
        $campocpf = str_replace(['.', '-'], '', $cpf);
        
        $celular = filter_input(INPUT_POST, 'celular');
        $campocel = str_replace(['(', ')', ' ', '-'], '', $celular);
        
        $campolograd = filter_input(INPUT_POST, 'logradouro');
        $camponum = filter_input(INPUT_POST, 'numero');
        
        $cep = filter_input(INPUT_POST, 'cep');
        $campocep = str_replace('-', '', $cep);
        
        $campobairro = filter_input(INPUT_POST, 'bairro');
        // echo $camponome;
        
        // Faz a conexão com o banco de dados.
        require 'conexao.php';
        
        // SQL que altera um registro da tabela usuários
        $sql = "update cliente set nome='" . $camponome . "', dtnascimento='" . $campodata . "', cpf='" . $campocpf . "', celular='" . $campocel . "', logradouro='" . $campolograd . "', cep='" . $campocep . "', bairro='" . $campobairro . "' where id=$campoid";
        
        // Executa o SQL e faz tratamento de erro
        if ($conn->query($sql) === TRUE) {
            // header('Location: perfilusuario.php');
            unset($_SESSION['id']);
            unset($_SESSION['nome']);
            unset($_SESSION['email']);
            echo "Registro atualizado, por favor faça seu <a href='login.php' style='text-decoration: none;'>login</a> novamente.";
            // include 'log.php';
        } else {
            echo "Erro: " . $conn->error;
        }
        // Fecha a conexão.
        $conn->close();
    } elseif (isset($_POST['submit_excluir'])) {
        // Faz a leitura do dado na sessâo
        $campoid = $_SESSION['id'];
        
        // Faz a conexão com o banco de dados
        require 'conexao.php';
        
        // Apagar da tabela usuários o registro com o id
        $sql = "delete from cliente where id=$campoid";
        
        // Executa o SQL e faz tratamento de erro
        if ($conn->query($sql) === TRUE) {
            unset($_SESSION['id']);
            unset($_SESSION['nome']);
            unset($_SESSION['email']);
            echo "Conta excluída com sucesso! Voltar para a <a href='index.php' style='text-decoration: none;'>página principal</a>!";
            // include 'log.php';
            // header('Location: index.php'); // Redireciona para a tela principal
            // Encerra a sessão e retorna para a tela principal
        } else {
            echo "Erro: " . $conn->error;
        }
        // Fecha a conexão
        $conn->close();
    }
?>
