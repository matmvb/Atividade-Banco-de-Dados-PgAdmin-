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

    // validação simples: e-mail e senha não podem ficar em branco
    const email = (document.getElementById('email').value || '').trim();
    const senha = (document.getElementById('senha').value || '').trim();
    if (!email || !senha) {
        error.textContent = 'Informe e-mail e senha.';
        error.style.display = 'block';
        return;
    }

    const perfilInfo = perfil.dataset.perfil;
    localStorage.setItem('megamentePerfil', perfilInfo);
    window.location.href = 'index.html';
}

// ---------- DADOS DE EXEMPLO (espelham o banco db18) ----------

const dadosExemplo = {
    alunos: [
        { id: 13, nome: 'Pedro Henrique Alves',    turma: 'TURMA MANHÃ',   xp: 575,  nivel: 'Explorador', cor: '#ff9800', conquistas: ['🎯', '💻', '🏆'] },
        { id: 14, nome: 'Sofia Lima Castro',       turma: 'TURMA MANHÃ',   xp: 250,  nivel: 'Aprendiz',   cor: '#2196f3', conquistas: ['🎯', '📅'] },
        { id: 15, nome: 'Arthur Mendes Rocha',     turma: 'TURMA TARDE',   xp: 1350, nivel: 'Criador',    cor: '#9c27b0', conquistas: ['🎯', '📅', '🤖', '🏆', '🌍'] },
        { id: 16, nome: 'Laura Ferreira Dias',     turma: 'TURMA TARDE',   xp: 300,  nivel: 'Aprendiz',   cor: '#2196f3', conquistas: ['🎯', '💻'] },
        { id: 17, nome: 'Gabriel Teixeira Nunes',  turma: 'TURMA TARDE',   xp: 500,  nivel: 'Explorador', cor: '#ff9800', conquistas: ['📅', '🏆'] },
        { id: 18, nome: 'Manuela Cardoso Reis',    turma: 'TURMA NOITE',   xp: 75,   nivel: 'Iniciante',  cor: '#9e9e9e', conquistas: ['🎯'] },
        { id: 19, nome: 'Davi Sousa Pinto',        turma: 'TURMA NOITE',   xp: 100,  nivel: 'Iniciante',  cor: '#9e9e9e', conquistas: ['🎯'] },
        { id: 20, nome: 'Valentina Azevedo Gomes', turma: 'TURMA NOITE',   xp: 0,    nivel: 'Iniciante',  cor: '#9e9e9e', conquistas: [] }
    ],
    pessoas: [
        { id: 1,  nome: 'Maria Fátima Alves',       tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'maria.alves@email.com',      tel: '(69) 98411-0001' },
        { id: 2,  nome: 'João Pedro Castro',        tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'joao.castro@email.com',      tel: '(69) 98411-0002' },
        { id: 3,  nome: 'Ricardo Mendes',           tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'ricardo.mendes@email.com',   tel: '(69) 98411-0003' },
        { id: 4,  nome: 'Ana Lúcia Ferreira',       tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'ana.ferreira@email.com',     tel: '(69) 98411-0004' },
        { id: 5,  nome: 'Paulo Teixeira',           tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'paulo.teixeira@email.com',   tel: '(69) 98411-0005' },
        { id: 6,  nome: 'Carla Cardoso',            tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'carla.cardoso@email.com',    tel: '(69) 98411-0006' },
        { id: 7,  nome: 'Roberto Sousa',            tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'roberto.sousa@email.com',    tel: '(69) 98411-0007' },
        { id: 8,  nome: 'Patrícia Azevedo',         tipo: 'RESPONSAVEL', cargo: '—',               status: 'ATIVO', email: 'patricia.azevedo@email.com', tel: '(69) 98411-0008' },
        { id: 9,  nome: 'Carlos Eduardo Menezes',   tipo: 'PROFESSOR',   cargo: 'Professor Geral', status: 'ATIVO', email: 'professor.carlos@megamente.com.br', tel: '(69) 98411-0009' },
        { id: 10, nome: 'Renata Oliveira',          tipo: 'FUNCIONARIO', cargo: 'Secretária',      status: 'ATIVO', email: 'renata.oliveira@megamente.com.br', tel: '(69) 98411-0010' },
        { id: 11, nome: 'Marcos Vinícius Santos',   tipo: 'FUNCIONARIO', cargo: 'Coordenador',     status: 'ATIVO', email: 'marcos.santos@megamente.com.br',  tel: '(69) 98411-0011' },
        { id: 12, nome: 'Fernanda Costa',           tipo: 'FUNCIONARIO', cargo: 'Diretora',        status: 'ATIVO', email: 'fernanda.costa@megamente.com.br', tel: '(69) 98411-0012' },
        { id: 13, nome: 'Pedro Henrique Alves',     tipo: 'ALUNO',       cargo: 'Turma Manhã',    status: 'ATIVO', email: '—', tel: '(69) 99811-0013' },
        { id: 14, nome: 'Sofia Lima Castro',        tipo: 'ALUNO',       cargo: 'Turma Manhã',    status: 'ATIVO', email: '—', tel: '(69) 99811-0014' },
        { id: 15, nome: 'Arthur Mendes Rocha',      tipo: 'ALUNO',       cargo: 'Turma Tarde',    status: 'ATIVO', email: '—', tel: '(69) 99811-0015' },
        { id: 16, nome: 'Laura Ferreira Dias',      tipo: 'ALUNO',       cargo: 'Turma Tarde',    status: 'ATIVO', email: '—', tel: '(69) 99811-0016' },
        { id: 17, nome: 'Gabriel Teixeira Nunes',   tipo: 'ALUNO',       cargo: 'Turma Tarde',    status: 'ATIVO', email: '—', tel: '(69) 99811-0017' },
        { id: 18, nome: 'Manuela Cardoso Reis',     tipo: 'ALUNO',       cargo: 'Turma Noite',    status: 'ATIVO', email: '—', tel: '(69) 99811-0018' },
        { id: 19, nome: 'Davi Sousa Pinto',         tipo: 'ALUNO',       cargo: 'Turma Noite',    status: 'ATIVO', email: '—', tel: '(69) 99811-0019' },
        { id: 20, nome: 'Valentina Azevedo Gomes',  tipo: 'ALUNO',       cargo: 'Turma Noite',    status: 'ATIVO', email: '—', tel: '(69) 99811-0020' }
    ],
    pagamentos: [
        { aluno: 'Pedro',    turma: 'MANHÃ', venc: '05/07/2026', pagto: '03/07/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Pedro',    turma: 'MANHÃ', venc: '05/08/2026', pagto: '04/08/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Pedro',    turma: 'MANHÃ', venc: '05/09/2026', pagto: '—',          valor: 'R$ 350,00', status: 'PENDENTE' },
        { aluno: 'Sofia',    turma: 'MANHÃ', venc: '05/07/2026', pagto: '06/07/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Sofia',    turma: 'MANHÃ', venc: '05/08/2026', pagto: '05/08/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Arthur',   turma: 'TARDE', venc: '05/07/2026', pagto: '02/07/2026', valor: 'R$ 300,00', status: 'PAGO' },
        { aluno: 'Arthur',   turma: 'TARDE', venc: '05/08/2026', pagto: '—',          valor: 'R$ 300,00', status: 'PENDENTE' },
        { aluno: 'Laura',    turma: 'TARDE', venc: '05/08/2026', pagto: '—',          valor: 'R$ 350,00', status: 'ATRASADO' },
        { aluno: 'Gabriel',  turma: 'TARDE', venc: '05/07/2026', pagto: '10/07/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Gabriel',  turma: 'TARDE', venc: '05/08/2026', pagto: '02/08/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Manuela',  turma: 'NOITE', venc: '05/07/2026', pagto: '—',          valor: 'R$ 350,00', status: 'ATRASADO' },
        { aluno: 'Manuela',  turma: 'NOITE', venc: '05/08/2026', pagto: '06/08/2026', valor: 'R$ 350,00', status: 'PAGO' },
        { aluno: 'Davi',     turma: 'NOITE', venc: '05/08/2026', pagto: '—',          valor: 'R$ 350,00', status: 'PENDENTE' }
    ],
    conquistas: [
        { id: 1, nome: 'Primeira Presença',    pontos: 50,  icone: '🎯', condicao: 'Registrar a 1ª presença' },
        { id: 2, nome: 'Frequência Perfeita',  pontos: 150, icone: '📅', condicao: 'Não faltar nenhuma aula no mês' },
        { id: 3, nome: 'Mestre em Programação', pontos: 200, icone: '💻', condicao: 'Completar a matéria Jogos 2D' },
        { id: 4, nome: 'Mestre em Robótica',   pontos: 200, icone: '🤖', condicao: 'Finalizar o módulo de Robótica' },
        { id: 5, nome: 'Super Criador',        pontos: 300, icone: '🏆', condicao: '3 projetos com nota máxima' },
        { id: 6, nome: 'Estrela do Curso',     pontos: 500, icone: '⭐', condicao: 'Top 3 do ranking da unidade' },
        { id: 7, nome: 'Trilha Completa',      pontos: 600, icone: '🌍', condicao: 'Passar por todas as 8 matérias' }
    ],
    turmas: [
        { nome: 'TURMA MANHÃ', codigo: 'PV-MAN-01', turno: 'Manhã',  horario: '08:00 – 12:00', vagas: 15 },
        { nome: 'TURMA TARDE', codigo: 'PV-TAR-01', turno: 'Tarde',  horario: '13:30 – 17:30', vagas: 15 },
        { nome: 'TURMA NOITE', codigo: 'PV-NOI-01', turno: 'Noite',  horario: '18:30 – 21:30', vagas: 15 }
    ],
    materias: [
        'Raciocínio Lógico / Empreendedorismo', 'Youtuber / Edição de Vídeo e Imagem',
        'Ilustração Digital', 'Jogos 2D', 'Jogos 3D',
        'Programação com Minecraft', 'Desenvolvimento de Apps', 'Robótica'
    ]
};

