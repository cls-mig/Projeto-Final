<div id="fade">
    <div id="modal">
        <div class="modal-header">
            <h2>Seu carrinho</h2>
            <button id="fechar-modal">Continuar comprando</button>
        </div>
        <div id="empty-cart-msg">
            <p>Seu carrinho está vazio</p>
        </div>
        <div class="modal-body">
            <div id="container-carrinho"></div> <!-- Contém a tabela do carrinho -->
            <div id="container-data">
                <div id="container-qtd">
                    <p>Quantidade: </p><span id="spanQuantidade"></span>
                </div>
                <div id="container-total">
                    <p>Total: R$ </p><span id="spanTotal"></span>
                </div>
            </div>
            <div id="container"> <!-- Contém os botôes do carrinho -->
                <button id="limpar-modal">Limpar</button>
                <?php
                    if (!isset ($_SESSION['nome'])) {
                        echo "<button id='comprar-modal' disabled>Finalizar compra</button>";
                    } else {
                        echo "<button id='comprar-modal'>Finalizar compra</button>";
                    }
                ?>
            </div>
        </div>
    </div>
</div>
