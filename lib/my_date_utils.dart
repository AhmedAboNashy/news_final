import 'package:intl/intl.dart';

class MyDateUtils{

 static String formatNewsDate(String inputDateString){
    // gaya pattern(string) b converte l DateFormate

    //da  kda el input date formate ely gay
   //"publishedAt": "2023-08-21T23:07:30Z",
    var inputDateFormatter=DateFormat('yyyy-MM-dThh:mm:ssZ');
    // hna 3awez a change l formate b el design ely ana 3awzoo
    var outputDateFormater=DateFormat('yyyy/MMM/dd hh:mm a');
    // mmm =august bdl number .... a = am
    var inputDate=inputDateFormatter.parse(inputDateString);
    //parse using b handle el string ely gay mn back l Design  ely ana 3mlto (inputDateformater=outputDateFormater)
var outPutDateString=outputDateFormater.format(inputDate);
//formate btrg3 String feeh el output b3d m 3mlt finish ana l design
return outPutDateString;
  }
}