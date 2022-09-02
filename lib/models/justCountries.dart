
class AllCountries{

   final List<JustCountries> all;

   AllCountries({this.all});

   factory AllCountries.fromJson(List<dynamic> all){
     
        return AllCountries(
          all: all.map((i)=> JustCountries.fromJson(i)).toList(),
        );

   }



}




class JustCountries{
  

  final String name ; 
  final String dialCode;
  final String code;

  JustCountries({this.name,this.dialCode, this.code});

  factory JustCountries.fromJson(Map<String, dynamic> json){

       return JustCountries(
         name: json['name'] as String,
         dialCode: json['dial_code'] as String,
         code: json['code'] as String

       );
  }




}