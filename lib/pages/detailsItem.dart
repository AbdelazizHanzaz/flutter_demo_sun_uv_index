import 'package:checktemp_v1/models/weather.dart';
import 'package:checktemp_v1/pages/uvIndex.dart';
import 'package:flutter/material.dart';

class DetailsItemCard extends StatelessWidget {
  //final WeatherDayObject weatherDayObject;
  final Weather weather;
  final int index;
  DetailsItemCard({this.weather, this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More details'),
       ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0, right: 8, top: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text("My Location"),
                subtitle: Text('${weather.cityName},${weather.countryCode}'),
                leading: Icon(Icons.location_city, color: Colors.lightGreen,),
              ),
              ListTile(
                title: Text("Date"),
                subtitle: Text(weather.data[index].datetime),
                leading: Icon(Icons.calendar_today, color: Colors.blueGrey),
              ),
              ListTile(
                title: Text("Max temperature"),
                subtitle: Text('${weather.data[index].maxTemp.ceil()} °C'),
                leading: Icon(Icons.wb_sunny, color: Colors.orange),
              ),
              ListTile(
                title: Text("UV Rays Index"),
                subtitle: Text("Index uv : ${weather.data[index].uv.ceil()}"),
                leading: Icon(Icons.flag, color: getColorByIndexUv(weather.data[index].uv.ceil())),
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> UvIndex())),
                trailing: Icon(Icons.arrow_forward),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
  Color getColorByIndexUv(int indexUV){
    var color;
    if(indexUV<3){
      color = Colors.green;
    }else if(indexUV<6){
      color = Colors.yellow;
    }else if(indexUV<8){
      color = Colors.orange;
    }else if(indexUV<11){
      color = Colors.redAccent;
    }else{
      color = Colors.red;
    }
    return color;

  }
}
