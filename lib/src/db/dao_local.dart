// import 'dart:io';

// import 'package:get/get_utils/src/platform/platform.dart';
// import 'package:path/path.dart' as path_pack;

// import '../main.dart';
// import '../utils/utils.dart';
// import 'db.dart';

// class Db {
//   static Future<Item> fillPlatformRelatedImageFieldOfEntity(
//       dynamic i, File f) async {
//     String path = '${gAppDir.path}/${getFileNameForItem(i, f)}';

//     await f.copy(path); // !!! saves image in app folder

//     if (GetPlatform.isAndroid) {
//       i.localAndroidPath = path;
//     } else if (GetPlatform.isIOS) {
//       i.localIosPath = path;
//     } else if (GetPlatform.isWindows) {
//       i.localWinPath = path;
//     } else if (GetPlatform.isMacOS) {
//       i.localMasIosPath = path;
//     } else if (GetPlatform.isFuchsia) {
//       i.localFuchsiaPath = path;
//     } else if (GetPlatform.isWeb) {
//       i.firebaseFirestorePath = path;
//     }

//     logS.info('saveItemImageLocally; image is saved in $path');
//     return i;
//   }

//   static deleteImageLocally(String path) async {
//     File(path).delete();
//     // _msg.write("image is saved in $path");
//   }

//   static String getFileNameForItem(Item item, File file) {
//     // ignore: prefer_interpolation_to_compose_strings
//     String prefix = item.category! + "_" + (item.brand ?? "nn") + ";";

//     var extension = path_pack.extension(file.path);

//     return prefix + getNow() + extension;
//   }

// //region Categories

//   static getCategoriesNum() {
//     return drift.getCategoriesNum();
//   }

//   static Stream<List<String?>> getItemsCategories() {
//     return drift.getItemsCategories();
//   }

//   static Future<List<Map<String, Object>>> getTotalPriceAndNumByCategory(
//       bool numTruePriceFalse) {
//     return drift.getTotalPriceAndNumByCategory(numTruePriceFalse);
//   }

//   static Stream<List<Item>> watchItemsByCategory(List<String> categories) {
//     return drift.watchItemsByCategory(categories);
//   }

//   static Stream<List<Item>> getItemsByCategoryLocally(List<String> categories) {
//     return drift.getItemsByCategoryLocally(categories);
//   }

// //region Item
//   static Future<int> insertItemOriginal(Item item) {
//     item.uid ??= gUser.uid;
//     item.id = item.ms = getMs();
//     item.deviceId = gDeviceId;
//     return drift.insertItemOriginal(item);
//   }

//   static Future<int> insertLookOriginal(Look look) {
//     look.uid ??= gUser.uid;
//     look.id = look.ms = getMs();
//     look.deviceId = gDeviceId;
//     return drift.insertLookOriginal(look);
//   }

//   static updateItem(Item item) => drift.updateItem(item);

//   static updateLook(Look look) => drift.updateLook(look);

//   static getAllDeletedItems() {
//     return drift.getAllDeletedItems();
//   }

//   static getAllDeletedLooks() {
//     return drift.getAllDeletedLooks();
//   }

//   static Future<DeletedItem?> getDeletedItemByItem(Item item) {
//     return drift.getDeletedItemByItem(item);
//   }

//   static Future<DeletedLook?> getDeletedLookByLook(Look look) {
//     return drift.getDeletedLookByLook(look);
//   }

//   static insertDeletedItem(DeletedItem entity) {
//     entity.uid ??= gUser.uid;
//     return drift.insertDeletedItem(entity);
//   }

//   static insertDeletedLook(DeletedLook entity) {
//     entity.uid ??= gUser.uid;
//     return drift.insertDeletedLook(entity);
//   }

//   static Future<Item?> getItemById(int id) => drift.getItemById(id);

//   static Future<Look?> getLookById(int id) => drift.getLookById(id);

//   static Future<List<Item>> getAllItems() => drift.getAllItems();

//   static Future<List<Look>> getAllLooks() => drift.getAllLooks();

//   static Future<List<Item>> getItemsWithEmptyFirestorePath() =>
//       drift.getItemsWithEmptyFirestorePath();

//   static Future<List<Look>> getLooksWithEmptyFirestorePath() =>
//       drift.getLooksWithEmptyFirestorePath();

//   static Stream<List<Item>> watchAllItems() => drift.watchAllItems();
//   static Stream<List<Look>> watchAllLooks() => drift.watchAllLooks();

//   // static delItemByIdInLocalDb(int id) => (drift.delItemByIdInLocalDb(id));
//   // static delItemInFb(int id) => (drift.delItemInFb(id));

