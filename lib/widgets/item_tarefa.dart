import 'package:flutter/material.dart';




class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}



class _ListaTarefasState extends State<ListaTarefas> {
  final List<String> _tarefas = [];
  final TextEditingController _controller = TextEditingController();



  void _adicionarTarefa() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _tarefas.add(_controller.text);
      _controller.clear();
    });
  }


  void _removerTarefa(int i) {
    setState(() => _tarefas.removeAt(i));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: const Text('minhas tarefas'), backgroundColor: Colors.lightBlueAccent),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'nova tarefa',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _adicionarTarefa,
                ),

              ),

            ),
            const SizedBox(height: 20),
            Expanded(
              child: _tarefas.isEmpty
                  ? const Center(child: Text('nenhuma tarefa ainda.'))
                  : ListView.builder(
                      itemCount: _tarefas.length,
                      itemBuilder: (_, i) => Card(
                        child: ListTile(
                          title: Text(_tarefas[i]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removerTarefa(i),
                          ),

                        ),

                      ),
                    ),

            ),

          ],
        ),
      ),
    );

  }
}






