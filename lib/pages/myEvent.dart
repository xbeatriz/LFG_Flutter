import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  String selectedCategory =
      'Os Meus Eventos'; // Inicialmente, 'Os Meus Eventos'

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
              color: Colors.grey, // Cor de fundo do contêiner
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Define a categoria selecionada como "Os Meus Eventos"
                      setState(() {
                        selectedCategory = 'Os Meus Eventos';
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'Os Meus Eventos'
                            ? Color(0xFF000B45)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Os Meus Eventos",
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
                      // Define a categoria selecionada como "Favoritos"
                      setState(() {
                        selectedCategory = 'Favoritos';
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: selectedCategory == 'Favoritos'
                            ? Color(0xFF000B45)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Favoritos",
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
          // Adicione o restante do conteúdo aqui, dependendo da categoria selecionada
          // (Os Meus Eventos ou Favoritos)
          // Neste exemplo, vou exibir uma ListView.builder simples com mensagens fictícias.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informações sobre ${selectedCategory}:",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "${selectedCategory} - Item ${index + 1}",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
