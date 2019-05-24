class Horoscope {
  String horoscope;
  String sunsign;

  Horoscope({this.horoscope,this.sunsign});


  factory Horoscope.fromJson(Map<String, dynamic> parsedHoroscope){
      return Horoscope(
        horoscope: parsedHoroscope['horoscope'],
        sunsign : parsedHoroscope['sunsign']
      );
  }
}