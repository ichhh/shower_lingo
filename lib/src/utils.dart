import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

String getNow() => DateFormat('yyyy_MM_dd_kk_mm_ss').format(DateTime.now());

Future getDeviceId() async {
  //device_info_plus
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  final allInfo = deviceInfo.data;

  return allInfo["model"] + ";" + allInfo["id"];
}

String getDeviceIdStringTest() {
  //device_info_plus
  String v = "";
  (v) {
    final deviceInfoPlugin = DeviceInfoPlugin();
    var deviceInfo;
    deviceInfoPlugin.deviceInfo.then((value) => deviceInfo = value);
    final allInfo = deviceInfo.data;
    v = allInfo["model"] + ";" + allInfo["id"];
  };

  return v;
}

Future<String> getDeviceIdString() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  final allInfo = deviceInfo.data;
  //todo VCS allInfo["id"]??''
  return allInfo["model"] +
      ";" +
      (allInfo["id"] ?? allInfo["identifierForVendor"]);
}

getMs() => DateTime.now().millisecondsSinceEpoch;

class MyValueKeys {
  //item
  static var itemFabAddItem = const ValueKey("itemFabAddItem");
  static var itemFabSaveItem = const ValueKey("itemFabSaveItem");
  //look
  static var lookFabAddLook = const ValueKey("lookFabAddLook");
  static var lookFabSaveLook = const ValueKey("lookFabSaveLook");
  //login
  static var logEmailTf = const ValueKey("log_email_tf");
  static var logPassTf = const ValueKey("log_password_tf");
  static var logSignBtn = const ValueKey("log_signin_btn");
  static var logRestoreGd = const ValueKey("log_restore_gd");
// static var lookFabSaveLook = x;
// static var lookFabSaveLook = x;
}

Future<ui.Image> fileToUiImage(File file) async {
  final Uint8List bytes = await file.readAsBytes();
  final Completer<ui.Image> completer = Completer();
  ui.decodeImageFromList(Uint8List.fromList(bytes), (ui.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

// Future<List<ui.Image>> ElementListToImageList(List<LookElement> fileList) async {
//   List<ui.Image> imageList = [];
//   // fileList.forEach((element) async {
//   //   if (element != null && element.path != null) {
//   //     var t = await fileToUiImage(element);
//   //     imageList.add(t);
//   //   }
//   // });

//      final ui.Image emptyImage = await ImagesMergeHelper.loadImageFromAsset(
//         icon_logo1);

//    fileList.map((element) async {
//           if (element != null && element.file != null) {
//             var t = await fileToUiImage(element.file!);
//             return t;
//           }
//           return emptyImage;
//         })
//         .cast<ui.Image>()
//         .toList();

//   return imageList;
// }

