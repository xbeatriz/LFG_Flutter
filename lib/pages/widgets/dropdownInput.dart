import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  final String text;
  final String selectedGame;

  DropdownInput({Key? key, required this.text, required this.selectedGame})
      : super(key: key);

  @override
  _DropdownInputState createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  // Valores para o dropdown de jogos
  List<String> games = ['Jogo 1', 'Jogo 2', 'Jogo 3'];
  late String selectedGame;

  @override
  void initState() {
    super.initState();
    selectedGame = widget.selectedGame;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedGame,
          onChanged: (value) {
            setState(() {
              selectedGame = value!;
            });
          },
          items: games.map((game) {
            return DropdownMenuItem<String>(
              value: game,
              child: Text(game),
            );
          }).toList(),
          decoration: InputDecoration(
            // labelText: 'Jogo',
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFF000B45),
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFF000B45),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFF000B45),
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
