<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css" type="text/css"/>
    <link rel="icon" href="img/logo-pagina.png"/>
</head>
<body>
    <form action="logar.php" method="post">
        <h3>Login</h3>
        <p>E-mail</p>
        <input type="email" name="email" required>
        <p>Senha</p>
        <input type="password" name="senha" required>
        <input type="submit" value="Entrar">
        <div id="no-register">
            <p>Não possui uma conta? <a href="cadastrarusuario.php">Cadastre-se</a></p>
        </div>
    </form>
</body>
</html>
