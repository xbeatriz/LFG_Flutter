import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

enum LocationType { gps, online }

class LocationInput extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  LocationInput({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  LocationType selectedLocationType = LocationType.gps;

  Future<void> _getLocationFromGPS() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Atualize o controlador com a localização do GPS
      widget.controller.text =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    } catch (e) {
      // Trate erros ao obter a localização do GPS
      print(e.toString());
    }
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
        SizedBox(height: 4.0),
        Row(
          children: [
            DropdownButtonFormField<LocationType>(
              value: selectedLocationType,
              onChanged: (value) {
                setState(() {
                  selectedLocationType = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: LocationType.gps,
                  child: Text('GPS'),
                ),
                DropdownMenuItem(
                  value: LocationType.online,
                  child: Text('Online'),
                ),
              ],
            ),
            SizedBox(width: 16.0),
            if (selectedLocationType == LocationType.gps)
              ElevatedButton(
                onPressed: _getLocationFromGPS,
                child: Text('Obter do GPS'),
              )
            else
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
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
              ),
          ],
        ),
      ],
    );
  }
}
