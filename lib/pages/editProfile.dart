import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projeto/pages/widgets/inputText.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController userAgeController = TextEditingController();

  TextEditingController UserNameController = TextEditingController();

  TextEditingController userBioController = TextEditingController();

  TextEditingController userDiscordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Chame a função que verifica e solicita as permissões aqui
    checkAndRequestPermissions();
  }

  Future<void> checkAndRequestPermissions() async {
    // Verifique e solicite permissões necessárias aqui
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.location,
    ].request();

    if (statuses[Permission.camera] == PermissionStatus.denied) {
      // Lógica adicional para lidar com a recusa da permissão da câmera
    }

    if (statuses[Permission.location] == PermissionStatus.restricted) {
      // Lógica adicional para lidar com restrições de localização
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Color(0xFF000B45),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputText(text: "Name", controller: userNameController),
              SizedBox(height: 16.0),
              InputText(text: "UserName", controller: UserNameController),
              SizedBox(
                height: 16.0,
              ),
              InputText(text: "Age", controller: userAgeController),
              SizedBox(
                height: 16.0,
              ),
              InputText(
                text: "Bio",
                controller: userBioController,
                maxLines: 3,
              ),
              SizedBox(
                height: 16.0,
              ),
              InputText(
                  text: "Discord Account", controller: userDiscordController),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    List<Media>? results = await ImagesPicker.pick(
                      pickType: PickType.image,
                    );
                  },
                  child: Text("GALERIA")),
              ElevatedButton(
                  onPressed: () {
                    ImagesPicker.openCamera(
                      pickType: PickType.image,
                      //maxTime: 15, // record video max time
                    );
                  },
                  child: Text("CAMARA")),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
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
