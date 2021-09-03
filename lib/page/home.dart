import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override

  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:(ModalRoute.of(context)!.settings.arguments) as Map; //
    print(data);
    String bgImage = data['isDayTime']?'day.png':'night.png';
    Color bgColor = data['isDayTime']?Colors.blue:Colors.indigo;
    return Scaffold(
        backgroundColor: bgColor,
      body:
      SafeArea(
        child:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: ()async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data={
                           'time' : result['time'],
                           'isDayTime' : result['isDayTime'],
                           'location': result['location'],
                           'flag' : result['flag'],
                         } ;
                       });
                      },

                    icon: Icon(Icons.edit_location,
                        color: Colors.grey[300],
                    ),
                      label: Text('Edit Location',
                      style: TextStyle(color: Colors.grey[300]),), ),
                SizedBox(height: 20),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),

                ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    )
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}