function myFunction() {
    // Pega o valor do input de pesquisa
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
            
    // Pega o valor do select
    var select, optionValue; 
    select = document.querySelector('.filtrar-consulta');
    optionValue = select.options[select.selectedIndex].value;
            
    // Pega a tabela e as linhas da tabela
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    
    var noResultsMsg = document.getElementById("no-results-msg");
    // var noResultsPag = document.getElementById("paginacao");
    var linhasVisiveis = false;
    
    // Loop pelas linhas da tabela e esconde aquelas que não correspondem aos critérios de pesquisa
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[optionValue - 1]; // -1 pois o valor do select começa em 2
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().startsWith(filter)) {
                tr[i].style.display = "";
                linhasVisiveis = true;
            } else {
                tr[i].style.display = "none";
            }
        }
    }
    
    // Se nenhuma linha estiver visível, oculta a tabela inteira
    if (!linhasVisiveis) {
        noResultsMsg.style.display = "block";
        // noResultsPag.style.display = "none";
        table.style.display = "none";
    } else {
        noResultsMsg.style.display = "none";
        // noResultsPag.style.display = "flex";
        table.style.display = "table";
    }
}
