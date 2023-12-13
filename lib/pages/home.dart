import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  // Simulação de dados da API
  String imageUrl = "https://via.placeholder.com/100";
  String eventTitle = "Título do Evento";
  String userName = "Nome do Utilizador";
  String dateAndTime = "Data / Hora";
  String discordAccount = "SeuDiscord#1234";
  String gameName = "Nome do Jogo";
  String ageLimit = "18+";
  String description = "Descrição do evento...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color(0xFF000B45),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: 380,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: const Color.fromARGB(255, 0, 0, 0)),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search a game event',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          GestureDetector(
              onTap: () {
                _showEventDetails(context);
              },
              child: Container(
                height: 130,
                //width: 380,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF000B45),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0)
                          .withOpacity(0.2), // Cor da sombra
                      spreadRadius: 5, // Raio de propagação da sombra
                      blurRadius: 2, // Raio de desfoque da sombra
                      offset: Offset(
                          0, 3), // Deslocamento da sombra em relação ao widget
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              eventTitle,
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              userName,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          Text(
                            dateAndTime,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void _showEventDetails(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      //!ANIMAÇÃO
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: 0.0, end: 1.0);
        var scaleAnimation = animation.drive(tween);
        return ScaleTransition(
            scale: scaleAnimation,
            child: Dialogs(
                eventTitle: eventTitle,
                imageUrl: imageUrl,
                userName: userName,
                dateAndTime: dateAndTime,
                discordAccount: discordAccount,
                gameName: gameName,
                ageLimit: ageLimit,
                description: description));
      },
    );
  }
}

class Dialogs extends StatelessWidget {
  const Dialogs({
    super.key,
    required this.eventTitle,
    required this.imageUrl,
    required this.userName,
    required this.dateAndTime,
    required this.discordAccount,
    required this.gameName,
    required this.ageLimit,
    required this.description,
  });

  final String eventTitle;
  final String imageUrl;
  final String userName;
  final String dateAndTime;
  final String discordAccount;
  final String gameName;
  final String ageLimit;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF000B45),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventTitle,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Nome do Utilizador: $userName",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Data / Hora: $dateAndTime",
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 8.0),
                  Text("Informações Adicionais:",
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Discord account: $discordAccount",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Nome do jogo: $gameName",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Idade limite: $ageLimit",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Descrição: $description",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ));
  }
}