//   // static Future<Look?> getLookById(int id) => (drift.getLookById(id));
//   // static Future<List<Look>> getAllLooks() => drift.getAllLooks();

//   static Future<int> deleteLookById(int id) => drift.deleteLookById(id);
//   static Future<int> insertLook(Look look) => drift.insertLook(look);

//   static void delAllLocal() {
//     drift.delAllLocalTables();
//     drift.delAllFilesInLocalDb();
//   }

//   static void delAllLocalOfAllUsers() {
//     drift.delAllLocalTablesOfAllUsers();
//     drift.delAllFilesInLocalDbOfAllUsers();
//   }

//   static void clearDeletedItemsTable() {
//     drift.clearDeletedItemsTable();
//   }

//   static void clearDeletedLooksTable() {
//     drift.clearDeletedLooksTable();
//   }

//   // static void getItemsByCategory(RxList<String> categoriesFilter) {}
// }



// // //////////////////////////////////////////////
// // ////////////////region Users

// //   Future<User?> getUser(String? uid) {
// //     return (select(users)..where((u) => u.uid.equals(uid!))).getSingleOrNull();
// //   }

// //   Future<int?> insertUser(User entity) {
// //     return into(users).insert(entity);
// //   }

// //   void updateLastSynch() {
// //     // update(users).write(UsersCompanion(lastSynch: Value(getNow() as DateTime)));
// //   }
// // ////////////////endregion Users

// // //////////////////////////////////////////////
// // ////////////////region Deleted

// //   Future<List<DeletedItem>> getAllDeletedItems() {
// //     return (select(deletedItems)..where((item) => item.uid.equals(gUser.uid!)))
// //         .get();
// //   }

// //   Future<DeletedItem?> getDeletedItemByItem(Item itemToCheck) {
// //     return (select(deletedItems)
// //           ..where((item) =>
// //               item.id.equals(itemToCheck.id) & item.uid.equals(gUser.uid!)))
// //         .getSingleOrNull();
// //   }

// //   Future<int?> insertDeletedItem(DeletedItem entity) {
// //     // TODO: 12.01.2023 Later; move getMs() to clientDefault()
// //     entity.uid ??= gUser.uid;
// //     entity.ms = getMs();
// //     return into(deletedItems).insert(entity);
// //   }

// //   ////////////////endregion Deleted

// // //////////////////////////////////////////////
// // ////////////////region Overview

// //   // Stream<List<Item>> watchItemsByCategory(List<String> categories) =>
// //   //     (select(items)..where((item) => item.category.isIn(categories))).watch();

// //   // Stream<List<Item>> getItemsByCategoryLocally(List<String> categories) {
// //   //   if (categories.isNotEmpty) {
// //   //     return (select(items)..where((item) => item.category.isIn(categories)))
// //   //         .watch();
// //   //   } else {
// //   //     return (select(items)).watch();
// //   //   }
// //   // }

// //   // endregion Overview

// //   //////////////////////////////////////////////
// //   ////////////////region DAO item

// //   Future<List<Item>> getAllItemsOfAllUsers() => select(items).get();
// //   Future<List<Item>> getAllItems() {
// //     return (select(items)..where((i) => i.uid.equals(gUser.uid!))).get();
// //   }

// //   Future<Item?> getItemById(int id) => (select(items)
// //         ..where((item) => item.id.equals(id) & item.uid.equals(gUser.uid!)))
// //       .getSingleOrNull();

// //   Future<List<Item>> getItemsWithEmptyFirestorePath() => (select(items)
// //         ..where((item) =>
// //             item.firebaseFirestorePath.equals("") &
// //             item.uid.equals(gUser.uid!)))
// //       .get();

// //   Future<List<Look>> getLooksWithEmptyFirestorePath() => (select(looks)
// //         ..where((look) =>
// //             look.firebaseFirestorePath.equals("") &
// //             look.uid.equals(gUser.uid!)))
// //       .get();

// //   Stream<List<Item>> watchAllItems() =>
// //       (select(items)..where((item) => item.uid.equals(gUser.uid!))).watch();

// //   // Future<Item?> getItemById(int id) =>
// //   //     (select(items)..where((item) => item.id.equals(id))).getSingleOrNull();

// //   // Future<List<Item>> getItemsWithEmptyFirestorePath() =>
// //   //     (select(items)..where((item) => item.firebaseFirestorePath.equals("")))
// //   //         .get();

// //   // Future<List<Look>> getLooksWithEmptyFirestorePath() =>
// //   //     (select(looks)..where((look) => look.firebaseFirestorePath.equals("")))
// //   //         .get();

// //   // Stream<List<Item>> watchAllItems() => select(items).watch();

