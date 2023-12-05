import 'package:flutter/material.dart';
import 'package:projeto/pages/splashscreen.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Color(0xFF000B45),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                _showSettingsMenu(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: 500,
              height: 266,
              decoration: BoxDecoration(color: Color(0xFF000B45)),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 500,
                      height: 266,
                      decoration: BoxDecoration(color: Color(0xFF000B45)),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 94,
                    child: Container(
                      width: 380,
                      height: 122,
                      decoration: ShapeDecoration(
                        color: Color(0xBF5061BC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28,
                    top: 98,
                    child: SizedBox(
                      width: 355,
                      height: 99,
                      child: Text(
                        'Heyo, sou um fâ autêntico de Valorant! Crio sempre playlists para poder ouvir enquanto que jogo. \nSou mais do tipo indie em músicas e quero descobrir jogos novos.\nPara além disso, adoro programar e passear o meu cão.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 17,
                    child: SizedBox(
                      width: 123,
                      child: Text(
                        'Mark Volt',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 41,
                    child: Text(
                      '@mark21',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 58,
                    top: 232,
                    child: Text(
                      '@mark_21',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 60,
                    child: SizedBox(
                      width: 123,
                      child: Text(
                        '21, Porto',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 17,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/60x60"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 224,
                    child: Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.only(
                        top: 6,
                        left: 3,
                        right: 3,
                        bottom: 5.13,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 250,
                    top: 222,
                    child: Container(
                      width: 154,
                      height: 32,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Color(0xFF000B45)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Editar perfil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF000B45),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 197,
                    top: 40,
                    child: Container(
                      width: 71,
                      height: 37,
                      decoration: ShapeDecoration(
                        color: Color(0xBF5061BC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 320,
                    top: 40,
                    child: Container(
                      width: 75,
                      height: 41,
                      decoration: ShapeDecoration(
                        color: Color(0xBF5061BC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 203,
                    top: 44,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '21\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Followers',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    left: 330,
                    top: 44,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '40\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Following',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
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
