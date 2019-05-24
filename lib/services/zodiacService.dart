class Zodiac {
  String _sign="";

  String getSign(String dob) {
    List<String> tokens =dob.split("/");
    int day = int.parse(tokens[0]);
    int month = int.parse(tokens[1]);
    
    if (month == 1) {
        if (day < 20)
          _sign = "Capricorn";
        else
          _sign = "Aquarius";
    } else if (month == 2) {
        if (day < 19)
          _sign = "Aquarius";
        else
          _sign = "Pisces";
    } else if(month == 3) {
        if (day < 21)
          _sign = "Pisces";
        else
          _sign = "Aries";
    } else if (month == 4) {
        if (day < 20)
          _sign = "Aries";
        else
          _sign = "Taurus";
    } else if (month == 5) {
        if (day < 21)
          _sign = "Taurus";
        else
          _sign = "Gemini";
    } else if( month == 6) {
        if (day < 21)
          _sign = "Gemini";
        else
          _sign = "Cancer";
    } else if (month == 7) {
        if (day < 23)
          _sign = "Cancer";
        else
          _sign = "Leo";
    } else if( month == 8) {
        if (day < 23) 
          _sign = "Leo"; 
        else
          _sign = "Virgo";
    } else if (month == 9) {
        if (day < 23)
          _sign = "Virgo";
        else
          _sign = "Libra";
    } else if (month == 10) {
        if (day < 23)
          _sign = "Libra";
        else
          _sign = "Scorpio";
    } else if (month == 11) {
        if (day < 22)
          _sign = "scorpio";
        else
          _sign = "Sagittarius";
    } else if (month == 12) {  
        if (day < 22)
          _sign = "Sagittarius"; 
        else
          _sign ="Capricorn";
    }
    return _sign;
  }
}