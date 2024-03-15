# Relatório de Desenvolvimento - Projeto WS Cars

## Resumo
O projeto WS Cars foi desenvolvido utilizando diversas ferramentas e seguindo práticas de arquitetura MVC. Este documento descreve as principais ferramentas utilizadas, a arquitetura adotada, funcionalidades implementadas, melhorias pendentes e o estado atual do projeto.

## Ferramentas Utilizadas
- **Modular**: Utilizado para lidar com injeções de dependência em cada página.
- **Mobx**: Gerenciamento de estados e regras de negócio da aplicação.
- **SQLFlite**: Armazenamento de dados localmente.
- **Workmanager**: Manipulação de processos rodando em background na aplicação.
- **Dio**: Realização de requisições HTTP.
- **FirebaseAuth**: Implementação do fluxo de autenticação.
- **Firebase**: Integração para geração de leads e registro de tarefas em background.

## Arquitetura
O projeto segue o padrão de arquitetura MVC, onde as responsabilidades são distribuídas da seguinte forma:
- **Model**: Lida com as regras de negócio e estados da aplicação.
- **View**: Responsável pela interface gráfica.
- **Controller**: Integração com os endpoints fornecidos, sem lógica complexa.

## Funcionalidades Implementadas
- Fluxo de autenticação utilizando FirebaseAuth.
- Opção de criar conta.
- Geração de leads e registro de tarefas em background utilizando Firebase.
- Configuração do Workmanager para execução periódica de tarefas.

## Fluxo de Tarefas em Background
- Inicialização na classe Main do projeto.
- Configuração para execução a cada 15 minutos.
- Busca de dados de intenção de compra no banco de dados.
- Requisição no endpoint definido para post.

## Estado Atual do Projeto
- Desenvolvimento baseado em conceitos de Arquitetura Limpa e Código Limpo.
- Interface inspirada no site da WS Work.
- Refatoração em andamento para melhorias.

## Melhorias Pendentes
- Criação de testes de integração e unitários.
- Implementação de Envs para diferenciar ambientes de desenvolvimento e proteger dados sensíveis como keys, por exemplo.
- Adição de validadores globais de inputs.
- Criação de classes para conter as Cores da Aplicação e caminhos de assets.
- Implementação de um RestClient para centralizar requisições HTTP.

## Conclusão
O projeto WS Cars apresenta funcionalidades implementadas e está em constante evolução.
Lembrando que a aplicação necessita de uma refatoração (Que está acontecendo no mesmo momento que escrevo essa mensagem).

