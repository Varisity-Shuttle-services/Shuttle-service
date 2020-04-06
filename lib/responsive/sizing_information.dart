import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:varisty_shuttle_service/enums/device_screen.dart';


class SizingInformation {
  final Orientation orientation;
  final DeviceScreeenType deviceScreeenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.orientation,
    this.deviceScreeenType,
    this.screenSize,
    this.localWidgetSize
    });

    @override 
    String toString() {
      return 'Orientation:$orientation DeviceType:$deviceScreeenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
    }
  
}