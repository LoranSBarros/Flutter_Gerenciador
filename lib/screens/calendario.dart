import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';



class Calendario extends StatefulWidget {
  @override
  State<Calendario> createState() => _CalendarioState();
}


class _CalendarioState extends State<Calendario> {
  DateTime _focused = DateTime.now();
  DateTime _selecionada = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: Text('calendario'), backgroundColor: Color(0xFFFFCC80)),
      body: Column(children: [
        TableCalendar(
          locale: 'pt_BR',
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focused,
          selectedDayPredicate: (d) => isSameDay(d, _selecionada),
          headerStyle: HeaderStyle(titleCentered: true, formatButtonVisible: false),
          onDaySelected: (s, f) => setState(() { _selecionada = s; _focused = f; }),
        ),
  Text('data: ${DateFormat('dd/MM/yyyy').format(_selecionada)}'),
  ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/tarefas', arguments: _selecionada), child: Text('ver tarefas'), style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFCC80)))
      ]),

    );
  }

}



