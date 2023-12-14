import 'package:flutter/material.dart';
import 'package:projeto/pages/widgets/eventCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  //Simulação de dados da API
  String imageUrl = 'assets/image/Valorant.png';
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
          EventCard(
            imageUrl: 'assets/images/Valorant.png',
            eventTitle: 'TÍTULO DO EVENTO',
            userName: 'NOME DO USUÁRIO',
            dateAndTime: 'DATA E HORA',
            discordAccount: 'SeuDiscord#1234',
            gameName: 'Nome do Jogo',
            ageLimit: '18+',
            description: 'Descrição do evento...',
          ),
        ],
      ),
    );
  }
}

//       //!ANIMAÇÃO
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         var tween = Tween(begin: 0.0, end: 1.0);
//         var scaleAnimation = animation.drive(tween);
//         return ScaleTransition(
//             scale: scaleAnimation,
//             child: Dialogs(
//                 eventTitle: eventTitle,
//                 imageUrl: imageUrl,
//                 userName: userName,
//                 dateAndTime: dateAndTime,
//                 discordAccount: discordAccount,
//                 gameName: gameName,
//                 ageLimit: ageLimit,
//                 description: description));
//       },
//     );
//   }
// }