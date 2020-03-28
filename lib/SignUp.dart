import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Animations/FadeAnimation.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  String password;
  String _email;
  final passwordValidator = MultiValidator([  
    RequiredValidator(errorText: 'password is required'),  
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),  
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character') ,
 ]); 
 final emailValidator = EmailValidator(errorText: "Please type a correct email");



  Widget _buildNameField() {
    return FadeAnimation(1.2, Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: 
                        Icon(Icons.person),
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      labelText: "Enter your name"
                    ),
              ),
              ),
            );

  }

  Widget _buildEmailField(){
    return  FadeAnimation(1.5, Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child :Form(  
                key: _formKey,
              child: Column(
              children: <Widget>[
                Container(
                  child: TextFormField(
                    validator: emailValidator,
                    keyboardType: TextInputType.emailAddress,
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: 
                        Icon(Icons.email),
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      labelText: "Email"
                    ),
                  ),
                ),
              ],
              ),
            ),
              ),
            );

  }

  Widget _buildPasswordField(){
        
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
                   
                  ),
                  child :Form(  
                    key: _formKey1,  
                    child: Column(children: [  
                    TextFormField(
                    controller: _pass,
                    obscureText: true,
                    onChanged: (val) => password = val,  
                    validator : passwordValidator,
                    keyboardType: TextInputType.emailAddress,
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: 
                        Icon(Icons.lock),
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      hintText: "Password"
                    ),
                  ),
                    
               
                Container(
                  decoration: BoxDecoration(
                    border : Border(top: BorderSide(color: Colors.grey[300]))
                  ),
                  child: TextFormField(
                    controller: _confirmPass,
                    validator: (value){
                    if(value != _pass.text && _pass.text.length >=6){
                        return 'Passwords do not match';
                      }
                    },
                    obscureText: true,
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: 
                        Icon(Icons.lock),
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      hintText: "Confirm your Password"
                    ),
                  ),
                ),
                    ],
                    ),
                ),
                ),
                    ],
                    ),                  
                ),
    );
                              
  }
  Widget _buildAddressField(){
    return FadeAnimation(1.8, Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                ),
                child: TextField(
                    decoration : InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: 
                        Icon(Icons.home),
                      hintStyle: TextStyle(color : Colors.grey.withOpacity(.8)),
                      hintText: "Please enter your Address",
                    
                    ),
                  ),

                ),
                );
  }
  Widget _buildSignIn(){
    return FadeAnimation(1.8, Center(
              child:  Container(
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightBlueAccent,
                ),
                child:FlatButton(
                  onPressed: () {
                    if(_formKey.currentState.validate() && _formKey1.currentState.validate() ){
                      
                      _formKey.currentState.save();
                      print("sign in button pressed");
                    }
                  },
                  child :Text('Sign in',
                  style: TextStyle(color : Colors.white.withOpacity(.7), fontSize: 20.0),
                  ),
                ),
                
              ),
              ),
            );
              
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3,9,23,1),
      body:AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget> [
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
            FadeAnimation(1.2, Text('Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            ),
            SizedBox(height : 30),

            _buildNameField(),            
            SizedBox(height : 20),
            _buildEmailField(),
            SizedBox(height: 20,),
            _buildPasswordField(), 
            SizedBox(height : 20),
            _buildAddressField(),
            SizedBox(height: 20,),
            _buildSignIn(),
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