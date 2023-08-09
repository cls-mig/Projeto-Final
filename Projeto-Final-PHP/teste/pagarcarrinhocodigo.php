<?php
    $carrinho = $_POST['data'];
    $itens = json_decode($carrinho, true);
    /*
    session_start();
    $_SESSION['carrinho'] = array($itens);
    echo $_SESSION['carrinho'];
    */
    // var_dump($itens);
?>
