
class WeatherDayObject{

  final double maxTemp;
  final double uv;
  final String datetime;

  WeatherDayObject({this.maxTemp, this.uv, this.datetime});

  WeatherDayObject.fromJson(Map<String, dynamic> json)
      : maxTemp = json['max_temp'].toDouble(),
        uv = json['uv'],
        datetime = json['datetime'];

  Map<String, dynamic> toJson() => {
        'max_temp': maxTemp,
        'uv': uv,
        'datetime': datetime,
      };

}