/* Protótipo Escola Megamente - interações */

// ---------- LOGIN ----------

function selecionarPerfil(el) {
    document.querySelectorAll('.perfil-card').forEach(c => c.classList.remove('selected'));
    el.classList.add('selected');
}

function entrar() {
    const perfil = document.querySelector('.perfil-card.selected');
    const error = document.getElementById('loginError');

    if (!perfil) {
        error.textContent = 'Selecione um perfil para entrar.';
        error.style.display = 'block';
        return;
    }

    const perfilInfo = perfil.dataset.perfil;
    localStorage.setItem('megamentePerfil', perfilInfo);
    window.location.href = 'index.html';
}

// ---------- DADOS DE EXEMPLO (espelham o banco) ----------

const dadosExemplo = {
    alunos: [
        { id: 13, nome: 'Pedro Henrique Alves',    turma: 'TURMA MANHÃ', xp: 575,  nivel: 'Explorador',     cor: '#ff9800', conquistas: ['🎯', '💻', '🏆'] },
        { id: 14, nome: 'Sofia Lima Castro',       turma: 'TURMA MANHÃ', xp: 250,  nivel: 'Aprendiz',       cor: '#2196f3', conquistas: ['🎯', '📅'] },
        { id: 15, nome: 'Arthur Mendes Rocha',     turma: 'TURMA TARDE', xp: 1350, nivel: 'Criador',        cor: '#9c27b0', conquistas: ['🎯', '📅', '🤖', '🏆', '🌍'] },
        { id: 16, nome: 'Laura Ferreira Dias',     turma: 'TURMA TARDE', xp: 300,  nivel: 'Aprendiz',       cor: '#2196f3', conquistas: ['🎯', '💻'] },
        { id: 17, nome: 'Gabriel Teixeira Nunes',  turma: 'TURMA TARDE', xp: 500,  nivel: 'Explorador',     cor: '#ff9800', conquistas: ['📅', '🏆'] },
        { id: 18, nome: 'Manuela Cardoso Reis',    turma: 'TURMA NOITE', xp: 75,   nivel: 'Iniciante',      cor: '#9e9e9e', conquistas: ['🎯'] },
        { id: 19, nome: 'Davi Sousa Pinto',        turma: 'TURMA NOITE', xp: 100,  nivel: 'Iniciante',      cor: '#9e9e9e', conquistas: ['🎯'] },
        { id: 20, nome: 'Valentina Azevedo Gomes', turma: 'TURMA NOITE', xp: 0,    nivel: 'Iniciante',      cor: '#9e9e9e', conquistas: [] }
    ],
    pessoas: [
        { id: 1,  nome: 'Maria Fátima Alves',       tipo: 'RESPONSAVEL', cargo: '—',        status: 'ATIVO' },
        { id: 9,  nome: 'Carlos Eduardo Menezes',   tipo: 'PROFESSOR',   cargo: 'Professor Geral', status: 'ATIVO' },
        { id: 10, nome: 'Renata Oliveira',          tipo: 'FUNCIONARIO', cargo: 'Secretária',    status: 'ATIVO' },
        { id: 11, nome: 'Marcos Vinícius Santos',   tipo: 'FUNCIONARIO', cargo: 'Coordenador',   status: 'ATIVO' },
        { id: 12, nome: 'Fernanda Costa',           tipo: 'FUNCIONARIO', cargo: 'Diretora',      status: 'ATIVO' },
        { id: 13, nome: 'Pedro Henrique Alves',     tipo: 'ALUNO',       cargo: '—',            status: 'ATIVO' },
        { id: 15, nome: 'Arthur Mendes Rocha',      tipo: 'ALUNO',       cargo: '—',            status: 'ATIVO' }
    ],
    pagamentos: [
        { aluno: 'Pedro',    turma: 'MANHÃ', venc: '05/09/2026', valor: 'R$ 350,00', status: 'PENDENTE' },
        { aluno: 'Sofia',    turma: 'MANHÃ', venc: '05/08/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Arthur',   turma: 'TARDE', venc: '05/08/2026', valor: 'R$ 300,00', status: 'PENDENTE' },
        { aluno: 'Laura',    turma: 'TARDE', venc: '05/08/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Gabriel',  turma: 'TARDE', venc: '05/08/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Manuela',  turma: 'NOITE', venc: '05/07/2026', valor: 'R$ 350,00', status: 'ATRASADO' },
        { aluno: 'Davi',     turma: 'NOITE', venc: '05/08/2026', valor: 'R$ 350,00', status: 'PENDENTE' }
    ]
};

// ---------- TABELAS DINÂMICAS ----------

function montarTabela(tbodyId, linhas) {
    const tbody = document.getElementById(tbodyId);
    if (!tbody) return;
    tbody.innerHTML = linhas.join('');
}

