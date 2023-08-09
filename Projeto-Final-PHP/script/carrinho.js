var carrinho = [];
var total, valor;
var quantidade = 0;
var campoTotal = document.getElementById("spanTotal");
var campoQuantidade = document.getElementById("spanQuantidade");
// Adicionar um item ao carrinho
function adicionarItem(id) {
    // Verificar se o item já foi adicionado
    var itemExistente = carrinho.find(function(item) {
        return item.id === id;
    });
    
    if (itemExistente) {
        alert("Este item já foi adicionado ao carrinho!");
        return;
    }
    
    // Encontrar o botão "Adicionar ao carrinho"
    var botao = event.target;

    // Encontrar a linha da tabela que contém o botão
    var linha = botao.parentNode.parentNode;
    
    // Extrair as informações da linha e adicioná-las ao carrinho
    var titulo = linha.getElementsByTagName("td")[0].innerHTML;
    var autor = linha.getElementsByTagName("td")[1].innerHTML;
    var genero = linha.getElementsByTagName("td")[2].innerHTML;
    var editora = linha.getElementsByTagName("td")[3].innerHTML;
    var estadoConservacao = linha.getElementsByTagName("td")[4].innerHTML;
    var preco = parseFloat(linha.getElementsByTagName("td")[5].innerHTML.replace("<label>R$ </label>", "").replace(",", ".")).toFixed(2);
    
    var item = {
        id,
        titulo,
        autor,
        genero,
        editora,
        estadoConservacao,
        preco
    };
    // push adiciona o novo item no final do array
    carrinho.push(item);
    /*
    // Exibir uma mensagem confirmando a adição ao carrinho
    alert("O item " + titulo + " foi adicionado ao carrinho!");
    console.log("O item foi adicionado com sucesso!");
    
    // console.log(carrinho);
    */
    abrirCarrinho(true);
}

let fecharCarrinhoButton = document.querySelector("#fechar-modal");
fecharCarrinho(fecharCarrinhoButton);

let limparCarrinhoButton = document.querySelector("#limpar-modal");
limparCarrinho(limparCarrinhoButton);

let finalizarCompraButton = document.querySelector("#comprar-modal");
finalizarCompra(finalizarCompraButton);

function abrirCarrinho(example) {
    /*
    console.log("Olá, mundo!");
    console.log(carrinho);
    */
    
    let openModal = document.querySelector("#fade");
    openModal.style.display = 'block';
    
    // Atribui à variável container, uma referência ao elemento HTML (utilizando o id para identificá-lo)
    var container = document.getElementById("container-carrinho");
    let emptyCart = document.querySelector(".modal-body");
    let emptyCartMsg = document.getElementById("empty-cart-msg");
    
    if (carrinho==0) {
        // console.log("Olá, mundo!");
        emptyCart.style.display = "none";
        emptyCartMsg.style.display = "block";
    } else {
        emptyCart.style.display = "block";
        emptyCartMsg.style.display = "none";
        // Cria um vetor que recebe elementos HTML como valores
        var tabelaHTML = [
            '<table id="tableCarrinho">',
            '<thead>',
                '<tr>',
                '<th style="display: none;"></th>',
                '<th style="width:10%;">Título</th>',
                '<th style="width:10%;">Autor</th>',
                '<th style="width:10%;">Gênero</th>',
                '<th style="width:10%;">Editora</th>',
                '<th style="width:10%;">Conservação</th>',
                '<th style="width:5%;">Preço</th>',
                '</tr>',
            '</thead>',
            '<tbody>'
        ];
        
        valor = 0;
        
        // Inicia uma laço de repetição que varre o array, sendo que para cada item (e suas propriedades) é criada uma linha na tabela
        for (var i = 0; i < carrinho.length; i++) {
            /*
                Nesse trecho é utilizado o método push, isso significa que no final do array será adicionado o resto do
                código da tabela.
                carrinho[i].titulo - a propriedade titulo do carrinho (no índice i) é concatenada como valor da coluna (na tabela)
            */
            tabelaHTML.push('<tr>');
            tabelaHTML.push('<td style="display: none;">' + carrinho[i].id + '</td>');
            tabelaHTML.push('<td>' + carrinho[i].titulo + '</td>');
            tabelaHTML.push('<td>' + carrinho[i].autor + '</td>');
            tabelaHTML.push('<td>' + carrinho[i].genero + '</td>');
            tabelaHTML.push('<td>' + carrinho[i].editora + '</td>');
            tabelaHTML.push('<td>' + carrinho[i].estadoConservacao + '</td>');
            tabelaHTML.push('<td><label>R$ <label>' + carrinho[i].preco + '</td>');
            tabelaHTML.push('</tr>');
            
            if (i==0 && example==true) {
                var qtd = 1;
                calcularQuantidade(qtd);
            }
            valor = valor + parseFloat(carrinho[i].preco);
        }
        calcularTotal(valor);
        
        tabelaHTML.push('</tbody>');
        tabelaHTML.push('</table>');
        
        // Na teoria, ele cria uma nova tabela e substitui a anterior
        container.innerHTML = tabelaHTML.join("\n");
    }
}

function fecharCarrinho(fecharCarrinhoButton) {
    fecharCarrinhoButton.addEventListener('click', function() {
        let closeModal = document.querySelector("#fade");
        closeModal.style.display = 'none';
    });
}

function limparCarrinho(limparCarrinhoButton) {
    limparCarrinhoButton.addEventListener('click', function() {
        carrinho = [];
        // console.log(carrinho);
        abrirCarrinho();
        
        quantidade = 0;
        total = 0;
        valor = 0;
        calcularQuantidade(0);
        calcularTotal(0);
    });
}

function finalizarCompra(finalizarCompraButton) {
    finalizarCompraButton.addEventListener('click', function() {
        // console.log(carrinho);
        
        var compra = JSON.stringify(carrinho);
        /*
        $.ajax({
            url: 'pagarcarrinhocodigo.php',
            type: 'POST',
            data: {data: compra},
            success: function(result){
                console.log('Requisição bem-sucedida!');
                console.log('Resposta do servidor:', result);
                // Retorno se tudo ocorreu normalmente
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log('Erro na requisição!');
                console.log('Status do erro:', textStatus);
                console.log('Erro lançado:', errorThrown);
                // Retorno caso algum erro ocorra
            }
        });
        */
    });
}

function calcularQuantidade(qtd) {
    quantidade = quantidade + qtd;
    campoQuantidade.textContent = quantidade;
    // console.log(quantidade);
}

function calcularTotal(valor) {
    total = valor;
    campoTotal.textContent = parseFloat(total).toFixed(2);
    // console.log(total);
}
