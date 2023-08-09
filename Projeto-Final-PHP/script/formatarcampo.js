function formatarData(input) {
    let valor = input.value;
    valor = valor.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
    
    // verifica se o comprimento da string é maior que 2
    if (valor.length > 2) {
        valor = valor.replace(/(\d{2})(\d)/, '$1/$2'); // Adiciona a barra após os dois primeiros dígitos
    }
    if (valor.length > 5) {
        valor = valor.replace(/(\d{2})(\d)/, '$1/$2'); // Adiciona a barra após os próximos dois dígitos
    }
    input.value = valor;
    
    const regexData = /^\d{2}\/\d{2}\/\d{4}$/;
    // verifica usando o regexData se o 'valor' possui o formato correto, utilizando o .test() ele determina se a string ao padrão especificado
    if (!regexData.test(valor)) {
        input.setCustomValidity('A data está no formato incorreto. O formato correto é dd/mm/aaaa.');
    } else {
        // divide as partes da data em dia/mês/ano
        const partesData = valor.split('/');
        // converte as partes em um inteiro
        const dia = parseInt(partesData[0]); // o 10 indica a base numérica
        const mes = parseInt(partesData[1]);
        const ano = parseInt(partesData[2]);
        const data = new Date(ano, mes - 1, dia); // Mês começa em 0 no objeto Date
        // nesse trecho é feita a verificação automática da data, a partir do momento que o objeto Date() foi instânciado
        if (data.getFullYear() !== ano || data.getMonth() + 1 !== mes || data.getDate() !== dia) {
            input.setCustomValidity('A data é inválida.');
        } else if (ano > new Date().getFullYear()) {
            input.setCustomValidity('O ano não pode ser maior que o ano atual.');
        } else { // verifica se a idade é menor que 18
            // atribui a uma variável o a data atual
            const dataLimite = new Date(new Date().getFullYear() - 18, new Date().getMonth(), new Date().getDate());
            if (data > dataLimite) {
                input.setCustomValidity(`Você deve ter pelo menos 18 anos.`);
            } else {
                input.setCustomValidity('');
            }
        }
    }
}

function formatarCpf(input) {
    let valor = input.value;
    valor = valor.replace(/\D/g, '');
    
    if (valor.length > 3) {
        valor = valor.replace(/(\d{3})(\d)/, '$1.$2'); // Adiciona o ponto após os três primeiros dígitos
    }
    if (valor.length > 6) {
        valor = valor.replace(/(\d{3})(\d)/, '$1.$2'); // Adiciona o ponto após os próximos três dígitos
    }
    if (valor.length > 9) {
        valor = valor.replace(/(\d{3})(\d{1,2})$/, '$1-$2'); // Adiciona o hífen após os últimos dois dígitos
    }
    input.value = valor;
}

function formatarCelular(input) {
    let valor = input.value;
    valor = valor.replace(/\D/g, '');
    
    if (valor.length > 2) {
        valor = valor.replace(/(\d{2})(\d)/, '($1) $2'); // Adiciona parênteses após os dois primeiros dígitos
    }
    if (valor.length > 7) {
        valor = valor.replace(/(\d{5})(\d{1,4})/, '$1-$2'); // Adiciona o hífen após os cinco primeiros dígitos
    }
    input.value = valor;
}

function formatarCep(input) {
    let valor = input.value;
    valor = valor.replace(/\D/g, '');
    
    if (valor.length > 2) {
        valor = valor.replace(/(\d{5})(\d)/, '$1-$2'); // Adiciona o hífen após os cinco primeiros dígitos
    }
    input.value = valor;
}
