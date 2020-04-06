//Contains the widget that will be used for Mobile layout of home
//portrait and landscape

import 'package:flutter/material.dart';
import 'package:varisty_shuttle_service/Widgets/app_drawer/app_drawer.dart';

class HomeMobilePortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: IconButton(
              icon: Icon(Icons.menu, size: 30,),
              onPressed:(){
                _scaffoldkey.currentState.openDrawer();
              } ,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMobileLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        AppDrawer(),
      ],),
      
    );
  }
}