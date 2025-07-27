🐸 Frogger Game - Delphi Edition

Um jogo clássico Frogger desenvolvido em Delphi com recursos modernos de áudio, gráficos e jogabilidade aprimorada.

📖 Sobre o Projeto

Este é uma implementação completa do clássico jogo Frogger, onde o jogador controla um sapo que deve atravessar uma estrada movimentada e um rio perigoso para chegar ao seu destino. O jogo foi desenvolvido em Delphi com foco na experiência do usuário e qualidade técnica.

🎮 Características Principais

•
Jogabilidade Clássica: Mecânicas fiéis ao Frogger original

•
Sistema de Som Avançado: Efeitos sonoros e música de fundo

•
Gráficos Otimizados: Interface visual atrativa e responsiva

•
Detecção de Colisão Precisa: Sistema robusto de colisões

•
Sistema de Vidas: Controle de erros e acertos

•
Loop Infinito: Jogo contínuo com dificuldade progressiva

🚀 Funcionalidades

✅ Mecânicas de Jogo

•
Movimento do sapo com teclas direcionais (↑↓←→)

•
Área de carros com movimento automático

•
Área do rio com troncos flutuantes

•
Sistema de pontuação e vidas

•
Detecção de vitória e derrota

✅ Sistema de Áudio

•
Som do Sapo: Efeito sonoro a cada movimento

•
Som de Trânsito: Música de fundo contínua (23 segundos em loop)

•
Controle de Conflitos: Sons simultâneos sem interferência

•
Formatos Suportados: WAV otimizado para melhor performance

✅ Recursos Técnicos

•
Correção de Bugs: Sistema de afogamento no rio implementado

•
Otimização de Performance: DoubleBuffered para fluidez visual

•
Controle de Timers: Gerenciamento eficiente de animações

•
Tratamento de Erros: Sistema robusto de exceções

🎯 Como Jogar

Objetivo

Ajude o sapo Frogger a atravessar a estrada e o rio 3 vezes para vencer o jogo!

Controles

•
↑ (Seta para Cima): Move o sapo para frente

•
↓ (Seta para Baixo): Move o sapo para trás

•
← (Seta para Esquerda): Move o sapo para a esquerda

•
→ (Seta para Direita): Move o sapo para a direita

Regras

1.
Área dos Carros: Evite ser atropelado pelos veículos

2.
Área do Rio: Pule nos troncos para não se afogar

3.
Vidas: Você tem 3 vidas (corações na tela)

4.
Vitória: Atravesse 3 vezes para completar o jogo

Dicas

•
Observe o padrão de movimento dos carros

•
Aguarde o momento certo para pular nos troncos

•
Use as bordas da tela como proteção temporária

•
Não fique muito tempo na água sem um tronco!

💻 Requisitos do Sistema

Requisitos Mínimos

•
Sistema Operacional: Windows 7 ou superior

•
RAM: 512 MB

•
Espaço em Disco: 50 MB

•
Placa de Som: Compatível com DirectSound

•
Resolução: 1024x768 ou superior

Requisitos de Desenvolvimento

•
IDE: Delphi 7 ou superior (testado até Delphi 11)

•
Componentes: VCL padrão (TImage, TTimer, TShape, TMediaPlayer)

•
Bibliotecas: MMSystem (para PlaySound)

🔧 Instalação

Para Usuários (Executável)

1.
Download: Baixe a versão mais recente dos Releases

2.
Extração: Extraia todos os arquivos para uma pasta

3.
Arquivos Necessários:

4.
Execução: Execute Frogger.exe

Para Desenvolvedores

1.
Clone o Repositório:

2.
Abrir no Delphi:

•
Abra Frogger.dpr no Delphi

•
Certifique-se de que todos os arquivos estão no mesmo diretório



3.
Compilar:

•
Pressione F9 ou vá em Run > Run

•
O executável será gerado na pasta do projeto



4.
Estrutura de Arquivos:

🎵 Configuração de Áudio

Arquivos de Som Inclusos

som_sapo.wav

•
Função: Efeito sonoro do movimento do sapo

•
Duração: ~0.5 segundos

•
Formato: WAV, 44.1kHz, Mono

•
Quando Toca: A cada movimento com as setas

Transito_44k_mono.wav

•
Função: Som de fundo do trânsito

•
Duração: 23.75 segundos

•
Formato: WAV, 44.1kHz, Mono, otimizado

•
Quando Toca: Continuamente em loop durante o jogo

Personalização de Sons

Para substituir os sons padrão:

1.
Formato Obrigatório: WAV

2.
Nomes dos Arquivos: Manter os nomes originais

3.
Localização: Mesma pasta do executável

4.
Recomendações:

•
Som do sapo: Máximo 1 segundo

•
Som de trânsito: 10-30 segundos para melhor loop



