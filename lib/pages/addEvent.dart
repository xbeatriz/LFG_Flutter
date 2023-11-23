import 'package:flutter/material.dart';
import 'package:projeto/pages/myEvent.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  // Controllers para os campos de input
  TextEditingController eventNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageLimitController = TextEditingController();
  TextEditingController localController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Valores para o dropdown de jogos
  List<String> games = ['Jogo 1', 'Jogo 2', 'Jogo 3'];
  String selectedGame = 'Jogo 1';

  // Data e hora selecionadas
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Função para exibir o seletor de data
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      // Atualizar apenas a data, mantendo a hora inalterada
      setState(() {
        selectedDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          selectedTime.hour,
          selectedTime.minute,
        );
      });
    }
  }

  // Função para exibir o seletor de hora
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (picked != null) {
      // Atualizar apenas a hora, mantendo a data inalterada
      setState(() {
        selectedTime = picked;
        selectedDate = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adiciona Eventos"),
        backgroundColor: Color(0xFF000B45),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nome do Evento",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: eventNameController,
                decoration: InputDecoration(
                  // labelText: 'Nome do Evento',
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Mostrar rótulo acima do campo
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
              SizedBox(height: 16.0),
              Text(
                "Jogo",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
              SizedBox(height: 16.0),
              Text(
                "Nome do Utilizador",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  // labelText: 'Nome do Evento',
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Mostrar rótulo acima do campo
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
              SizedBox(height: 16.0),
              Text(
                "Date",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000B45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      minimumSize: Size(150.0, 0),
                    ),
                    child: Text('Selecionar Data'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Data: ${selectedDate.toLocal()}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                "Hora",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF000B45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      minimumSize: Size(150.0, 0),
                    ),
                    child: Text('Selecionar Hora'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      'Hora: ${selectedTime.format(context)}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                "Age Limit",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: ageLimitController,
                decoration: InputDecoration(
                  // labelText: 'Nome do Evento',
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Mostrar rótulo acima do campo
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
              SizedBox(height: 16.0),
              Text(
                "Local",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: localController,
                decoration: InputDecoration(
                  // labelText: 'Nome do Evento',
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Mostrar rótulo acima do campo
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
              SizedBox(height: 16.0),
              Text(
                "Descrição",
                style: TextStyle(
                  fontSize:
                      18.0, // Altere o tamanho do texto conforme necessário
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  //labelText: 'Descrição',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyEvents()),
                  );
                  // Lógica para salvar os dados
                  print('Dados Salvos!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF000B45),
                  foregroundColor: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
                child: Container(
                  height: 36,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
