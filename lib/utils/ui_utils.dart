import 'package:flutter/widgets.dart';
import 'package:varisty_shuttle_service/enums/device_screen.dart';

DeviceScreeenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;
  double deviceWidth = 0;

  if(orientation == Orientation.landscape){
    deviceWidth = mediaQuery.size.height;
  }else {
    deviceWidth = mediaQuery.size.width;
  }

  if(deviceWidth > 950) {
    return DeviceScreeenType.Desktop;
  }

  if(deviceWidth > 600) {
    return DeviceScreeenType.Tablet;
  }

  return DeviceScreeenType.Mobile;
 }