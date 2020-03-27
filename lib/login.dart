import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:varisty_shuttle_service/Animations/FadeAnimation.dart';
import 'package:varisty_shuttle_service/SignUp.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool _rememberMe = false;

  Widget _buildEmailandPassword(){
    return FadeAnimation(1.5, Container(
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
                    keyboardType: TextInputType.emailAddress,
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: 
                        Icon(Icons.email),
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      hintText: "Email"
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: 
                        Icon(Icons.lock),
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      hintText: "Password"
                    ),
                  ),
                ),                
              ],
              ) ,
            ),
            );
  }
  Widget _buildRememberMe() {
    return  FadeAnimation(1.7 ,Container(
              child: Row(
                children: <Widget>[
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white), 
                    child: Checkbox(
                      value: _rememberMe,
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value;
                        });
                      },
                    ),
                  ),
                  Text('Remember me',
                  style  : TextStyle(color : Colors.grey[300])),
                ],
                ),
            ),
          );
  }

  Widget _buildForgotPassword(){
    return FadeAnimation(1.9, Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(onPressed: () {
                    print('Forgot Password button Pressed');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color : Colors.grey.withOpacity(.8)),
                  ),
                ),
                ),
           );
  }

  Widget _buildSignInButton() {
    return FadeAnimation(1.8, Center(
              child:  Container(
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightBlueAccent,
                ),
                child:FlatButton(
                  onPressed: () {
                    print('Login button pressed');
                  },
                  child :Text('Sign in',
                  style: TextStyle(color : Colors.white.withOpacity(.7), fontSize: 20.0),
                  ),
                ),
                
              ),
              ),
            );
  }

  Widget _buildSignUp(){
    return FadeAnimation(2.0, GestureDetector(
            onTap: () {
               Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Signup()));
            },
           child :RichText(
            text :TextSpan(
              children: [
                    TextSpan(
                    text :'Don'"'"'t have an Account? ',
                    style : TextStyle(color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,)
                  ),
                  TextSpan(
                    text :'Sign Up',
                    style : TextStyle(color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,)
                  ),
              ],
            ),
            ),
           ),
           );
  }
  Widget _orText(){
    return FadeAnimation(2.0,Center(
                child :Text(
                  '- OR -',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                ),
            ),
    );
  }

  Widget _signInText(){
    return  FadeAnimation(2.2 ,Center(
            child :Text('Sign in with',
                style : TextStyle(color: Colors.white, fontWeight : FontWeight.w400)),
      )
    );
  }

  Widget _googleButton() {
    return FadeAnimation(2.4, Center(
    child :Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color : Colors.white, shape : BoxShape.circle,
              image : DecorationImage(
              image :AssetImage('assets/images/Google.png'
                ),
              ),
            ),     
              child: GestureDetector(
                onTap: (){
                  print('Google');
              },
            ),
          )
        )
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget> [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
             color: Color.fromRGBO(3,9,23,1),
          ),
        ),
        Container(
          height : double.infinity,
          child: SingleChildScrollView(
            physics : AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal : 40.0,
              vertical : 120.0,
            ),
            
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(1.2, Text('Sign in',
            style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height:30,),
            _buildEmailandPassword(),
            _buildRememberMe(),
            _buildForgotPassword(),
            _buildSignInButton(),
            SizedBox(height :30),
            _orText(),
            SizedBox(height:30.0),
            _signInText(),
            SizedBox(height :20.0),
            _googleButton(), 
            SizedBox(height:200),
            _buildSignUp(),
                ],
              ),
              ),  
            ),
          ],
        ),
        ),
      ),
    );    
  }
}