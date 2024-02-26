// import '../../main.dart';
// import 'dao_fb.dart';
// import 'dao_local.dart';
// import 'db.dart';

// class Dao {
//   static delAll() async {
//     Db.delAllLocal();
//     Fb.delAllInCloud();
//   }

//   static delAllOfAllUsers() async {
//     Db.delAllLocalOfAllUsers();
//     Fb.delAllInCloudOfAllUsers();
//   }

//   static delItemByIdAndMakeDelTableEntry(int id) async {
//     // int id = item.id;
//     if (isWeb) {
//       String firebaseFirestorePath =
//           (await Db.getItemById(id))!.firebaseFirestorePath!;
//       Fb.deleteItem(firebaseFirestorePath);

//       Fb.insertDeletedItemById(id);
//     } else {
//       drift.delItemById(id);
//       Db.insertDeletedItem(
//           DeletedItem(id: id, ms: getMs(), deviceId: gDeviceId));
//     } // TODO: 04.01.2023 copy to look
//   }

//   static delLookByIdAndMakeDelTableEntry(int id) async {
//     // int id = item.id;
//     if (isWeb) {
//       String firebaseFirestorePath =
//           (await Db.getItemById(id))!.firebaseFirestorePath!;
//       Fb.deleteItem(firebaseFirestorePath);

//       Fb.insertDeletedItemById(id);
//     } else {
//       drift.delLookById(id);
//       Db.insertDeletedLook(
//           DeletedLook(id: id, ms: getMs(), deviceId: gDeviceId));
//     } // TODO: 04.01.2023 copy to look
//   }

//   // static Stream<List<Item>>
//   static getItemsByCategory(RxList<String> categoriesFilter) {
//     if (isWeb) {
//       return Fb.getItemsByCategoryInCloud(categoriesFilter);
//     } else {
 
//       return Db.getItemsByCategoryLocally(categoriesFilter);
//     }
//   }

//   static Future<User> getUser() async {
//     var uid = Fb.getUid();
//     User? user = await drift.getUser(uid);
//     if (user == null) {
//       user = User(
//           accountStatus: 'active',
//           notificationsEnabled: false,
//           subscriptionStatus: 'free');
//       user.uid = uid;
//       user.name = Fb.getName();
//       user.email = Fb.getEmail();
//       // user.createdAt = getNow() as DateTime?;

//       drift.insertUser(user);
//     }

//     // int localDataSize = getLocalDataSize();
//     // int cloudDataSize = getCloudDataSize();
//     // int getStorageUsed = getStorageUsed();
//     // DateTime getLastSynch = getLastSynch();
//     // DateTime getPaidUntil = getPaidUntil();
//     // bool getNotificationsEnabled = getNotificationsEnabled();

//     return user;
//   }
// }
