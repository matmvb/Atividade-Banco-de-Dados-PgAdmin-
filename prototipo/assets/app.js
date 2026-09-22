/* escola megamente - prototipo simples */


// ================= login =================

function escolherPerfil(el) {
    var opcoes = document.querySelectorAll('.perfil-opcao');
    for (var i = 0; i < opcoes.length; i++) {
        opcoes[i].classList.remove('selecionado');
    }
    el.classList.add('selecionado');
}

function entrar() {
    var sel = document.querySelector('.perfil-opcao.selecionado');
    var erro = document.getElementById('loginErro');
    if (!sel) {
        erro.textContent = 'Escolha um perfil antes.';
        erro.style.display = 'block';
        return;
    }
    var email = document.getElementById('email').value;
    var senha = document.getElementById('senha').value;
    if (!email || !senha) {
        erro.textContent = 'Preencha e-mail e senha.';
        erro.style.display = 'block';
        return;
    }
    localStorage.setItem('perfil', sel.dataset.perfil);
    window.location = 'index.html';
}

function sair() {
    localStorage.removeItem('perfil');
    window.location = 'login.html';
}

function mostrarUsuario() {
    var perfis = {
        secretaria: 'Renata Oliveira (Secretária)',
        professor:  'Carlos Eduardo Menezes (Professor)',
        direcao:    'Fernanda Costa (Diretora)'
    };
    var p = localStorage.getItem('perfil') || 'secretaria';
    var el = document.getElementById('usuarioLogado');
    if (el) el.textContent = 'Entrou como: ' + (perfis[p] || perfis.secretaria);
}


// ================= filtros das tabelas =================

// mensalidades
function filtrarPagamentos() {
    var f = document.getElementById('filtroStatus').value;
    var linhas = document.querySelectorAll('#tbodyPagamentos tr');
    for (var i = 0; i < linhas.length; i++) {
        var status = linhas[i].dataset.status || '';
        linhas[i].style.display = (!f || status === f) ? '' : 'none';
    }
}

// pessoas
function filtrarPessoas() {
    var termo = document.getElementById('buscaPessoas').value.toLowerCase();
    var tipo = document.getElementById('filtroTipo').value;
    var linhas = document.querySelectorAll('#tbodyPessoas tr');
    for (var i = 0; i < linhas.length; i++) {
        var txt = (linhas[i].textContent || '').toLowerCase();
        var tp = linhas[i].dataset.tipo || '';
        var ok = (!termo || txt.indexOf(termo) >= 0) && (!tipo || tp === tipo);
        linhas[i].style.display = ok ? '' : 'none';
    }
}

// ranking da gamificação
function filtrarRanking() {
    var termo = document.getElementById('buscaRanking').value.toLowerCase();
    var linhas = document.querySelectorAll('#tbodyRanking tr');
    for (var i = 0; i < linhas.length; i++) {
        var txt = (linhas[i].textContent || '').toLowerCase();
        linhas[i].style.display = (!termo || txt.indexOf(termo) >= 0) ? '' : 'none';
    }
}


// ao abrir qualquer página
mostrarUsuario();