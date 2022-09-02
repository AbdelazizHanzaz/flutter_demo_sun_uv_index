import 'dart:convert';
import 'package:checktemp_v1/pages/detailsItem.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/weather.dart';
import 'models/weatherDayObject.dart';

Future<Weather> fetchWeather(String place) async {
  final response = await http.get(
      'https://api.weatherbit.io/v2.0/forecast/daily?$place&key=48fce4246f254a048c717e84167ff3da');

  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else
    throw Exception("Failed load weather");
}

class Calendar extends StatefulWidget {
  final String place;
  Calendar({this.place});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text("Calendar", style: TextStyle(
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(1, 1),
            ),
          ],
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () =>print('nice') //_awaitReturnValueFromNewLocation(context),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => print("More settings"),
          ),
        ],
      ),
      body: Center(
        child: widget.place.isNotEmpty
            ? FutureBuilder(
                future: fetchWeather(widget.place),
                builder: (context, snapshot) {
                  Weather weather = snapshot.data;
                  if (snapshot.hasData) {
                    return GridView.count(
                        crossAxisCount: 4,
                        children: List.generate(
                             weather.data.length,
                            (index) => buildItemCard(weather, index)));
                  }
                  return CircularProgressIndicator();
                },
              )
            : Text("Calander is empty!")),
    );
    
    
    
  }
  //  void _awaitReturnValueFromNewLocation(BuildContext context) async {
  //   final result = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => NewLocation(),
  //       ));
  //   if (result != null) {
  //     setState(() {
  //       place = result;
  //     });
  //   }
  // }

  Widget buildItemCard(Weather weather, int index) {
    List<WeatherDayObject> listObject = weather.data;
    Color _color;
    int maxTemp = listObject[index].maxTemp.ceil();
    DateTime date = DateTime.parse(listObject[index].datetime);
    String dayName = DateFormat('EE').format(date);
    String numDayAndMonthName = DateFormat('dd MMM').format(date);

    if (maxTemp > 29) {
      _color = Colors.red;
    } else if (maxTemp > 24) {
      _color = Colors.orange;
    } else {
      _color = Colors.grey;
    }

    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DetailsItemCard(
                    weather : weather,
                    index : index,
                  ))),
      splashColor: _color,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                dayName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(numDayAndMonthName, style: TextStyle(fontSize: 13)),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$maxTemp °C'),
                  Icon(
                    Icons.wb_sunny,
                    color: _color,
                    size: 16,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
