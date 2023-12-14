import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  String selectedCategory = 'Favorites';

  List<EventData> events = [
    EventData(
      imageUrl: 'assets/images/Valorant.png',
      eventTitle: 'TÍTULO DO EVENTO 1',
      userName: 'NOME DO USUÁRIO 1',
      dateAndTime: 'DATA E HORA 1',
    ),
    EventData(
      imageUrl: 'assets/images/Valorant.png',
      eventTitle: 'TÍTULO DO EVENTO 2',
      userName: 'NOME DO USUÁRIO 2',
      dateAndTime: 'DATA E HORA 2',
    ),
    // Adicione mais eventos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Os meus eventos"),
        backgroundColor: Color(0xFF000B45),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Container(
            height: 47,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Favorites';
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'Favorites'
                            ? Color(0xFF000B45)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Favorites",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Subscribed';
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'Subscribed'
                            ? Color(0xFF000B45)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Subscribed',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: EventCard(
                      imageUrl: events[index].imageUrl,
                      eventTitle: events[index].eventTitle,
                      userName: events[index].userName,
                      dateAndTime: events[index].dateAndTime,
                      discordAccount: '',
                      gameName: '',
                      ageLimit: '',
                      description: '',
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String eventTitle;
  final String userName;
  final String dateAndTime;
  final String discordAccount;
  final String gameName;
  final String ageLimit;
  final String description;

  EventCard({
    required this.imageUrl,
    required this.eventTitle,
    required this.userName,
    required this.dateAndTime,
    required this.discordAccount,
    required this.gameName,
    required this.ageLimit,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showEventDetails(context);
      },
      child: Container(
        height: 130,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF000B45),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 3),
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
                  image: AssetImage(imageUrl),
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
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      userName,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    dateAndTime,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEventDetails(BuildContext context) {
    PageRouteBuilder<dynamic> route = PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            children: [
              Container(
                height: 500,
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
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "Nome do Utilizador: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "$userName",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Adicione o restante do conteúdo conforme necessário
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
          ),
        );
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;
        var fadeTween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var fadeAnimation = animation.drive(fadeTween);
        return FadeTransition(
          opacity: fadeAnimation,
          child: Container(
            color: Colors.black
                .withOpacity(0.5), // Ajuste a opacidade conforme necessário
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
    Navigator.of(context).push(route);
  }
}

class EventData {
  final String imageUrl;
  final String eventTitle;
  final String userName;
  final String dateAndTime;

  EventData({
    required this.imageUrl,
    required this.eventTitle,
    required this.userName,
    required this.dateAndTime,
  });
}
