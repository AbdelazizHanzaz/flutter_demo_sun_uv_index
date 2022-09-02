import 'dart:async';

import 'package:checktemp_v1/pages/homePage.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 goToHomePage(){
     Timer(Duration(seconds: 1), ()=>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> HomePage()))
     );
 }

 @override
  void initState() {
    super.initState();
    goToHomePage();
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.deepPurple,
         child: Center(
           child: Row(
             children: <Widget>[
               Text("Check Weather",
                style: TextStyle(
                  color: Colors.yellow,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      offset: Offset(1, 3),
                    )
                  ]
                ),
               ),
               Text(' Index UV')
             ],
           ),
         ),
      )
    );
  }
}
