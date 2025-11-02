import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'screens/login_cadastro.dart';
import 'screens/calendario.dart';
import 'screens/lista_tarefas.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(App());
}



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  title: 'minha agenda',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFCC80),
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LoginCadastro(),
        '/calendario': (_) => Calendario(),
        '/tarefas': (ctx) {
          final args = ModalRoute.of(ctx)!.settings.arguments;
          if (args is DateTime) return ListaTarefas(data: args);
          return ListaTarefas(data: DateTime.now());
        },
      },
    );

  }
}






