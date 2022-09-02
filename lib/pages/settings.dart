import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.deepPurple,
         child: Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text("°C Temperature",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(-2, -3),
                    ),
                  
                   
                  ]
                ),
               ),
               Text(' Index UV', style: TextStyle(color: Colors.black.withOpacity(0.4)),)
             ],
           ),
         ),
      );
  }
}