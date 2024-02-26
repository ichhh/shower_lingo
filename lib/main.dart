import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'src/app.dart';
import 'src/db/db.dart';
import 'src/network.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/utils.dart';

late final Directory gAppDir;
late final Directory gTempDir;
late User gUser;
bool isWeb = kIsWeb;
late bool isOnline;
late final String gDeviceId;

// TODO: 23.11.2022 drift init
// Get.put(MyDatabase());
// gDatabase2 = Get.find<MyDatabase>();

late final MyDatabase drift;

void main() async {
  drift = MyDatabase();

  isOnline = await checkIfOnline();
  gDeviceId = await getDeviceIdString();

  gAppDir = await getApplicationDocumentsDirectory();
  gTempDir = await getTemporaryDirectory();

  gAppDir = await getApplicationDocumentsDirectory();

  //===============
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
