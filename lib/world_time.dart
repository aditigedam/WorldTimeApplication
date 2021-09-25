import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
 String location;
 String flag;
 String time = '4';
 String u;
 bool isDayTime = false;
 WorldTime({required this.location,required this.flag,required this.u});
 Future<void> getTime(void pop) async{
   try{
     Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/$u');
     Response response = await get(url);
     Map data = jsonDecode(response.body);
     String datetime = data['datetime'];
     DateTime now = DateTime.parse(datetime);
     // now =  now.add(Duration(hours: int.parse(offset)));
     String _hour = data["utc_offset"].substring(1,3);
     String _minute = data["utc_offset"].substring(4,6);
     now =  now.add(Duration(hours:int.parse(_hour),minutes: int.parse(_minute)));
     isDayTime = (now.hour>6 && now.hour<20)?true:false;
     time = DateFormat.jm().format(now);//set the time property
   }
   catch(e){
     print(e);
     time = 'could not get time';
   }
 }
}


