import 'package:flutter/material.dart';
import 'package:varisty_shuttle_service/Widgets/drawer_options/drawer_option_mobile.dart';
import 'package:varisty_shuttle_service/Widgets/drawer_options/drawer_option_tablet.dart';
import 'package:varisty_shuttle_service/responsive/orientation_layout.dart';
import 'package:varisty_shuttle_service/responsive/screen_type_layout.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;

  //CONSTRUCTOR
  const DrawerOption({
    Key key,
    this.title,
    this.iconData
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile :OrientationLayout(
        landscape: DrawerOptionMobileLandscape(iconData: iconData,),
        portrait: DrawerOptionMobilePortrait(title: title,iconData: iconData,),
      ),
      tablet: OrientationLayout(
        portrait : DrawerOptionTabletPortrait(iconData: iconData,title: title,),
        landscape: DrawerOptionMobilePortrait(iconData: iconData,title: title,),
      ),
    );
  }
}