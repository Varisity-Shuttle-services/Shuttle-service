import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack (
        children :<Widget>[
          Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
      ),
      Container(
        height: double.infinity ,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding : EdgeInsets.symmetric(
            horizontal : 40.0,
            vertical : 120.0,
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign in',
                style: TextStyle(
                  color :Colors.white, 
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                  ),
              ),
            ],
          ),

        ),
        

      )
      ],
      ),
        
      );
  }
}