// // //the difference between [insertItem] and [updateItem] that the insert operation can insert a new row
// // //

// //   Future<int> insertItemOriginal(Item item) {
// //     item.uid ??= gUser.uid;
// //     return into(items).insert(item);
// //   }

// //   Future<bool> updateItem(Item item) {
// //     item.uid ??= gUser.uid;
// //     // return into(items).insert(t, mode: InsertMode.insertOrReplace);
// //     // return into(items).insert(item, mode: InsertMode.replace);
// //     return update(items).replace(ItemsCompanion.fromItemWithId(item));
// //   }

// //   // TODO: 18.01.2023 move to repository

// //   delItemById(int id) =>
// //       (delete(items)..where((t) => t.id.equals(id) & t.uid.equals(gUser.uid!)))
// //           .go();

// //   delLookById(int id) =>
// //       (delete(looks)..where((t) => t.id.equals(id) & t.uid.equals(gUser.uid!)))
// //           .go();

// //   //endregion DAO item

// // //////////////////////////////////////////////
// // ////////////////region Unit testing

// // //endregion Unit testing
// //   delItemsInLocalDb() {
// //     (delete(items)..where((t) => t.uid.equals(gUser.uid!)))
// //         .go()
// //         .then((value) => gLogText = "success deleteItemsInLocalDb");

// //     myLog("deleteItemsInLocalDb", gLogText);
// //   }

// //   delItemsInLocalDbOfAllUsers() {
// //     delete(items)
// //         .go()
// //         .then((value) => gLogText = "success deleteItemsInLocalDb");
// //     myLog("deleteItemsInLocalDb", gLogText);
// //   }

// //   delAllFilesInLocalDb() async {
// //     List<Item> listOfItems = await getAllItems();
// //     listOfItems.forEach((item) {
// //       var path = getPathFromEntity(item);
// //       deleteLocalFile(path);
// //     });
// //     // .then((value) => gLogText = "success" );

// //     myLog("deleteAllFilesInLocalDb", gLogText);
// //   }

// //   delAllFilesInLocalDbOfAllUsers() async {
// //     List<Item> listOfItems = await getAllItemsOfAllUsers();

// //     listOfItems.forEach((item) {
// //       var path = getPathFromEntity(item);
// //       deleteLocalFile(path);
// //     });

// //     myLog("deleteAllFilesInLocalDb", gLogText);
// //   }

// //   delAllLocalTablesOfAllUsers() async {
// //     // TODO: 28.11.2022 deleteAllLocalTables if online truncate; if offline fill del field; dialog to connect to internet
// //     // return transaction(() async {
// //     for (var table in allTables) {
// //       await delete(table).go().then((value) {
// //         GetStorage().write(SPKeys.delAllData.name, getNow());
// //         gLogText = "success deleteAllLocalTables";
// //       });
// //     }

// //     myLog("deleteAllLocalTables", gLogText);
// //   }

// //   delAllLocalTables() async {
// //     // TODO: 28.11.2022 deleteAllLocalTables if online truncate; if offline fill del field; dialog to connect to internet
// //     // return transaction(() async {
// //     for (var table in allTables) {
// //       if (table == items) {
// //         await (delete(items)..where((t) => t.uid.equals(gUser.uid!))).go();
// //       } else if (table == looks) {
// //         await (delete(looks)..where((t) => t.uid.equals(gUser.uid!))).go();
// //       } else if (table == deletedItems) {
// //         await (delete(deletedItems)..where((t) => t.uid.equals(gUser.uid!)))
// //             .go();
// //       } else if (table == deletedLooks) {
// //         await (delete(deletedLooks)..where((t) => t.uid.equals(gUser.uid!)))
// //             .go();
// //       } else {
// //         await delete(table).go();
// //       }
// //     }

// //     GetStorage().write(SPKeys.delAllData.name, getNow());
// //     myLog("deleteAllLocalTables", gLogText);
// //   }

// //   Future<int> insertLookOriginal(Look look) {
// //     look.uid ??= gUser.uid;
// //     return into(looks).insert(look);
// //   }

// //   Future<DeletedLook?> getDeletedLookByLook(Look lookToCheck) {
// //     return (select(deletedLooks)
// //           ..where((item) {
// //             return item.id.equals(lookToCheck.id);
// //             //  &
// //             //     item.deviceId.equals(itemToCheck.deviceId!);
// //           }))
// //         .getSingleOrNull();
// //   }

// //   void clearDeletedItemsTable() {
// //     delete(deletedItems).go();
// //   }

// //   void clearDeletedLooksTable() {
// //     delete(deletedLooks).go();
// //  }