import 'package:flutter/material.dart';
import 'package:varisty_shuttle_service/responsive/responsive_builder.dart';
import 'package:varisty_shuttle_service/enums/device_screen.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ScreenTypeLayout({
    Key key,
    this.mobile,
    this.tablet,
    this.desktop,
    }) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if(sizingInformation.deviceScreeenType ==DeviceScreeenType.Tablet) {
          if(tablet != null){
            return tablet;
          }
        }
         if(sizingInformation.deviceScreeenType ==DeviceScreeenType.Desktop) {
          if(desktop != null){
            return desktop;
          }
        }
          
        return mobile;
         
      }
      
    );
  }
}