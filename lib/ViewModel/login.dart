import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:varisty_shuttle_service/Animations/FadeAnimation.dart';
import 'package:varisty_shuttle_service/ViewModel/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:varisty_shuttle_service/Services/authentification_service.dart';
import 'package:varisty_shuttle_service/home/home_view.dart';

final FirebaseAuth auth = FirebaseAuth.instance;


  final TextEditingController _pass = TextEditingController();
  final TextEditingController _useremail = TextEditingController();

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
                    controller: _useremail,
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
                    controller: _pass,
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
                  onPressed: () async{
                    AuthentificationService().loginwithEmail(email: _useremail.text, password: _pass.text);
                    print('Login button pressed');
                    HomeView();
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
    return Container(
      
      //padding: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child :FadeAnimation(2.0, GestureDetector(
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
           )
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
                  AuthentificationService().handleSignInwithGoogle()
                  .then((FirebaseUser user) => print(user))
                  .catchError((e) => print(e));
                  //print('Google');
              },
            ),
          )
        )
      );
  }


  @override
  Widget build(BuildContext context) {
    //final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          //fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: <Widget> [
        Container(

          padding: EdgeInsets.only(top: 35,left: 25,right: 25),
          height: height,
          width: height,
          decoration: BoxDecoration(
             color: Color.fromRGBO(3,9,23,1),
          ),
   
            
         child : Column(
           
          
          //mainAxisAlignment: MainAxisAlignment.center,
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
            Expanded(child:_buildSignUp(),
            ),
            SizedBox(height :10.0),
            
                ],
              ),
              
            
        ),
          ],
        ),
        ),
      
    );    
  }
}