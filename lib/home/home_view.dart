import 'package:flutter/material.dart';
import 'package:varisty_shuttle_service/home/home_view_mobile.dart';
import 'package:varisty_shuttle_service/home/home_view_tablet.dart';
import 'package:varisty_shuttle_service/responsive/orientation_layout.dart';
import 'package:varisty_shuttle_service/responsive/screen_type_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile : OrientationLayout(
          portrait: HomeMobilePortrait(),
          landscape: HomeMobileLandscape(),
      ),
      tablet: HomeViewTablet(),
    );
  }
}