function tabelaPessoas(lista) {
    return lista.map(p => `
        <tr>
            <td><span class="avatar">${p.nome.split(' ').map(w => w[0]).join('').slice(0, 2).toUpperCase()}</span></td>
            <td>${p.nome}</td>
            <td>${p.tipo}</td>
            <td>${p.cargo}</td>
            <td><span class="badge ${p.status === 'ATIVO' ? 'badge-ativa' : 'badge-atrasado'}">${p.status}</span></td>
        </tr>`).join('');
}

function tabelaRanking(list) {
    return list.map((a, i) => {
        const medalha = i === 0 ? '🥇' : i === 1 ? '🥈' : i === 2 ? '🥉' : (i + 1);
        return `
        <tr>
            <td>${medalha}</td>
            <td>${a.nome}</td>
            <td>${a.turma}</td>
            <td><span class="badge badge-nivel" style="color:${a.cor}">${a.nivel}</span></td>
            <td><b>${a.xp} XP</b></td>
            <td>${a.conquistas.map(c => `<span class="conquista-chip">${c}</span>`).join('')}</td>
        </tr>`;
    }).join('');
}

function tabelaPagamentos(lista) {
    return lista.map(p => `
        <tr>
            <td>${p.aluno}</td>
            <td>${p.turma}</td>
            <td>${p.venc}</td>
            <td>${p.valor}</td>
            <td><span class="badge badge-${p.status.toLowerCase()}">${p.status}</span></td>
        </tr>`).join('');
}

// ---------- BUSCA ----------

function filtrarPessoas() {
    const termo = (document.getElementById('buscaPessoas').value || '').toLowerCase();
    const lista = dadosExemplo.pessoas.filter(p =>
        p.nome.toLowerCase().includes(termo) || p.tipo.toLowerCase().includes(termo));
    montarTabela('tbodyPessoas', tabelaPessoas(lista));
}

function filtrarRanking() {
    const termo = (document.getElementById('buscaRanking').value || '').toLowerCase();
    const lista = dadosExemplo.alunos.filter(a =>
        a.nome.toLowerCase().includes(termo) || a.turma.toLowerCase().includes(termo));
    montarTabela('tbodyRanking', tabelaRanking(lista));
}

// ---------- INICIALIZAÇÃO ----------

function mostrarPerfil() {
    const perfil = localStorage.getItem('megamentePerfil') || 'secretaria';
    const nomes = {
        secretaria: { nome: 'Renata Oliveira', cargo: 'Secretária' },
        professor:  { nome: 'Carlos Eduardo Menezes', cargo: 'Professor' },
        direcao:    { nome: 'Fernanda Costa', cargo: 'Diretora' }
    };
    const info = nomes[perfil] || nomes.secretaria;
    document.getElementById('nomeUsuario').textContent = info.nome;
    document.getElementById('cargoUsuario').textContent = info.cargo;
}

function sair() {
    localStorage.removeItem('megamentePerfil');
    window.location.href = 'login.html';
}

document.addEventListener('DOMContentLoaded', () => {
    const ranking = [...dadosExemplo.alunos].sort((a, b) => b.xp - a.xp);

    if (document.getElementById('tbodyRanking')) {
        montarTabela('tbodyRanking', tabelaRanking(ranking));
    }
    if (document.getElementById('tbodyRankingTop')) {
        montarTabela('tbodyRankingTop', tabelaRanking(ranking.slice(0, 3)));
    }
    if (document.getElementById('tbodyPessoas')) {
        montarTabela('tbodyPessoas', tabelaPessoas(dadosExemplo.pessoas));
    }
    if (document.getElementById('tbodyPagamentos')) {
        montarTabela('tbodyPagamentos', tabelaPagamentos(dadosExemplo.pagamentos));
    }
    if (document.getElementById('nomeUsuario')) mostrarPerfil();

    // pódio e cards da página de gamificação
    if (document.getElementById('podio')) {
        const top3 = ranking.slice(0, 3);
        const pips = ['🥇', '🥈', '🥉'];
        document.getElementById('podio').innerHTML = top3.map((a, i) => `
            <div class="podio-item ${i === 0 ? 'podio-top' : ''}">
                <div class="rank">${pips[i]}</div>
                <div class="nome">${a.nome}</div>
                <div style="font-size:12px;color:var(--muted)">${a.turma}</div>
                <div class="xp">${a.xp} XP</div>
                <div class="progresso">
                    <span>${a.nivel}</span>
                    <div class="barra"><span style="width:${Math.min(100, a.xp / 20)}%"></span></div>
                </div>
            </div>`).join('');
    }

    if (document.getElementById('top1')) {
        document.getElementById('top1').textContent = ranking[0].nome.split(' ')[0] + ' 🏆';
    }
    if (document.getElementById('mediaXp')) {
        const media = Math.round(ranking.reduce((s, a) => s + a.xp, 0) / ranking.length);
        document.getElementById('mediaXp').textContent = media + ' XP';
    }
    if (document.getElementById('totalConq')) {
        const total = dadosExemplo.alunos.reduce((s, a) => s + a.conquistas.length, 0);
        document.getElementById('totalConq').textContent = total;
    }
});