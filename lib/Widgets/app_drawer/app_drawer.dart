import 'package:flutter/material.dart';
import 'package:varisty_shuttle_service/Widgets/app_drawer/app_drawer_mobile.dart';
import 'package:varisty_shuttle_service/Widgets/app_drawer/app_drawer_tablet.dart';
import 'package:varisty_shuttle_service/Widgets/drawer_options/drawer_options.dart';
import 'package:varisty_shuttle_service/responsive/orientation_layout.dart';
import 'package:varisty_shuttle_service/responsive/screen_type_layout.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile : AppDrawerMobile(),
      tablet: OrientationLayout(
        portrait : AppDrawerTabletPortrait(),
        landscape: AppDrawerTabletLandscape(),
      ),
    );
  }
  static List<Widget> getDrawerOptions() {
    return [
      DrawerOption(
        title: 'Home',
        iconData : Icons.home,
      ),
      DrawerOption(
        title: 'Time Slots',
        iconData : Icons.time_to_leave,
      ),
      DrawerOption(
        title: 'Account',
        iconData : Icons.person,
      ),
      DrawerOption(
        title: 'Settings',
        iconData : Icons.settings,
      ),

    ];
  }
}