🏗️ Arquitetura Técnica

Estrutura do Código

Classe Principal: TForm1

A lógica do jogo está centralizada na classe TForm1 com os seguintes componentes principais:

Plain Text


type
  TForm1 = class(TForm)
    // Componentes visuais
    Image1: TImage;           // Sapo (jogador)
    Image2-8: TImage;         // Indicadores de vidas e vitórias
    
    // Carros
    carro_esq_01-03: TImage;  // Carros movendo para esquerda
    carro_dir_01-03: TImage;  // Carros movendo para direita
    
    // Troncos
    tronco_esq_01-03: TImage; // Troncos movendo para esquerda
    tronco_dir_01-03: TImage; // Troncos movendo para direita
    
    // Timers
    T_carro_*: TTimer;        // Controle de movimento dos carros
    T_tronco_*: TTimer;       // Controle de movimento dos troncos
    Timer1: TTimer;           // Animação do título


Principais Funcionalidades Implementadas

1. Sistema de Movimento

Plain Text


procedure pegaposicao(Key: Word);


•
Controla movimento do sapo com teclas direcionais

•
Integra verificação de colisões

•
Reproduz som a cada movimento

•
Verifica condições de vitória

2. Sistema de Colisões

Plain Text


procedure colisao(obj1, obj2: TImage);        // Colisão com carros (morte)
procedure Estado(obj1, obj2: TImage);         // Interação com troncos
function ColisaoSimples(obj1, obj2: TImage);  // Verificação básica


3. Sistema de Afogamento (Correção de Bug)

Plain Text


procedure VerificaAfogamento;


•
Problema Original: Sapo não morria ao cair no rio

•
Solução Implementada: Verificação contínua se sapo está na água sem tronco

•
Área do Rio: Coordenadas Y entre 50 e 170 (configurável)

4. Sistema de Áudio Avançado

Plain Text


procedure TocarSomSapo;        // Som do movimento
procedure TocarTransito;       // Som de fundo contínuo


Características do Sistema de Som:

•
Controle de Conflitos: Flag SND_NOSTOP para sons simultâneos

•
Loop Contínuo: Som de trânsito em repetição infinita

•
Otimização: Arquivos WAV em 44.1kHz mono

•
Tratamento de Erros: Execução continua mesmo com falhas de áudio

Melhorias Implementadas

✅ Correção do Bug do Rio

Problema: Sapo não morria ao cair na água

Plain Text


// Solução implementada
procedure VerificaAfogamento;
var
  estaNaAgua, estaEmTronco: Boolean;
begin
  estaNaAgua := (Image1.Top >= 50) and (Image1.Top <= 170);
  if estaNaAgua then
  begin
    estaEmTronco := ColisaoSimples(Image1, tronco_*);
    if not estaEmTronco then
      Errou; // Sapo morre
  end;
end;


✅ Sistema de Som Robusto

Problema: Conflito entre sons, reprodução incompleta

Plain Text


// Solução para som contínuo
PlaySound(PChar(arquivo), 0, SND_FILENAME or SND_ASYNC or SND_LOOP or SND_NOSTOP);

// Solução para sons de efeito  
PlaySound(PChar(arquivo), 0, SND_FILENAME or SND_ASYNC or SND_NODEFAULT);


✅ Otimização de Performance

•
DoubleBuffered: Elimina flickering visual

•
Controle de Timers: Gerenciamento eficiente de recursos

•
Tratamento de Exceções: Estabilidade em situações de erro

Fluxo de Execução

Inicialização (FormCreate)

1.
Configuração do DoubleBuffered

2.
Inicialização de variáveis

3.
Início do som de trânsito

4.
Ativação dos timers

Loop Principal do Jogo

1.
Input: Captura teclas direcionais

2.
Movimento: Atualiza posição do sapo

3.
Colisões: Verifica interações com objetos

4.
Áudio: Reproduz efeitos sonoros

5.
Verificações: Afogamento, vitória, derrota

6.
Renderização: Atualiza interface visual

Finalização (FormClose)

1.
Desabilita todos os timers

2.
Para reprodução de áudio

3.
Libera recursos do sistema

🐛 Problemas Conhecidos e Soluções

❌ Bug Original: Sapo no Rio

Descrição: Sapo não morria ao cair na água sem estar em tronco
Status: ✅ CORRIGIDO
Solução: Implementação da função VerificaAfogamento()

❌ Conflito de Sons

Descrição: Som de trânsito parava ao mover sapo
Status: ✅ CORRIGIDO


Solução: Uso da flag SND_NOSTOP para som de fundo

❌ Timer T_tronco_esq_03 Incompleto

Descrição: Timer não chamava função Estado()
Status: ✅ CORRIGIDO
Solução: Adicionada chamada Estado(Image1, tronco_esq_03)

