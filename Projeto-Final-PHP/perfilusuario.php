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
            <link rel="stylesheet" href="css/formulario.css">
            <link rel="stylesheet" href="css/estilo.css">
            <link rel="stylesheet" href="css/menu.css">
            <link rel="stylesheet" href="css/cabecalho.css">
            <link rel="icon" href="img/logo-pagina.png"/>
            <script src="script/formatarcampo.js"></script>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
                /* *{margin:0; padding:0; box-sizing: border-box;} */
                .formperfilusuario #container-perfil {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                }
                .formperfilusuario #container-perfil input[type=submit] {
                    width: 25%;
                    height: 40px;
                    cursor: pointer;
                    background: #808080;
                    color: white;
                    border: 0;
                    border-radius: 10px;
                    transition: 1s;
                    font-size: 14px;
                    font-family: "Open Sans", roboto;
                    margin: 0 10px; /* adiciona margem entre os botões */
                }
                .formperfilusuario #container-perfil input[type=submit]:hover {
                    background: #606060;
                }
            </style>
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
            <form class="formperfilusuario" action="perfilusuariocodigo.php" method="post">
                <h3>Meu perfil</h3>
                <p>Nome:</p>
                <input type="text" name="nome" value="<?php echo $row["nome"];?>" required>
                <p>Data de nascimento:</p>
                <?php
                    $data = date('d/m/Y', strtotime(str_replace('/', '-', $row['dtnascimento'])));
                    $cpf = preg_replace('/(\d{3})(\d{3})(\d{3})(\d{2})/', '$1.$2.$3-$4', $row['cpf']);
                    $celular = preg_replace('/(\d{2})(\d{5})(\d{4})/', '($1) $2-$3', $row['celular']);
                    $cep = preg_replace('/(\d{5})(\d{3})/', '$1-$2', $row['cep']);
                ?>
                <input type="text" name="dtnascimento" style="width: 18%;" placeholder="    /    /" oninput="formatarData(this)" maxlength="10" value="<?php echo $data;?>" required>
                <p>CPF:</p>
                <input type="text" name="cpf" oninput="formatarCpf(this)" maxlength="14" value="<?php echo $cpf;?>" required>
                <p>Celular:</p>
                <input type="text" name="celular" oninput="formatarCelular(this)" maxlength="15" value="<?php echo $celular;?>">
                <p>Logradouro:</p>
                <input type="text" name="logradouro" value="<?php echo $row["logradouro"];?>" required>
                <p>Número:</p>
                <input type="text" name="numero" value="<?php echo $row["numero"];?>" required>
                <p>CEP:</p>
                <input type="text" name="cep" oninput="formatarCep(this)" maxlength="9" value="<?php echo $cep;?>" required>
                <p>Bairro:</p>
                <input type="text" name="bairro" value="<?php echo $row["bairro"];?>" required>
                <input type="hidden" name="acao" value="alterar">
                <div id="container-perfil">
                    <input type="submit" name="submit_alterar" value="Alterar perfil">
                    <input type="submit" name="submit_excluir" value="Excluir conta">
                </div>
            </form>
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
