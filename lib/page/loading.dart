import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import  'package:world_time/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
   void setupWorldTime() async
    {
      WorldTime instance = WorldTime(
          location: 'Kolkata', flag: 'india.jpg', u: 'Asia/Kolkata');
         await instance.getTime(Future);
          Navigator.pushReplacementNamed(context,'/home',arguments: {
            'location':instance.location,
            'flag':instance.flag,
            'time':instance.time,
            'isDayTime':instance.isDayTime,
          }
          );
    }

  int counter =0;
  @override
  void initState() {
    super.initState();
    setupWorldTime();
   // print('initState function run');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:
      Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