// ---------- TABELAS DINÂMICAS ----------

function montarTabela(tbodyId, linhas) {
    const tbody = document.getElementById(tbodyId);
    if (!tbody) return;
    tbody.innerHTML = linhas.join('');
}

const rotuloTipo = {
    ALUNO: 'Aluno',
    RESPONSAVEL: 'Responsável',
    PROFESSOR: 'Professor',
    FUNCIONARIO: 'Funcionário'
};

function tabelaPessoas(lista) {
    return lista.map(p => `
        <tr>
            <td><span class="avatar">${p.nome.split(' ').map(w => w[0]).join('').slice(0, 2).toUpperCase()}</span></td>
            <td>${p.nome}</td>
            <td>${rotuloTipo[p.tipo] || p.tipo}</td>
            <td>${p.cargo}</td>
            <td>${p.tel}</td>
            <td>${p.email}</td>
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
            <td>${p.pagto}</td>
            <td>${p.valor}</td>
            <td><span class="badge badge-${p.status.toLowerCase()}">${p.status}</span></td>
        </tr>`).join('');
}

function tabelaConquistas(lista) {
    return lista.map(c => `
        <tr>
            <td><span class="conquista-chip">${c.icone}</span></td>
            <td>${c.nome}</td>
            <td>${c.condicao}</td>
            <td><b>+${c.pontos} XP</b></td>
        </tr>`).join('');
}

