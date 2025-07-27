🐸 Frogger Game - Delphi Edition

Um jogo clássico Frogger desenvolvido em Delphi com recursos modernos de áudio, gráficos e jogabilidade aprimorada.

📖 Sobre o Projeto

Este é uma implementação completa do clássico jogo Frogger, onde o jogador controla um sapo que deve atravessar uma estrada movimentada e um rio perigoso para chegar ao seu destino. O jogo foi desenvolvido em Delphi com foco na experiência do usuário e qualidade técnica.

🎮 Características Principais

•Jogabilidade Clássica: Mecânicas fiéis ao Frogger original
•Sistema de Som Avançado: Efeitos sonoros e música de fundo
•Gráficos Otimizados: Interface visual atrativa e responsiva
•Detecção de Colisão Precisa: Sistema robusto de colisões
•Sistema de Vidas: Controle de erros e acertos
•Loop Infinito: Jogo contínuo com dificuldade progressiva

🚀 Funcionalidades

✅ Mecânicas de Jogo

•Movimento do sapo com teclas direcionais (↑↓←→)
•Área de carros com movimento automático
•Área do rio com troncos flutuantes
•Sistema de pontuação e vidas
•Detecção de vitória e derrota

✅ Sistema de Áudio

•Som do Sapo: Efeito sonoro a cada movimento

•Som de Trânsito: Música de fundo contínua (23 segundos em loop)

•Controle de Conflitos: Sons simultâneos sem interferência

•Formatos Suportados: WAV otimizado para melhor performance

✅ Recursos Técnicos

•Correção de Bugs: Sistema de afogamento no rio implementado

•Otimização de Performance: DoubleBuffered para fluidez visual

•Controle de Timers: Gerenciamento eficiente de animações

•Tratamento de Erros: Sistema robusto de exceções

🎯 Como Jogar

Objetivo

Ajude o sapo Frogger a atravessar a estrada e o rio 3 vezes para vencer o jogo!

Controles

•↑ (Seta para Cima): Move o sapo para frente
•↓ (Seta para Baixo): Move o sapo para trás
•← (Seta para Esquerda): Move o sapo para a esquerda
•→ (Seta para Direita): Move o sapo para a direita

Regras
1.Área dos Carros: Evite ser atropelado pelos veículos
2.Área do Rio: Pule nos troncos para não se afogar
3.Vidas: Você tem 3 vidas (corações na tela)
4.Vitória: Atravesse 3 vezes para completar o jogo

Dicas
•Observe o padrão de movimento dos carros
•Aguarde o momento certo para pular nos troncos
•Use as bordas da tela como proteção temporária
•Não fique muito tempo na água sem um tronco!

💻 Requisitos do Sistema

Requisitos Mínimos

•Sistema Operacional: Windows 7 ou superior
•RAM: 512 MB
•Espaço em Disco: 50 MB
•Placa de Som: Compatível com DirectSound
•Resolução: 1024x768 ou superior

Requisitos de Desenvolvimento
•IDE: Delphi 7 ou superior (testado até Delphi 11)
•Componentes: VCL padrão (TImage, TTimer, TShape, TMediaPlayer)
•Bibliotecas: MMSystem (para PlaySound)

🔧 Instalação

Para Usuários (Executável)
1.Download: Baixe a versão mais recente dos Releases
2.Extração: Extraia todos os arquivos para uma pasta
3.Arquivos Necessários:
4.Execução: Execute Frogger.exe

Para Desenvolvedores
1.Clone o Repositório:
2.Abrir no Delphi:
•Abra Frogger.dpr no Delphi
•Certifique-se de que todos os arquivos estão no mesmo diretório

3.
Compilar:

•Pressione F9 ou vá em Run > Run
•O executável será gerado na pasta do projeto

4.
Estrutura de Arquivos:

🎵 Configuração de Áudio
Arquivos de Som Inclusos

somsapo.wav
•Função: Efeito sonoro do movimento do sapo
•Duração: ~0.5 segundos
•Formato: WAV, 44.1kHz, Mono
•Quando Toca: A cada movimento com as setas

Transito_44k_mono.wav
•Função: Som de fundo do trânsito
•Duração: 23.75 segundos
•Formato: WAV, 44.1kHz, Mono, otimizado
•Quando Toca: Quando o sapo passa pela pista

3.
Bibliotecas:
Estrutura de Desenvolvimento

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
🐸 Obrigado por jogar Frogger! 🐸
Desenvolvido com ❤️ em Delphi





