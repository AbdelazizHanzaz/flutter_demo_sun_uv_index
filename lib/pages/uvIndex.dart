import 'package:flutter/material.dart';

class UvIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Index UV", style: TextStyle(
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(1, 1),
            ),
          ],
        )),
        //centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  buildRange(Colors.green, 20, '1-2'),
                  buildRange(Colors.yellow, 40, '3-5'),
                  buildRange(Colors.orange, 60, '6-7'),
                  buildRange(Colors.red, 80, '8-10'),
                  buildRange(Colors.purple, 100, '11+'),
                ],
              ),
            ),
            Divider(),
             buildExpanation(Colors.green, 'Low'),
             buildExpanation(Colors.yellow, 'Medium'),
              buildExpanation(Colors.orange, 'Hight'),
               buildExpanation(Colors.red, 'Very Hight'),
                buildExpanation(Colors.purple, 'Extreme'),
          ],
        ),
      ),
    );
  }

  Widget buildRange(Color color, double height, String rang) {
    return Container(
      child: Center(
        child: Text(
          rang,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, 
          shadows: [
            Shadow(color: Colors.black, offset: Offset(1, 1)),
          ]
          ),
          
        ),
      ),
      color: color,
      height: height,
      width: 40,
    );
  }
  Widget buildExpanation(Color color, String text){
    return  ListTile(
                      title: Text(text , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      leading: Icon(Icons.flag, color: color,),    
                    );
  }
}