// ---------- BUSCA E FILTROS ----------

function filtrarPessoas() {
    const termo = (document.getElementById('buscaPessoas').value || '').toLowerCase();
    const tipo = (document.getElementById('filtroTipo').value || '');
    let lista = dadosExemplo.pessoas;
    if (tipo) lista = lista.filter(p => p.tipo === tipo);
    if (termo) lista = lista.filter(p => p.nome.toLowerCase().includes(termo) || p.tipo.toLowerCase().includes(termo));
    montarTabela('tbodyPessoas', tabelaPessoas(lista));
}

function filtrarRanking() {
    const termo = (document.getElementById('buscaRanking').value || '').toLowerCase();
    const lista = dadosExemplo.alunos.filter(a =>
        a.nome.toLowerCase().includes(termo) || a.turma.toLowerCase().includes(termo));
    montarTabela('tbodyRanking', tabelaRanking(lista));
}

function filtrarPagamentos() {
    const status = (document.getElementById('filtroStatus').value || '');
    let lista = dadosExemplo.pagamentos;
    if (status) lista = lista.filter(p => p.status === status);
    montarTabela('tbodyPagamentos', tabelaPagamentos(lista));
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
    if (document.getElementById('tbodyConquistas')) {
        montarTabela('tbodyConquistas', tabelaConquistas(dadosExemplo.conquistas));
    }
    if (document.getElementById('tbodyTurmas')) {
        montarTabela('tbodyTurmas', dadosExemplo.turmas.map(t => `
            <tr>
                <td>${t.codigo}</td>
                <td>${t.nome}</td>
                <td>${t.turno}</td>
                <td>${t.horario}</td>
                <td>${t.vagas} vagas</td>
            </tr>`).join(''));
    }
    if (document.getElementById('nomeUsuario')) mostrarPerfil();

    // preenche cards do dashboard
    if (document.getElementById('totalAlunos')) document.getElementById('totalAlunos').textContent = dadosExemplo.alunos.length;
    if (document.getElementById('totalPendentes')) {
        const pend = dadosExemplo.pagamentos.filter(p => ['PENDENTE', 'ATRASADO'].includes(p.status)).length;
        document.getElementById('totalPendentes').textContent = pend;
    }

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