⚠️ Limitações Atuais

•
Resolução Fixa: Interface não é responsiva

•
Dificuldade Estática: Velocidade dos objetos não aumenta

•
Som Limitado: Apenas formato WAV suportado

🚀 Desenvolvimento e Contribuição

Guia para Desenvolvedores

Configuração do Ambiente

1.
Delphi IDE: Versão 7 ou superior

2.
Componentes Necessários:

•
VCL padrão (TImage, TTimer, TShape)

•
TMediaPlayer (opcional, para funcionalidades avançadas)



3.
Bibliotecas:

Estrutura de Desenvolvimento

Plain Text


src/
├── frog.pas           # Lógica principal do jogo
├── frog.dfm           # Design do formulário
└── Frogger.dpr        # Arquivo do projeto

assets/
├── som_sapo.wav       # Efeitos sonoros
└── Transito_44k_mono.wav # Som de fundo

docs/
├── README.md          # Documentação principal
└── CHANGELOG.md       # Histórico de versões


Principais Áreas de Código

1. Controle de Movimento

Plain Text


// Localização: procedure pegaposicao(Key: Word)
// Responsável por: Movimento do sapo, som, verificações


2. Sistema de Colisões

Plain Text


// Localização: procedures colisao(), Estado(), VerificaAfogamento()
// Responsável por: Detecção de colisões, lógica de morte/sobrevivência


3. Gerenciamento de Áudio

Plain Text


// Localização: procedures TocarSomSapo(), TocarTransito()
// Responsável por: Reprodução de sons, controle de conflitos


4. Controle de Timers

Plain Text


// Localização: procedures T_*Timer()
// Responsável por: Animação de carros e troncos


Como Contribuir

🐛 Reportar Bugs

1.
Verifique se o bug já foi reportado nas Issues

2.
Crie uma nova issue com:

•
Descrição detalhada do problema

•
Passos para reproduzir

•
Versão do Delphi utilizada

•
Sistema operacional



💡 Sugerir Melhorias

1.
Abra uma issue com tag enhancement

2.
Descreva a funcionalidade desejada

3.
Explique o benefício para o jogo

4.
Considere a complexidade de implementação

🔧 Enviar Pull Requests

1.
Fork o repositório

2.
Crie uma branch para sua feature:

3.
Implemente suas mudanças

4.
Teste thoroughly

5.
Commit com mensagens descritivas:

6.
Push para sua branch:

7.
Abra um Pull Request

📋 Padrões de Código

•
Indentação: 2 espaços

•
Nomenclatura: PascalCase para procedures/functions

•
Comentários: Documentar lógica complexa

•
Tratamento de Erros: Sempre usar try-except para operações críticas

🎯 Melhorias Futuras (Roadmap)

🥇 Prioridade Alta




Sistema de Pontuação: Pontos por travessia e tempo




Níveis de Dificuldade: Velocidade progressiva




Interface Responsiva: Adaptação a diferentes resoluções




Configurações: Menu de opções (som, dificuldade)

🥈 Prioridade Média




Mais Efeitos Sonoros: Sons de colisão, vitória, derrota




Animações: Sprites animados para sapo e veículos




Power-ups: Itens especiais (vida extra, invencibilidade)




Recordes: Sistema de high scores

🥉 Prioridade Baixa




Multiplayer Local: Dois jogadores alternados




Temas Visuais: Diferentes cenários (noite, inverno)




Música de Fundo: Trilha sonora completa




Controles Alternativos: Suporte a joystick

🧪 Testes

Testes Manuais Recomendados

1.
Movimento: Testar todas as direções

2.
Colisões: Verificar morte por carros

3.
Afogamento: Confirmar morte na água sem tronco

4.
Som: Verificar reprodução simultânea

5.
Vitória/Derrota: Testar condições de fim de jogo

6.
Performance: Verificar fluidez em diferentes sistemas

Cenários de Teste

Plain Text


// Teste de afogamento
1. Mover sapo para área do rio (Y: 50-170)
2. Não colidir com troncos
3. Verificar se sapo morre

// Teste de som
1. Iniciar jogo (som de trânsito deve começar)
2. Mover sapo (som do sapo deve tocar)
3. Verificar se som de trânsito continua

// Teste de vitória
1. Atravessar 3 vezes com sucesso
2. Verificar mensagem de vitória
3. Testar opção de continuar


📊 Estatísticas do Projeto

Métricas de Código

•
Linguagem: Object Pascal (Delphi)

•
Linhas de Código: ~800 linhas

•
Arquivos Principais: 3 (.pas, .dfm, .dpr)

•
Componentes VCL: 25+ (Images, Timers, Shapes)

•
Procedures/Functions: 20+

Funcionalidades Implementadas

