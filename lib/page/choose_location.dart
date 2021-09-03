import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import  'package:world_time/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', u: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'greece.png', u: 'Europe/Athens'),
    WorldTime(location: 'Berlin', flag: 'germany.png', u: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', u: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', u: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', u: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'usa.png', u: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', u: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', u: 'Asia/Jakarta'),
    WorldTime(location: 'Kolkata', flag: 'india.jpg', u: 'Asia/Kolkata')
  ];

void updateTime(index)async{
  WorldTime instance = locations[index];
  await instance.getTime(Future);
  //navigate to home
  Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDayTime':instance.isDayTime,
  });

}
  @override
  Widget build(BuildContext context) {
   // print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
      ),
      body:
        ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('Assets/${locations[index].flag}'),
                  ),
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location
                ),
              ),
              ),
            );
          },
        ),
    );
  }
}
