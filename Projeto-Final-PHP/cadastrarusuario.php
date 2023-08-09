<html>
<head>
    <title>Cadastro</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/formulario.css">
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/cabecalho.css">
    <link rel="icon" href="img/logo-pagina.png"/>
    <script src="script/formatarcampo.js"></script>
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
    <form class="formulario" action="cadastrarusuariocodigo.php" method="post">
	    <h3>Cadastre-se</h3>
	    <p>Nome:</p>
    	<input type="text" name="nome" required>
    	<p>Data de Nascimento:</p>
    	<input type="text" name="dtnascimento" id="data" style="width: 18%;" placeholder="    /    /" oninput="formatarData(this)" maxlength="10" required>
    	<p>CPF:</p>
    	<input type="text" name="cpf" id="cpf" oninput="formatarCpf(this)" maxlength="14" required>
    	<p>Celular:</p>
    	<input type="text" name="celular" id="celular" oninput="formatarCelular(this)" maxlength="15">
    	<p>Logradouro:</p>
    	<input type="text" name="logradouro" required>
    	<p>Número:</p>
    	<input type="text" name="numero" required>
    	<p>CEP:</p>
    	<input type="text" name="cep" id="cep" oninput="formatarCep(this)" maxlength="9" required>
    	<p>Bairro:</p>
    	<input type="text" name="bairro" required>
    	<p>E-mail:</p>
    	<input type="email" name="email" required>
    	<p>Senha:</p>
    	<input style="width:50%;" type="password" name="senha" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="A senha deve conter pelo menos um caracter maiúsculo, um minúsculo, um número e no mínimo oito caracteres" required>
    	<input type="submit" value="Cadastrar">
	</form>
</body>
</html>
