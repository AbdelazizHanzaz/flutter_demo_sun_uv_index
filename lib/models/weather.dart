import 'weatherDayObject.dart';

class Weather{

  final List<WeatherDayObject> data;
  final String cityName;
  final String lon;
  final String timezone;
  final String lat;
  final String countryCode;
  final String stateCode;
  

  Weather(this.data, this.cityName, this.lon, this.timezone, this.lat, this.countryCode, this.stateCode);

  Weather.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List).map((i)=> WeatherDayObject.fromJson(i)).toList(),
        cityName = json['city_name'],
        lon = json['lon'].toString(),
        timezone = json['timezone'],
        lat = json['lat'].toString(),
        countryCode = json['country_code'],
        stateCode = json['state_code'];

  Map<String, dynamic> toJson() => {
        'data': data,
        'city_name': cityName,
        'lon': lon,
        'timezone':timezone,
        'lat': lat,
        'country_code': countryCode,
        'state_code': stateCode
      };



}
