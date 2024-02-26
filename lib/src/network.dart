import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkIfOnline() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  return connectivityResult == ConnectivityResult.ethernet ||
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile;
}

const String androidGalleryFolderName = "wardrobe";
const String sideMenuTitle = "";
const String materialAppTitle = "wardrobe";

const tableNameItems = 'items';
const tableNameLooks = 'looks';
const tableNameDeletedLooks = 'deleted_looks';
const tableNameDeletedItems = 'deleted_items';
const tableNameSynch = 'synch';

const listOfSupportedImageExtensions = ['jpg', 'png', 'jpeg'];

bool isImagePath(String path) {
  for (var e in listOfSupportedImageExtensions) {
    if (path.contains('.$e')) {
      return true;
    }
  }
  return false;
}
