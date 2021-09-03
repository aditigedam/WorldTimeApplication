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
     String offset = data['utc_offset'].substring(1,3);
     DateTime now = DateTime.parse(datetime);
     now =  now.add(Duration(hours: int.parse(offset)));
     isDayTime = (now.hour>6 && now.hour<20)?true:false;
     time = DateFormat.jm().format(now);//set the time property
   }
   catch(e){
     print(e);
     time = 'could not get time';
   }
 }
}


