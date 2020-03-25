import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:varisty_shuttle_service/Animations/FadeAnimation.dart';
import 'package:varisty_shuttle_service/onboardingScreen.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3,9,23,1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(1.2, Text('Sign in',
            style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            ),
            SizedBox(height:30,),
            FadeAnimation(1.5, Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border : Border(bottom: BorderSide(color: Colors.grey[300]))
                  ),
                  child: TextField(
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      hintText: "Email"
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  ),
                  child: TextField(
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      hintText: "Password"
                    ),
                  ),
                ),
              ],
              ) ,
            ),
            ),
            SizedBox(height:40),
            FadeAnimation(1.8, Center(
              child:  Container(
                width: 100,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(child:Text('Sign in',
                  style: TextStyle(color : Colors.white.withOpacity(.7)),
                  ),
                ),
              ),
            ),
            ),

          ],
          
        ),
      ),
      
   
       
    );
   
    
      
  }
}