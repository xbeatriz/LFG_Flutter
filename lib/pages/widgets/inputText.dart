import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  String text;
  TextEditingController controller;

  InputText({super.key, required this.text, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            // labelText: 'Nome do Evento',
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
