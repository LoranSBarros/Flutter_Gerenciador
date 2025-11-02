class Tarefa {
  String titulo;
  DateTime data;
  bool concluida;


  Tarefa({required this.titulo, required this.data, this.concluida = false});
}



class TarefaStore {
  static final Map<String, List<Tarefa>> _map = {};


  static String _key(DateTime d) => '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';


  static List<Tarefa> obter(DateTime d) {  
    final k = _key(d);
    final list = _map[k] ?? [];
    list.sort((a, b) {
      if (a.concluida != b.concluida) return a.concluida ? 1 : -1;
      return a.titulo.toLowerCase().compareTo(b.titulo.toLowerCase());
    });
    return List.from(list);
  }


  static void adicionar(Tarefa t) {
    final k = _key(t.data);
    _map.putIfAbsent(k, () => []);
    _map[k]!.add(t);
  }


  static void remover(Tarefa t) {
    final k = _key(t.data);
    _map[k]?.remove(t);
  }


  static void alternar(Tarefa t) {
    t.concluida = !t.concluida;
  }
} 





