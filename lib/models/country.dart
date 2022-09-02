
class CountryList{

final List<Country> countries;

CountryList({this.countries});

factory CountryList.fromJson(List<dynamic> parsedJson) {
  
    return new CountryList(
       countries : parsedJson.map((i)=>Country.fromJson(i)).toList(),
    );
  }



}


class Country{

  final String countryName;
  final String codeIso;
  final List<String> cities;

 Country({this.countryName, this.codeIso, this.cities});


  factory Country.fromJson(Map<String, dynamic> json) {

    var cities = json['cities'];
    List<String> listCities = new List<String>.from(cities);
    
    return Country(
      countryName : json['countryName'] as String,
      codeIso : json['codeIso'] as String,
      cities : listCities,
    );
  }

}