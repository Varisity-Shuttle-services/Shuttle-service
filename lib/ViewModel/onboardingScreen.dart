import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';


Color bgColor = Color(0xFFF3F3F3);
Color textColor = Color(0xFF83838A);

List<String> imagePath = [
  "assets/images/bus_and_tower.png",
  "assets/images/girl_with_books.png",
  "assets/images/chilling.png",
];
List<String> title = ["Going home has never been so easy", "Skip the queue spend more time in the library!", "Sit back and enjoy the ride."];
List<String> description = [
  "Students will have the ability to book the shuttle know how many seats are available and SO MUCH MORE!!",
  "No need for a queue, easily book your sit and show up 5 minutes before departure",
  "No need to shout out your address in the shuttle,the driver already knows where you are going."
];

class Onboardingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body :ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30),
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
          )
        ),

           child: CarouselSlider(
              autoPlay: false,
              enableInfiniteScroll: false,
              initialPage: 0,
              reverse: false,
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              height: MediaQuery.of(context).size.height - 30,
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      
                        width: MediaQuery.of(context).size.width,
                        child: AppItro(i));
                  },
                );
              }).toList(),
            ),
          
        );
  }
}

class AppItro extends StatefulWidget {
  int index;
  AppItro(this.index);
  @override
  _AppItroState createState() => _AppItroState();
}

class _AppItroState extends State<AppItro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

Widget bottomsheet(){
  return Container(
      alignment: Alignment.bottomCenter,
      height:  MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Loginscreen()));
          }
               ,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom:5.0),
          child: Text('Get Started',
          style:  TextStyle(
            color: Color(0xFF5B16D0),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
          ) ,),),
  );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 24,
                  top: 14,
                  child: new Text(
                    "ONESTOP",
                    style: TextStyle(fontFamily: "AvenirBold", fontSize: 16, color: Colors.white),
                  )),
              widget.index != 2 ?
              Positioned(
                  right: 24,
                  top: 0,
                  child :Container(
                    child: FlatButton( 
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Loginscreen()));
                      },
                        child: Text("Skip",
                          style: TextStyle(
                            fontFamily: "AvenirBold",
                            color: Colors.grey,
                            fontSize: 20.0
                  ),
                ),
              )
          ),) : Text(""),
            ],
          ),
        ),
        Expanded(child: 
        Container(
          
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 130,
          child: Column(
            children: <Widget>[
              Container(
                
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child :Image.asset(imagePath[widget.index],
                ),
              ),
              Center(
                child : Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                title[widget.index],
                style: TextStyle(fontFamily: "Caslon", fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white,),
              ))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Center(
                  child: new RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: description[widget.index],
                                style: new TextStyle(fontFamily: 'Avenir', color: Colors.white,fontWeight: FontWeight.w500)),
                                    ])),
                ),
              )
            ],
          ),
        ),),
        
        widget.index == 2 ? bottomsheet() : 
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 50,
          child: Stack(
            children: <Widget>[
              Dots(widget.index),
              Center(
                child: new Text("SCROLL RIGHT",
                    style: TextStyle(fontFamily: "Avenir", fontSize: 10, color: Colors.white)),
              ),
            ],
          ),
        ),
        
        

        
      ],
    );
  }
}

class Dots extends StatefulWidget {
  int index;
  Dots(this.index);
  @override
  _DotsState createState() => _DotsState();
}

class _DotsState extends State<Dots> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("deneme" + currentPage.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, int index) {
        return Container(
            margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == widget.index ? Colors.black : Colors.white));
                //border: Border.all(color: Colors.white)));
      },
    );
  }
}

class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
     // color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 16,
              left: 12,
              child: Text(
                "LET'S GO!",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
