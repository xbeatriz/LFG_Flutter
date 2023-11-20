import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  // Nome de exemplo do usuário
  String userName = "Nome do Utilizador";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        backgroundColor: Color(0xFF000B45),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          child: Text("Perfil do Usuário"),
        ),
      ),
    );
  }
}