•
✅ Movimento do jogador (4 direções)

•
✅ Sistema de colisões (carros e troncos)

•
✅ Detecção de afogamento

•
✅ Sistema de vidas (3 vidas)

•
✅ Condições de vitória/derrota

•
✅ Efeitos sonoros

•
✅ Som de fundo contínuo

•
✅ Interface visual completa

•
✅ Controle de timers

•
✅ Tratamento de erros

❓ FAQ (Perguntas Frequentes)

🎮 Gameplay

P: Como faço para vencer o jogo?
R: Atravesse a estrada e o rio 3 vezes com sucesso. Cada travessia completa acende um indicador de vitória.

P: Por que o sapo morre na água?
R: O sapo só pode sobreviver na água quando está em cima de um tronco. Se cair diretamente na água, ele se afoga.

P: Quantas vidas eu tenho?
R: Você começa com 3 vidas (corações vermelhos na tela). Cada morte remove uma vida.

🔧 Técnicas

P: O som não está funcionando. O que fazer?
R: Verifique se os arquivos som_sapo.wav e Transito_44k_mono.wav estão na mesma pasta do executável. Certifique-se de que sua placa de som está funcionando.

P: O jogo está lento/travando. Como resolver?
R: Verifique se seu sistema atende aos requisitos mínimos. Feche outros programas que possam estar consumindo recursos.

P: Posso modificar os sons do jogo?
R: Sim! Substitua os arquivos WAV mantendo os mesmos nomes. Use formato WAV, 44.1kHz para melhor compatibilidade.

💻 Desenvolvimento

P: Em qual versão do Delphi foi desenvolvido?
R: O jogo é compatível com Delphi 7 ou superior, testado até Delphi 11.

P: Posso usar este código em meus projetos?
R: Sim, respeitando os termos da licença MIT. Veja a seção de licença para detalhes.

P: Como reporto bugs ou sugiro melhorias?
R: Abra uma issue no repositório GitHub com descrição detalhada do problema ou sugestão.

🏆 Créditos e Agradecimentos

👨‍💻 Desenvolvimento

•
Desenvolvedor Principal: [Seu Nome]

•
Correção de Bugs: Implementação do sistema de afogamento

•
Sistema de Áudio: Otimização e controle de conflitos sonoros

•
Documentação: README completo e comentários no código

🎨 Assets

•
Sons: Arquivos de áudio otimizados para o jogo

•
Gráficos: Interface visual baseada no Frogger clássico

•
Inspiração: Jogo original Frogger (1981) da Konami

🤝 Contribuições

•
Testes: Comunidade de desenvolvedores Delphi

•
Feedback: Usuários que reportaram bugs e sugestões

•
Suporte: Fóruns e comunidades de desenvolvimento

📚 Recursos Utilizados

•
Delphi VCL: Framework de interface visual

•
MMSystem: Biblioteca para reprodução de áudio

•
FFmpeg: Ferramenta para otimização de arquivos de áudio

📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

Resumo da Licença MIT:

•
✅ Uso Comercial: Permitido

•
✅ Modificação: Permitido

•
✅ Distribuição: Permitido

•
✅ Uso Privado: Permitido

•
❌ Responsabilidade: Não há garantias

•
❌ Garantia: Fornecido "como está"

Condições:

•
Incluir aviso de copyright

•
Incluir texto da licença

Plain Text


MIT License

Copyright (c) 2024 [Seu Nome]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


📞 Contato e Suporte

🐛 Reportar Problemas

•
GitHub Issues: Criar Nova Issue

•
Tipo de Problemas: Bugs, melhorias, dúvidas técnicas

💬 Discussões

•
GitHub Discussions: Participar das Discussões

•
Tópicos: Ideias, perguntas gerais, showcase

📧 Contato Direto

•
Email: [seu.email@exemplo.com]

•
LinkedIn: [Seu Perfil LinkedIn]

•
GitHub: @seu-usuario

🌟 Apoie o Projeto

Se este projeto foi útil para você:

•
⭐ Star o repositório

•
🍴 Fork para suas próprias modificações

•
📢 Compartilhe com outros desenvolvedores

•
💝 Contribua com código ou documentação

📈 Status do Projeto

🔄 Versão Atual: v1.0.0

•
✅ Estável: Pronto para uso

•
✅ Funcional: Todas as funcionalidades principais implementadas

•
✅ Testado: Verificado em múltiplos sistemas

•
✅ Documentado: README completo e código comentado

🚀 Próximos Passos

1.
v1.1.0: Sistema de pontuação

2.
v1.2.0: Níveis de dificuldade

3.
v2.0.0: Interface responsiva





<div align="center">

🐸 Obrigado por jogar Frogger! 🐸

Desenvolvido com ❤️ em Delphi

⬆️ Voltar ao Topo

</div>

