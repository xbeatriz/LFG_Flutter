import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Informações do perfil
  String userName = "Nome do Utilizador";
  String userEmail = "usuario@example.com";
  String registrationDate = "01 de janeiro de 2022";
  String userDescription =
      "Bem-vindo ao meu perfil! Estou explorando o mundo do Flutter.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        backgroundColor: Color(0xFF000B45),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem do usuário (pode ser uma foto de perfil)
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Substitua pela URL da imagem do usuário
            ),
            SizedBox(height: 16.0),

            // Nome do usuário
            Text(
              userName,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // Email do usuário
            Text(
              'Email: $userEmail',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),

            // Data de registro
            Text(
              'Data de Registro: $registrationDate',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

            // Descrição do usuário
            Text(
              'Sobre Mim:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              userDescription,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
