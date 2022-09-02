import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:checktemp_v1/models/country.dart';

Future<CountryList> loadJSONFromAsset() async {
  final jsonString = await rootBundle.loadString('assets/countries.json');
  final jsonResponse = json.decode(jsonString);
  return new CountryList.fromJson(jsonResponse);
}


class NewLocation extends StatefulWidget {
  @override
  _NewLocationState createState() => _NewLocationState();
}

class _NewLocationState extends State<NewLocation> {
  String _countryName;
  Country _country;
  //JustCountries _justCountries = new JustCountries();
  String _cityName;
  bool _isGPSEnabled = false;
  var ct;
  List<String> cities;
  String dropdownValue = 'One';
  

  @override
  Widget build(BuildContext context) {
    //Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Change place", style: TextStyle(
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(1, 1),
            ),
          ],
        )),
        //centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: loadJSONFromAsset(),
          builder: (context, AsyncSnapshot<CountryList> snapshot) {
            if (snapshot.hasData) {
              List<Country> countries = snapshot.data.countries;
                  return Card(
                      elevation: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SwitchListTile(
                            title: Text("Enable GPS"),
                            onChanged: (val){
                              setState(() {
                                  _isGPSEnabled = val;
                              });
                            },
                            value: _isGPSEnabled,
                          ),
                          Padding(
                          padding: const EdgeInsets.all(16.0),
                            child: DropdownButton<Country>(
                              hint: Text("Select your country"),
                              isExpanded: true,
                              value: _country == null? null: countries[0],
                              onChanged: (Country val){
                                setState(() {
                                  _country = val;
                                });
                              },
                              items: countries.map<DropdownMenuItem<Country>>((val){
                                return DropdownMenuItem<Country>(
                                  value: val,
                                  child: Text(val.countryName),
                                );
                              })
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: RaisedButton(
                              color: Colors.deepPurple,
                              onPressed: ()=> print('test'),
                              child: Text("Show Calendar", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                  );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
