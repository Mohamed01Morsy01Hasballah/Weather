class WeatherModel{
  String? date;
  double? temp ;
  double? mintemp;
  double? maxtemp;
  String? WeatherStateName;
  String? city;
  String? image;

  WeatherModel.fromJson(Map<String,dynamic> data){
    var Json=data['forecast']['forecastday'][0]['day'];
    city=data['location']['name'];
    date=data['location']['localtime'];
    temp=data['forecast']['forecastday'][0]['day']['avgtemp_c'] ;
     mintemp=Json['mintemp_c'];
    maxtemp=Json['maxtemp_c'];
    WeatherStateName=data['forecast']['forecastday'][0]['day']['condition']['text'];
    image=Json['condition']['icon'];
  }
  
}