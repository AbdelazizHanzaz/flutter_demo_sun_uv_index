

class Countries {
  Map<String, dynamic> countriesMap;
  

  Countries({this.countriesMap});

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      countriesMap: json,
    );
  }

 
}
