// Tentativa 1:

const abrirModalInput = document.querySelector("#abrir-modal");
const fecharModalButtom = document.querySelector("#fechar-modal");
const modal = document.querySelector("#modal");
const fade = document.querySelector("#fade");

const toggleModal = () => {
    [modal, fade].forEach((el) => el.classList.toggle("hide"));
};

[abrirModalInput, fecharModalButton, fade].forEach((element) => {
    element.addEventListener("click", toggleModal);
});

// Tentativa 2:
document.getElementById('abrir-carrinho').addEventListener('click', function() {
    var modalId = this.getAttribute('data-target');
    var modal = document.getElementById(modalId);
    modal.style.display = 'block';
});
document.getElementById('fechar-modal').addEventListener('click', function() {
    var modalId = this.closest('.modal').getAttribute('id');
    var modal = document.getElementById(modalId);
    modal.style.display = 'none';
});

// Tentativa 3:
function abrirModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = 'block';
}

function fecharModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = 'none';
}

function adicionarItem(id) {
    // Lógica para adicionar o item ao carrinho
    
    // Abrir o modal após adicionar o item ao carrinho
    abrirModal('modal');
}

document.getElementById('abrir-carrinho').addEventListener('click', function() {
    var modalId = this.getAttribute('data-target');
    abrirModal(modalId);
});

document.getElementById('fechar-modal').addEventListener('click', function() {
    var modalId = this.closest('.modal').getAttribute('id');
    fecharModal(modalId);
});
