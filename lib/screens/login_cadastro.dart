import 'package:flutter/material.dart';



class LoginCadastro extends StatefulWidget {
  @override
  State<LoginCadastro> createState() => _LoginCadastroState();
}


class _LoginCadastroState extends State<LoginCadastro> {
  final TextEditingController _u = TextEditingController();
  final TextEditingController _p = TextEditingController();
  void _e() => Navigator.pushReplacementNamed(context, '/calendario');
  void _c() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('usuario criado')));
    Navigator.pushReplacementNamed(context, '/calendario');

  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
  appBar: AppBar(title: Text('minha agenda'), backgroundColor: Color(0xFFFFCC80)),
      body: Center(
        child: Container(
          width: 320,
          padding: EdgeInsets.all(12),
          color: Colors.white,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('entrar / cadastrar'),
            TextField(controller: _u, decoration: InputDecoration(labelText: 'usuario')),
            TextField(controller: _p, decoration: InputDecoration(labelText: 'senha'), obscureText: true),
            Row(children: [
              Expanded(child: ElevatedButton(onPressed: _e, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFCC80)), child: Text('entrar'))),
              SizedBox(width: 8),
              Expanded(child: ElevatedButton(onPressed: _c, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFCC80)), child: Text('cadastrar'))),
            ])

          ]),

        ),

      ),
    );
  }
}











