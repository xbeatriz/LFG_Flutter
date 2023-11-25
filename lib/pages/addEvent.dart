import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto/pages/myEvent.dart';
import 'package:projeto/pages/widgets/dropdownInput.dart';
import 'package:projeto/pages/widgets/inputText.dart';

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

  String getDate() {
    return DateFormat("dd-MM-yyyy").format(selectedDate);
  }

  // Data e hora selecionadas
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Função para exibir o botão de data
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

  // Função para exibir o botão de hora
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
              InputText(
                  text: "Nome do Evento", controller: eventNameController),
              SizedBox(height: 16.0),
              DropdownInput(
                text: "Jogo",
                selectedGame: selectedGame,
              ),
              SizedBox(height: 16.0),
              InputText(text: "UserName", controller: userNameController),
              SizedBox(height: 16.0),
              Text(
                "Date",
                style: TextStyle(
                  fontSize: 18.0,
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
                      'Data: ${getDate()}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                "Hora",
                style: TextStyle(
                  fontSize: 18.0,
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
              InputText(text: "Age Limit", controller: ageLimitController),
              SizedBox(height: 16.0),
              InputText(text: "Local", controller: localController),
              SizedBox(height: 16.0),
              InputText(
                text: "Descrição",
                controller: descriptionController,
                maxLines: 3,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyEvents()), //!Não funciona
                  );
                  //! Lógica para salvar os dados
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
