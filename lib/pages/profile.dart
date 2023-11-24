import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto/pages/splashscreen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Informações do perfil
  String userName = "Nome do Utilizador";
  String userAge = "25";
  String userEmail = "usuario@example.com";
  String userDiscord = "@xuser #1234";
  String userDescription =
      "Bem-vindo ao meu perfil! Estou explorando o mundo do Flutter.";

  // Estado para controlar o modo de edição
  bool isEditing = false;

  // Controller para os campos editáveis
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController discordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //! Função para abrir a câmera e selecionar uma imagem (ImagePicker)
  //! NÃO FUNCIONA
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      //Atualizar a imagem
      setState(() {
        // salvar a imagem no local (base de dados)
        // e atribuir o novo URL da imagem à variável que está sendo usada para exibi-la
        // imageUrl = pickedFile.path;
      });
    }
  }

  void _showSettingsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editar Perfil'),
              onTap: () {
                //! Adicionar a lógica para editar o perfil aqui
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Configurações de Privacidade'),
              onTap: () {
                //! Adicionar a lógica para configurar a privacidade aqui
                Navigator.pop(context);
              },
            ),
            //!LOG OUT
            //!NÃO FUNCIONA
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
                //! Fecha o menu inferior
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

//! Editar dados
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        backgroundColor: Color(0xFF000B45),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              // Alternar entre os modos de edição e visualização
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
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
            GestureDetector(
              onTap: isEditing ? _pickImage : null,
              child: Container(
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
            ),
            SizedBox(height: 16.0),

            // Nome do user e Age do user
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ', ',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userAge,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.0),
            // User discord
            Text(
              'Discord: $userDiscord',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 8.0,
            ),

            // Email do user //!(não está editável, mas quero colocar)
            Text(
              'Email: $userEmail',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),

            // Descrição do user (editável)
            isEditing
                ? TextFormField(
                    controller: bioController,
                    decoration: InputDecoration(labelText: 'Bio'),
                  )
                : Text(
                    'Sobre mim:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
            SizedBox(height: 8.0),
            isEditing
                ? TextFormField(
                    controller: TextEditingController(text: userDescription),
                    decoration: InputDecoration(labelText: 'Descrição'),
                  )
                : Text(
                    userDescription,
                    style: TextStyle(fontSize: 16.0),
                  ),
          ],
        ),
      ),
    );
  }
}
