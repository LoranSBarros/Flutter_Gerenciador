import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tarefa.dart';




class ListaTarefas extends StatefulWidget {
  final DateTime data;
  ListaTarefas({required this.data});


  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}


class _ListaTarefasState extends State<ListaTarefas> {
  final TextEditingController _ctrl = TextEditingController();


  void _atualizar() => setState(() {});


  Future<void> _mostrarAdicionar() async {
    _ctrl.clear();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: Text('nova tarefa'),
        content: TextField(controller: _ctrl, autofocus: true, decoration: InputDecoration(labelText: 'titulo')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('cancelar')),
          TextButton(onPressed: () {
            final t = _ctrl.text.trim();
            if (t.isNotEmpty) TarefaStore.adicionar(Tarefa(titulo: t, data: widget.data));
            Navigator.pop(context);
            _atualizar();
          }, child: Text('adicionar'))
        ],

      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final tarefas = TarefaStore.obter(widget.data);
    return Scaffold(
  appBar: AppBar(title: Text('tarefas ${DateFormat('dd/MM/yyyy').format(widget.data)}'), backgroundColor: Color(0xFFFFCC80)),
      body: Column(children: [
        Expanded(
          child: tarefas.isEmpty
              ? Center(child: Text('nenhuma tarefa'))
              : ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (_, i) {
                    final t = tarefas[i];
                    return Container(
                      padding: EdgeInsets.all(8),
                      child: Row(children: [
                        Checkbox(value: t.concluida, onChanged: (_) { TarefaStore.alternar(t); _atualizar(); }),
                        Expanded(child: Text(t.titulo, style: TextStyle(decoration: t.concluida ? TextDecoration.lineThrough : null))),
                        IconButton(icon: Icon(Icons.delete), onPressed: () { TarefaStore.remover(t); _atualizar(); })
                      ]),
                    );
                  },
                ),
        ),
        Row(children: [
          Expanded(child: ElevatedButton(onPressed: _mostrarAdicionar, child: Text('adicionar'), style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFCC80))))
        ])
      ]),

    );

  }
}








