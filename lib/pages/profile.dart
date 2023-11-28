import 'package:flutter/material.dart';
import 'package:projeto/pages/splashscreen.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nome do Utilizador"),
        backgroundColor: Color(0xFF000B45),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _showSettingsMenu(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://via.placeholder.com/150'), // Substitua pela URL da imagem do USER
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Nome do user e Age do user
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nome do Utilizador",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ', ',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "25",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.0),
            // User discord
            Text(
              'Discord: @xuser #1234',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 8.0,
            ),

            // Email do user
            Text(
              'Email: usuario@example.com',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),

            // Descrição do user
            Text(
              'Sobre mim:\nBem-vindo ao meu perfil! Estou explorando o mundo do Flutter.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Configurações de Privacidade'),
              onTap: () {
                // Adicione a lógica para configurar a privacidade aqui
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
                // Fecha o menu inferior
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
