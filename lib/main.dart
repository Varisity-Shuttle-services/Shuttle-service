import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:varisty_shuttle_service/Content2.dart';
import 'package:varisty_shuttle_service/onboardingScreen.dart';
import 'Animations/FadeAnimation.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home :HomePage()),
  );
  
// hello
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController _pageController;
  AnimationController rippleController;
  AnimationController scaleController;

  Animation<double> rippleAnimation;
  Animation<double> scaleAnimation;

  //var status;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0
      );

    rippleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
      );
    
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
      )..addStatusListener( (status) {
        if (status == AnimationStatus.completed){
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Onboardingscreen()));
        }
      });
     

    rippleAnimation = Tween<double>(
      begin: 80.0,
      end: 90.0
    ).animate(rippleController)..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        rippleController.reverse();
      }else if(status == AnimationStatus.dismissed){
        rippleController.forward();
      }
    }
    );

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(scaleController);

    rippleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(3,9,23,1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation (1, Container(
                width: width,
                height:  400,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover
                ),
              ),
            )),
        ),
            Positioned(
              top: -100,
              left: 0,
              child:FadeAnimation (1.3, Container(
                width: width,
                height:  400,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover
                ),
              ),
            )),
          ),

             Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation (1.6,Container(
                width: width,
                height:  400,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover
                ),
              ),
            )),
        ),

          Positioned(
              
              child: FadeAnimation (1.9 ,Center(
                child : Container(
                width: 400,
                height:  400,
                decoration: BoxDecoration(
                  image:DecorationImage(
                  image: AssetImage('assets/images/one-stop.png'),                   
                ),
              ),
            )),
        ),
          ),
        
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(1, Center(
             child: Text("Welcome",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize:40),)
              ),
            ),
            SizedBox(height: 0,),
            FadeAnimation (1.3,Center(
              child: Text("in one-stop app",
              style: TextStyle( color: Colors.white.withOpacity(.7),height: 1.4, fontSize: 15), textAlign: TextAlign.right,)
              ),
            ),
            SizedBox(height: 55,),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: rippleAnimation,
                 builder: (context,child) => Container(
                   width: rippleAnimation.value,
                   height: rippleAnimation.value,
                   child: Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.blue.withOpacity(.4)
                     ),

              child: InkWell(
              onTap: (){
                scaleController.forward();
              },
                child: AnimatedBuilder(
                  animation: scaleAnimation,
                  builder: (context,child) => Transform.scale(
                    scale: scaleAnimation.value ,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue
                      ),
                    ),
                    ),
                                
                  child: Icon(Icons.arrow_forward, color: Colors.white,),
                ),
              ),
            ),
          ),
        ),
            ),
            //SizedBox(height: 60,),         
               
          ],
          )
      )
      ],
      ),
    ),
    );
  }
}



