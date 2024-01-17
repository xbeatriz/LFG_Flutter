import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto/pages/myEvent.dart';
import 'package:projeto/pages/widgets/baseWidget.dart';
import 'package:projeto/pages/widgets/dropdownInput.dart';
import 'package:projeto/pages/widgets/inputText.dart';
import 'package:projeto/pages/widgets/selectedDate.dart';
import 'package:projeto/pages/widgets/selectedTime.dart';

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
  // LatLng? selectedLocation;

  // Valores para o dropdown de jogos
  List<String> games = ['Jogo 1', 'Jogo 2', 'Jogo 3'];
  String selectedGame = 'Jogo 1';

  // Variável onde guarda a Data e hora selecionadas
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

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
              DateTimePicker(
                  text: "Date",
                  initialDateTime: selectedDate,
                  onDateTimeSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  }),
              SizedBox(height: 16.0),
              TimePicker(
                text: "Hora",
                initialTime: selectedTime,
                onTimeSelected: (newTime) {
                  setState(() {
                    selectedTime = newTime;
                  });
                },
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
                  // Navegar para a página Profile no índice 3 do BottomNavigationBar
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BaseWidget(
                        currentPageIndex:
                            3), // Define o índice para 3 (Profile)
                  ));
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
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
