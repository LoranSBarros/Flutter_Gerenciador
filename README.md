Foi desenvolvido um app simples chamado "Minha agenda", que  conta com uma tela de login/cadastro simulada, um calendário onde é possível selecionar o dia e gerenciar as tarefas do dia, podendo adicionar novas tarefas, remover ou marcar como feitas. Essas são as principais estruturas usadas:

main.dart: define rotas e inicializa  o app
login_cadastro.dart: tela para entrar ou cadastrar, em seguida direciona ao calendário
calendario.dart: usa table_calendar  para selecionar a data e passar para a lista de tarefas
lista_tarefas.dart: mostra as tarefas do dia, permitindo adicionar via dialog, remover ou marcar como concluída.
tarefa.dart: define Tarefa e TarefaStore, que é uma classe com a função de armazenar e gerenciar as tarefas do aplicativo. obtendo as  tarefas, há uma ordenação onde tarefas pendentes aparecem primeiro, e existe uma divisão  de grupo orientada pela ordem alfabética.

Na atividade, exercitei o conceito de  organização de telas e a manter a lógica de armazenamento separada do visual.

Não havendo opção  de anexo para essa atividade no AVA, no repositório GitHub, além dos arquivos com códigos, terá uma pasta com prints do projeto, conforme solicitado.
