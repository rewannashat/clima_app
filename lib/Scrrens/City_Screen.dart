import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Location_Screen.dart';
class cityScreen extends StatefulWidget {
  @override
  _cityScreenState createState() => _cityScreenState();
}

class _cityScreenState extends State<cityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 30,
        ),
      ),
      body: Stack(

        children: [
          Container(
           color: Color(0xFF6200EE),
        ),
          Container(
            margin: EdgeInsets.only( top: 10,left: 20 , right: 20, ),
            child: Column(
              children: [
                SizedBox(height: 140,),
                   TextField(
                     style: TextStyle(
                       color: Colors.black,
                     ),
                      decoration: InputDecoration(
                        filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.location_city , color: Colors.white, size: 30,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                       hintText: 'Enter city name' , hintStyle: TextStyle(
                        color: Colors.grey,
                      ),

                      ),
                     onChanged: (value){
                      cityName  = value ;
                     },
                      ),
                 SizedBox(height: 20,),
                 Center(
                   child: FlatButton(onPressed: (){
                     Navigator.pop(context, cityName);
                   },
                       child: Text('Get Weather' , style: TextStyle(
                         color: Colors.white,
                         fontSize: 25 ,
                       ),),
                     color: Color(0xF6200EE),
                     height: 60,
                     minWidth: 12,
                     splashColor: Colors.grey,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                   ),
                 ),
              ],
            ),
          ),
    ],
      ),
    );
  }
}
