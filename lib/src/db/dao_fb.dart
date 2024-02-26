// import 'dart:async';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:perfect_wardrobe_5/dao/db.dart';

// import '../helpers/firebase.dart';
// import '../helpers/logger.dart';
// import '../main.dart';
// import '../pages/item/item_controller.dart';
// import '../pages/settings/settings_controller.dart';
// import '../utils/utils.dart';
// import 'dao_local.dart';

// class Fb {
//   //////////////////region Item

//   static Future<List<Item>> getAllItems() async {
//     List<Item> fbItems = [];
//     var snapshot = await fbFirestore!
//         .collection(tableNameItems)
//         .where('uid', isEqualTo: gUser.uid) // Add this line
//         .get();
//     for (var doc in snapshot.docs) {
//       fbItems.add(Item.fromJson(doc.data()));
//     }
//     return fbItems;
//   }

//   static insertItemWithNewId(Item item) {
//     item.uid ??= gUser.uid;

//     // late final docRef;
//     Future.delayed(const Duration(milliseconds: 1));
//     item.id = item.ms = getMs();
//     var docRef =
//         fbFirestore!.collection(tableNameItems).doc(); //or .doc('myId');
//     item.firebaseFirestorePath = docRef.id;
//     docRef.set(item.toJson());

//     logS.info('Fb.insertItemInFb; --items is saved in FB');
//     return item;
//   }

//   static insertItemInitial(Item item) {
//     item.uid ??= gUser.uid;

//     var docRef =
//         fbFirestore!.collection(tableNameItems).doc(); //or .doc('myId');
//     item.firebaseFirestorePath = docRef.id;
//     docRef.set(item.toJson());

//     logS.info('Fb.insertItemInFb; --items is saved in FB');
//     return item;
//   }

//   static insertItemNotOrgianlNotInitial(Item item) {
//     item.uid ??= gUser.uid;

//     var docRef =
//         fbFirestore!.collection(tableNameItems).doc(item.firebaseFirestorePath);
//     docRef.set(item.toJson());

//     logS.info('Fb.insertItemInFb; --items is saved in FB');
//     return item;
//   }

// //[createId] - whether has id
// //[updateImage] - whether delete displaced image
//   static insertUpdateItemAndImagePlusUpdateLocalItem(Item item,
//       {required bool createId,
//       required bool updateImage,
//       required bool isInitialUpload,
//       String? oldImagePath}) async {
// //createId = web
// //update fields
// //update imgage
// //update fields and imgage
// //initialUpload

//     item.uid ??= gUser.uid;

//     if (updateImage) {
//       //delete old image in fb
//       if (oldImagePath != null) {
//         fbStorage?.refFromURL(oldImagePath).delete();
//       } else {
//         oldImagePath =
//             await _getCloudImagePathByLocalId(item.id, tableNameItems);
//         if (oldImagePath != null) {
//           fbStorage?.refFromURL(oldImagePath).delete();
//         }
//       }
//     }

//     if (createId || isInitialUpload || updateImage) {
//       var imgFile = await getImageFileByEntity(item);
//       item.firebaseStoragePath = await insertImageInFb(imgFile, tableNameItems);
//       if (createId) {
//         item = await Fb.insertItemWithNewId(item);
//       } else if (isInitialUpload) {
//         item = await Fb.insertItemInitial(item);
//       } else {
//         item = await Fb.insertItemNotOrgianlNotInitial(item);
//       }
//     } else {
//       //basic data update
//       item = await Fb.insertItemNotOrgianlNotInitial(item);
//     }

//     // item = await Fb.insertUpdateItemInFirestore(item,
//     //     createId: createId, isInitialUpload: isInitialUpload);

//     Db.updateItem(item);
//     // gDatabase.insertItem(item, createId: false);
//   }

//   // static Future<Item> insertItemAndImageInFb(Item localItem,
//   //     {required bool createId}) async {
//   //   var imgFile = getImageFileByEntity(localItem);
//   //   localItem.firebaseStoragePath = await Fb.insertImageInFb(imgFile);
//   //   return Fb.insertItemInFbWithoutImage(localItem, createId: createId);
//   // }

//   //UpdateLocalItems meaning -  item initially upload to the cloud it should be downloaded right away as during upload firebaseFirestorePath (and firebaseStoragePath??) fields are changes
//   // static insertItemsToFbAndUpdateLocalItems(List<Item> list,
//   //     {required bool createId}) async {
//   //   for (var item in list) {
//   //     var uploadedItem =
//   //         await Fb.insertItemAndImageInFb(item, createId: createId);
//   //     gDatabase.insertItem(uploadedItem, createId: false);
//   //   }
//   // }

//   //[list] of maps with keys "item", "image"
//   //UpdateLocalItems meaning -  item initially upload to the cloud it should be downloaded right away as during upload firebaseFirestorePath (and firebaseStoragePath??) fields are changes
// // TONOTE: 2023.06.20
//   // insertItemsToFbAndUpdateLocalItems0(List<Map<String, dynamic>> list,
//   //     {bool createId = true}) async {
//   //   list.forEach((map) async {
//   //     var i = map['item'] as Item;
//   //     i.firebaseStoragePath = Fb.insertImageInFb(map['image']);
//   //     var uploadedItem = Fb.insertItemInFb(i, createId: createId);
//   //     gDatabase.insertItem(uploadedItem, createId: createId);
//   //   });
//   // }

//   static void insertDeletedItemById(int id) {
//     final docRef =
//         fbFirestore!.collection(tableNameLooks).doc(); //or .doc('myId');
//     var v =
//         DeletedItem(id: id, ms: getMs(), deviceId: gDeviceId, uid: gUser.uid);
//     docRef.set(v.toJson());
//   }

//   static insertDeletedItemInFb(DeletedItem delItem) {
//     delItem.uid ??= gUser.uid;

//     final docRef =
//         fbFirestore!.collection(tableNameDeletedItems).doc(); //or .doc('myId');

//     //=create doc in FireStore; other: .update()/delete()
//     docRef.set(delItem.toJson());
//   }

// // TOCHECK: 2023.07.15     isn't it should be firebaseFirestorePath not id
//   static Future<DeletedItem?> getDeletedItemInFb(int id) async {
//     var docSnapshot = await fbFirestore!
//         .collection(tableNameDeletedItems)
//         .doc(id.toString())
//         .get();

//     if (docSnapshot.exists) {
//       var data = docSnapshot.data() as Map<String, dynamic>;
//       if (data['uid'] == gUser.uid) {
//         // Check if the uid field matches gUser.uid
//         logS.info('getDeletedItemInFb;${id}');
//         return DeletedItem.fromJson(data);
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }

//   static Future<DeletedItem?> getDeletedItemInFbOLD(int id) async {
//     fbFirestore!
//         .collection(tableNameDeletedItems)
//         .doc(id.toString())
//         .get()
//         .then((DocumentSnapshot ds) {
//       if (ds.exists) {
//         var data = ds.data as Map<String, dynamic>;
//         logS.info('getDeletedItemInFb;${id}');
//         return DeletedItem.fromJson(data);
//       } else {
//         return null;
//       }
//     });
//     return null;
//   }

//   static Stream<QuerySnapshot<Map<String, dynamic>>> getItemsByCategoryInCloud(
//       List<String> categories) {
//     if (categories.isNotEmpty) {
//       return fbFirestore!
//           .collection(tableNameItems)
//           .where('uid', isEqualTo: gUser.uid) // Check the uid field
//           .where("category", whereIn: categories)
//           .snapshots();
//     } else {
//       return fbFirestore!
//           .collection(tableNameItems)
//           .where('uid', isEqualTo: gUser.uid) // Check the uid field
//           .snapshots();
//     }
//   }

//   static Stream<QuerySnapshot<Map<String, dynamic>>>
//       getItemsByCategoryInCloudOLD(List<String> categories) {
//     if (categories.isNotEmpty) {
//       return fbFirestore!
//           .collection(tableNameItems)
//           .where("category", whereIn: categories)
//           .snapshots();
//     } else {
//       return fbFirestore!.collection(tableNameItems).snapshots();
//     }
//   }

//   // Future<void> deleteItem(String documentId) async {
//   //   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   //   try {
//   //     await firestore.collection('yourCollectionName').doc(documentId).delete();
//   //     print('Item deleted successfully');
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
//   static void deleteItem(String firebaseFirestorePath) {
//     final collection = FirebaseFirestore.instance.collection(tableNameItems);
//     collection
//         .doc(firebaseFirestorePath) // <-- Doc ID to be deleted.
//         .get()
//         .then((doc) {
//       if (doc.exists && doc.data()?['uid'] == gUser.uid) {
//         // Check if the uid field matches gUser.uid
//         doc.reference
//             .delete()
//             .then((_) => Get.snackbar(
//                 "Info", "Deleted Item in Fb ${firebaseFirestorePath}"))
//             .catchError((error) {
//           print('730 Delete failed: $error');
//           return Get.snackbar("Error", '730 Delete failed: $error');
//         });
//       } else if (!doc.exists) {
//         print('730 Attempt to Delete upsent item: $firebaseFirestorePath');
//         Get.snackbar("Error",
//             '730 Attempt to Delete upsent item: $firebaseFirestorePath');
//       } else {
//         print('730 User does not have permission to delete this item');
//         Get.snackbar(
//             "Error", '730 User does not have permission to delete this item');
//       }
//     }).catchError((error) {
//       print('730 Get document failed: $error');
//       Get.snackbar("Error", '730 Get document failed: $error');
//     });
//   }

//   static void deleteItemOLD(String firebaseFirestorePath) {
//     final collection = FirebaseFirestore.instance.collection(tableNameItems);
//     collection
//         .doc(firebaseFirestorePath) // <-- Doc ID to be deleted.
//         .get()
//         .then((doc) {
//       if (doc.exists) {
//         doc.reference
//             .delete()
//             .then((_) => Get.snackbar(
//                 "Info", "Deleted Item in Fb ${firebaseFirestorePath}"))
//             .catchError((error) {
//           print('730 Delete failed: $error');
//           return Get.snackbar("Error", '730 Delete failed: $error');
//         });
//       } else {
//         print('730 Attempt to Delete upsent item: $firebaseFirestorePath');
//         Get.snackbar("Error",
//             '730 Attempt to Delete upsent item: $firebaseFirestorePath');
//       }
//     }).catchError((error) {
//       print('730 Get document failed: $error');
//       Get.snackbar("Error", '730 Get document failed: $error');
//     });
//   }

// //endregion Item

// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// //////////////////region Look

//   static Future<List<Look>> getAllLooks() async {
//     List<Look> fbLooks = [];
//     var snapshot = await fbFirestore!
//         .collection(tableNameLooks)
//         .where('uid', isEqualTo: gUser.uid) // Add this line
//         .get();
//     for (var doc in snapshot.docs) {
//       fbLooks.add(Look.fromJson(doc.data()));
//     }
//     return fbLooks;
//   }

//   static insertLookWithNewId(Look look) {
//     // late final docRef;
//     Future.delayed(const Duration(milliseconds: 1));
//     look.uid ??= gUser.uid;
//     look.id = look.ms = getMs();
//     var docRef =
//         fbFirestore!.collection(tableNameLooks).doc(); //or .doc('myId');
//     look.firebaseFirestorePath = docRef.id;
//     docRef.set(look.toJson());

//     logS.info('Fb.insertLookInFb; --looks is saved in FB');
//     return look;
//   }

//   static insertLookInitial(Look look) {
//     look.uid ??= gUser.uid;
//     var docRef =
//         fbFirestore!.collection(tableNameLooks).doc(); //or .doc('myId');
//     look.firebaseFirestorePath = docRef.id;
//     docRef.set(look.toJson());

//     logS.info('Fb.insertLookInFb; --looks is saved in FB');
//     return look;
//   }

//   static insertLookNotOrgianlNotInitial(Look look) {
//     look.uid ??= gUser.uid;
//     var docRef =
//         fbFirestore!.collection(tableNameLooks).doc(look.firebaseFirestorePath);
//     docRef.set(look.toJson());

//     logS.info('Fb.insertLookInFb; --looks is saved in FB');
//     return look;
//   }

// //[createId] - whether has id
// //[updateImage] - whether delete displaced image
//   static insertUpdateLookAndImagePlusUpdateLocalLook(Look look,
//       {required bool createId,
//       required bool updateImage,
//       required bool isInitialUpload,
//       String? oldImagePath}) async {
// //createId = web
// //update fields
// //update imgage
// //update fields and imgage
// //initialUpload

//     look.uid ??= gUser.uid;
//     if (updateImage) {
//       //delete old image in fb
//       if (oldImagePath != null) {
//         fbStorage?.refFromURL(oldImagePath).delete();
//       } else {
//         oldImagePath =
//             await _getCloudImagePathByLocalId(look.id, tableNameLooks);
//         if (oldImagePath != null) {
//           fbStorage?.refFromURL(oldImagePath).delete();
//         }
//       }
//     }

//     if (createId || isInitialUpload || updateImage) {
//       var imgFile = await getImageFileByEntity(look);
//       look.firebaseStoragePath = await insertImageInFb(imgFile, tableNameLooks);
//       if (createId) {
//         look = await Fb.insertLookWithNewId(look);
//       } else if (isInitialUpload) {
//         look = await Fb.insertLookInitial(look);
//       } else {
//         look = await Fb.insertLookNotOrgianlNotInitial(look);
//       }
//     } else {
//       //basic data update
//       look = await Fb.insertLookNotOrgianlNotInitial(look);
//     }

//     // look = await Fb.insertUpdateLookInFirestore(look,
//     //     createId: createId, isInitialUpload: isInitialUpload);

//     Db.updateLook(look);
//     // gDatabase.insertLook(look, createId: false);

//     // if (createId) {
//     //   // } else if (isInitialUpload) {
//     //   //   var imgFile = await getImageFileByLook(look);
//     //   //   look.firebaseStoragePath = await insertImageInFb(imgFile);
//     //   //   var uploadedLook =
//     //   //       await Fb.insertLookInFirestore(look, createId: false);
//     //   //   gDatabase.insertLook(uploadedLook, createId: !isInitialUpload);
//     // } else
//     //   //upload new image
//     //   var imgFile = await getImageFileByLook(look);
//     // look.firebaseStoragePath = await insertImageInFb(imgFile);

//     // await Fb.insertLookInFirestore(look, createId: false);
//   }

//   // static Future<Look> insertLookAndImageInFb(Look localLook,
//   //     {required bool createId}) async {
//   //   var imgFile = getImageFileByLook(localLook);
//   //   localLook.firebaseStoragePath = await Fb.insertImageInFb(imgFile);
//   //   return Fb.insertLookInFbWithoutImage(localLook, createId: createId);
//   // }

//   //UpdateLocalLooks meaning -  look initially upload to the cloud it should be downloaded right away as during upload firebaseFirestorePath (and firebaseStoragePath??) fields are changes
//   // static insertLooksToFbAndUpdateLocalLooks(List<Look> list,
//   //     {required bool createId}) async {
//   //   for (var look in list) {
//   //     var uploadedLook =
//   //         await Fb.insertLookAndImageInFb(look, createId: createId);
//   //     gDatabase.insertLook(uploadedLook, createId: false);
//   //   }
//   // }

//   //[list] of maps with keys "look", "image"
//   //UpdateLocalLooks meaning -  look initially upload to the cloud it should be downloaded right away as during upload firebaseFirestorePath (and firebaseStoragePath??) fields are changes
// // TONOTE: 2023.06.20
//   // insertLooksToFbAndUpdateLocalLooks0(List<Map<String, dynamic>> list,
//   //     {bool createId = true}) async {
//   //   list.forEach((map) async {
//   //     var i = map['look'] as Look;
//   //     i.firebaseStoragePath = Fb.insertImageInFb(map['image']);
//   //     var uploadedLook = Fb.insertLookInFb(i, createId: createId);
//   //     gDatabase.insertLook(uploadedLook, createId: createId);
//   //   });
//   // }

//   static void insertDeletedLookById(int id) {
//     final docRef =
//         fbFirestore!.collection(tableNameLooks).doc(); //or .doc('myId');
//     var v =
//         DeletedLook(id: id, ms: getMs(), deviceId: gDeviceId, uid: gUser.uid);
//     docRef.set(v.toJson());
//   }

//   static insertDeletedLookInFb(DeletedLook delLook) {
//     delLook.uid ??= gUser.uid;
//     final docRef =
//         fbFirestore!.collection(tableNameDeletedLooks).doc(); //or .doc('myId');

//     //=create doc in FireStore; other: .update()/delete()
//     docRef.set(delLook.toJson());
//   }

//   static Future<DeletedLook?> getDeletedLookInFb(int id) async {
//     var docSnapshot = await fbFirestore!
//         .collection(tableNameDeletedLooks)
//         .doc(id.toString())
//         .get();

//     if (docSnapshot.exists) {
//       var data = docSnapshot.data() as Map<String, dynamic>;
//       if (data['uid'] == gUser.uid) {
//         // Check if the uid field matches gUser.uid
//         logS.info('getDeletedLookInFb;${id}');
//         return DeletedLook.fromJson(data);
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }

//   static Future<DeletedLook?> getDeletedLookInFbOLD(int id) async {
//     fbFirestore!
//         .collection(tableNameDeletedLooks)
//         .doc(id.toString())
//         .get()
//         .then((DocumentSnapshot ds) {
//       if (ds.exists) {
//         var data = ds.data as Map<String, dynamic>;
//         logS.info('getDeletedLookInFb;${id}');
//         return DeletedLook.fromJson(data);
//       } else {
//         return null;
//       }
//     });
//     return null;
//   }

//   static Stream<QuerySnapshot<Map<String, dynamic>>> getLooksByCategoryInCloud(
//       List<String> categories) {
//     if (categories.isNotEmpty) {
//       return fbFirestore!
//           .collection(tableNameLooks)
//           .where('uid', isEqualTo: gUser.uid) // Check the uid field
//           .where("category", whereIn: categories)
//           .snapshots();
//     } else {
//       return fbFirestore!
//           .collection(tableNameLooks)
//           .where('uid', isEqualTo: gUser.uid) // Check the uid field
//           .snapshots();
//     }
//   }

//   static Stream<QuerySnapshot<Map<String, dynamic>>>
//       getLooksByCategoryInCloudOLD(List<String> categories) {
//     if (categories.isNotEmpty) {
//       return fbFirestore!
//           .collection(tableNameLooks)
//           .where("category", whereIn: categories)
//           .snapshots();
//     } else {
//       return fbFirestore!.collection(tableNameLooks).snapshots();
//     }
//   }

//   // Future<void> deleteLook(String documentId) async {
//   //   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   //   try {
//   //     await firestore.collection('yourCollectionName').doc(documentId).delete();
//   //     print('Look deleted successfully');
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
//   static void deleteLook(String firebaseFirestorePath) {
//     final collection = FirebaseFirestore.instance.collection(tableNameLooks);
//     collection
//         .doc(firebaseFirestorePath) // <-- Doc ID to be deleted.
//         .get()
//         .then((doc) {
//       if (doc.exists && doc.data()?['uid'] == gUser.uid) {
//         // Check if the uid field matches gUser.uid
//         doc.reference
//             .delete()
//             .then((_) => Get.snackbar(
//                 "Info", "Deleted Look in Fb ${firebaseFirestorePath}"))
//             .catchError((error) {
//           print('730 Delete failed: $error');
//           return Get.snackbar("Error", '730 Delete failed: $error');
//         });
//       } else if (!doc.exists) {
//         print('730 Attempt to Delete upsent look: $firebaseFirestorePath');
//         Get.snackbar("Error",
//             '730 Attempt to Delete upsent look: $firebaseFirestorePath');
//       } else {
//         print('730 User does not have permission to delete this look');
//         Get.snackbar(
//             "Error", '730 User does not have permission to delete this look');
//       }
//     }).catchError((error) {
//       print('730 Get document failed: $error');
//       Get.snackbar("Error", '730 Get document failed: $error');
//     });
//   }

//   static void deleteLookOLD(String firebaseFirestorePath) {
//     final collection = FirebaseFirestore.instance.collection(tableNameLooks);
//     collection
//         .doc(firebaseFirestorePath) // <-- Doc ID to be deleted.
//         .get()
//         .then((doc) {
//       if (doc.exists) {
//         doc.reference
//             .delete()
//             .then((_) => Get.snackbar(
//                 "Info", "Deleted Look in Fb ${firebaseFirestorePath}"))
//             .catchError((error) {
//           print('730 Delete failed: $error');
//           return Get.snackbar("Error", '730 Delete failed: $error');
//         });
//       } else {
//         print('730 Attempt to Delete upsent look: $firebaseFirestorePath');
//         Get.snackbar("Error",
//             '730 Attempt to Delete upsent look: $firebaseFirestorePath');
//       }
//     }).catchError((error) {
//       print('730 Get document failed: $error');
//       Get.snackbar("Error", '730 Get document failed: $error');
//     });
//   }

//   //endregion deletion

//   /////////////////////////////////////
//   ///Image/////////

//   static Future<String?> _getCloudImagePathByLocalId(
//       int id, String tableName) async {
//     final docSnapshot = await FirebaseFirestore.instance
//         .collection(tableName)
//         .doc(id.toString())
//         .get();

//     if (docSnapshot.exists && docSnapshot.data()?['uid'] == gUser.uid) {
//       // Check if the uid field matches gUser.uid
//       return docSnapshot.data()?['firebaseStoragePath'];
//     } else {
//       if (kDebugMode) {
//         print(
//             'Document does not exist on the database or the user does not have permission to access it');
//       }

//       return null;
//     }
//   }

//   static Future<String?> _getCloudImagePathByLocalIdOLD(
//       int id, String tableName) async {
//     final docSnapshot = await FirebaseFirestore.instance
//         .collection(tableName)
//         .doc(id.toString())
//         .get();

//     if (docSnapshot.exists) {
//       return docSnapshot.data()?['firebaseStoragePath'];
//     } else {
//       if (kDebugMode) {
//         print('Document does not exist on the database');
//       }

//       return null;
//     }
//   }

//   // static UploadTask uploadItemFileToStorage(File file) {
//   //   UploadTask task = fbStorage!
//   //       .ref()
//   //       .child(
//   //           "$tableNameItems/${DateTime.now().toString()}") // TODO: 22.09.2022 getFileNameForFb
//   //       .putFile(file);
//   //   return task;

//   static UploadTask _uploadFileToStorage(File imgFile, String tableName) {
//     var fileNameForFb = getFileNameForFb();
//     UploadTask task = fbStorage!
//         .ref()
//         .child(
//             "$tableNameItems/$fileNameForFb") // TODO: 22.09.2022 getFileNameForFb
//         .putFile(imgFile);
//     return task;
//   }

//   static String getFileNameForFb() {
//     return gUser.uid! + "_" + getNow();
//     // return DateTime.now().toString(); // 2023-07-11 07:22:47.830809
//   }

//   static Future<String?> insertImageInFb(
//       File? imgFile, String tableName) async {
//     if (imgFile == null) return null;

//     final UploadTask task = _uploadFileToStorage(imgFile, tableName);

//     String? downloadUrl;

//     final completer = Completer<String?>();

//     task.snapshotEvents.listen((snapShot) async {
//       if (snapShot.state == TaskState.success) {
//         downloadUrl = await snapShot.ref.getDownloadURL();
//         logS.info('Fb.insertImageInFb; --image is saved in FB');
//         completer.complete(downloadUrl);
//       } else if (snapShot.state == TaskState.error) {
//         snapShot.printError();
//         completer.completeError('Upload failed');
//       }
//     }, onError: (e) {
//       completer.completeError(e);
//     });

//     // await on the Future provided by the Completer.
//     return await completer.future;
//   }

//   static Stream<QuerySnapshot<Map<String, dynamic>>> getLooksStream() =>
//       fbFirestore!
//           .collection(tableNameLooks)
//           .where('uid', isEqualTo: gUser.uid) // Check the uid field
//           .snapshots();

//   static insertAssignLookInFb(Look look) {
//     look.uid ??= gUser.uid;
//     final docRef =
//         fbFirestore!.collection(tableNameLooks).doc(); //or .doc('myId');
//     look.firebaseFirestorePath = docRef.id;

//     //=create doc in FireStore; .update()/delete()
//     docRef.set(look.toJson());

//     // firebaseFirestore!
//     //     .collection(firestoreLooksCollectionName)
//     //     .add({"firebaseStoragePath": map}).whenComplete(
//     //         () => print("DBG is saved in Firestore"));

//     // _msg.write("looks is saved in FB");
//   }

//   //endregion look

//   //////////////////region deletion

//   static delLooksInFbOfAllUsers() {
//     try {
//       String? logText;

//       final collection = fbFirestore?.collection(tableNameLooks);
//       collection?.get().then((querySnapshot) {
//         for (var doc in querySnapshot.docs) {
//           doc.reference.delete();
//         }
//       }).then((value) => logText = "success deleteLooksInFb");

//       myLog("deleteLooksInFb", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delLooksInFb; Failed to delete items: $e");
//     }
//   }

//   static void delLooksInFb() {
//     try {
//       String? logText;

//       final collection = fbFirestore?.collection(tableNameLooks);

//       collection
//           ?.where('uid', isEqualTo: gUser.uid)
//           .get()
//           .then((querySnapshot) {
//         for (var doc in querySnapshot.docs) {
//           doc.reference.delete();
//         }
//       }).then((value) => logText = "success deleteLooksInFb");

//       myLog("deleteLooksInFb", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delLooksInFb; Failed to delete items: $e");
//     }
//   }

//   static delAllFilesInFb() async {
//     try {
//       String? logText;

//       List<Reference> allFiles = [];

//       final ListResult? resultItems =
//           await fbStorage?.ref('${tableNameItems}/${gUser.uid}').listAll();
//       final List<Reference> allItemsFiles = resultItems?.items ?? [];

//       final ListResult? resultLooks =
//           await fbStorage?.ref('${tableNameLooks}/${gUser.uid}').listAll();
//       final List<Reference> allLooksFiles = resultLooks?.items ?? [];

//       allFiles = allItemsFiles + allLooksFiles;

//       await Future.wait(
//         allFiles.map((file) async {
//           await file.delete();
//         }),
//       ).then((value) => logText = "success deleteAllFilesInFb");

//       myLog("deleteItemsInFb", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delAllFilesInFb; Failed to delete items: $e");
//     }
//   }

//   static delAllFilesInFbOfAllUsers() async {
//     try {
//       String? logText;

//       List<Reference> allFiles;

//       final ListResult? resultItems =
//           await fbStorage?.ref(tableNameItems).listAll();
//       final List<Reference> allItemsFiles = resultItems?.items ?? [];

//       final ListResult? resultLooks =
//           await fbStorage?.ref(tableNameLooks).listAll();
//       final List<Reference> allLooksFiles = resultLooks?.items ?? [];

//       allFiles = allItemsFiles + allLooksFiles;

//       await Future.wait(
//         allFiles.map((file) async {
//           await file.delete();
//         }),
//       ).then((value) => logText = "success deleteAllFilesInFb");

//       myLog("deleteItemsInFb", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delAllFilesInFb; Failed to delete items: $e");
//     }
//   }

//   static Future<void> delAllInCloud() async {
//     Fb.delItemsInFb();
//     Fb.delLooksInFb();
//     Fb.delAllFilesInFb();
//     Fb.delDeletedItems();
//     Fb.delDeletedLooks();
//   }

//   static Future<void> delAllInCloudOfAllUsers() async {
//     Fb.delItemsInFbOfAllUsers();
//     Fb.delLooksInFbOfAllUsers();
//     Fb.delAllFilesInFbOfAllUsers();
//     Fb.delDeletedItemsOfAllUsers();
//     Fb.delDeletedLooksOfAllUsers();
//   }

//   static Future<void> delItemsInFb() async {
//     // TODO: 2023.06.27 LATER wrap snackbar in kDebugMode
//     try {
//       final collection = fbFirestore?.collection(tableNameItems);

//       // Fetch documents from the collection where uid equals gUser.uid
//       var querySnapshot =
//           await collection?.where('uid', isEqualTo: gUser.uid!).get();

//       if (querySnapshot == null) {
//         Get.snackbar("Error", "Error during connection to the Internet");
//         return;
//       }

//       if (querySnapshot.docs.isEmpty) {
//         Get.snackbar("Error", "No documents found in collection");
//         return;
//       } else {
//         Get.snackbar(
//             "Info", "${querySnapshot.docs.length} Items will be deleted");
//       }

//       // Create a batch to perform multiple operations
//       var batch = fbFirestore?.batch();

//       for (var doc in querySnapshot.docs) {
//         batch?.delete(doc.reference);
//       }

//       // Commit the batch
//       await batch?.commit();
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delItemsInFb; Failed to delete items: $e");
//     }
//   }

//   static Future<void> delItemsInFbOfAllUsers() async {
//     // TODO: 2023.06.27 LATER wrap snackbar in kDebugMode
//     try {
//       final collection = fbFirestore?.collection(tableNameItems);

//       // Fetch documents from the collection
//       var querySnapshot = await collection?.get();

//       if (querySnapshot == null) {
//         Get.snackbar("Error", "Error during connection to the Internet");
//         return;
//       }

//       if (querySnapshot.docs.isEmpty) {
//         Get.snackbar("Error", "No documents found in collection");
//         return;
//       } else {
//         Get.snackbar(
//             "Info", "${querySnapshot.docs.length} Items will be deleted");
//       }

//       // Create a batch to perform multiple operations
//       var batch = fbFirestore?.batch();

//       for (var doc in querySnapshot.docs) {
//         batch?.delete(doc.reference);
//       }

//       // Commit the batch
//       await batch?.commit();
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delItemsInFb; Failed to delete items: $e");
//     }
//   }

//   static void delDeletedItemsOfAllUsers() {
//     try {
//       String? logText;

//       final collection = fbFirestore?.collection(tableNameDeletedItems);
//       collection?.get().then((querySnapshot) {
//         for (var doc in querySnapshot.docs) {
//           doc.reference.delete();
//         }
//       }).then((value) => logText = "success delDeletedItems");

//       myLog("delDeletedItems", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delDeletedItems; Failed to delete items: $e");
//     }
//   }

//   static void delDeletedLooksOfAllUsers() {
//     try {
//       String? logText;

//       final collection = fbFirestore?.collection(tableNameDeletedLooks);
//       collection?.get().then((querySnapshot) {
//         for (var doc in querySnapshot.docs) {
//           doc.reference.delete();
//         }
//       }).then((value) => logText = "success delDeletedLooks");

//       myLog("delDeletedLooks", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delDeletedLooks; Failed to delete items: $e");
//     }
//   }

//   static void delDeletedItems() {
//     try {
//       String? logText;

//       final collection = fbFirestore?.collection(tableNameDeletedItems);

//       collection
//           ?.where('uid', isEqualTo: gUser.uid)
//           .get()
//           .then((querySnapshot) {
//         for (var doc in querySnapshot.docs) {
//           doc.reference.delete();
//         }
//       }).then((value) => logText = "success delDeletedItems");

//       myLog("delDeletedItems", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delDeletedItems; Failed to delete items: $e");
//     }
//   }

//   static void delDeletedLooks() {
//     try {
//       String? logText;

//       final collection = fbFirestore?.collection(tableNameDeletedLooks);

//       collection
//           ?.where('uid', isEqualTo: gUser.uid)
//           .get()
//           .then((querySnapshot) {
//         for (var doc in querySnapshot.docs) {
//           doc.reference.delete();
//         }
//       }).then((value) => logText = "success delDeletedLooks");

//       myLog("delDeletedLooks", logText);
//     } on Exception catch (e) {
//       Get.snackbar("Error", "delDeletedLooks; Failed to delete items: $e");
//     }
//   }

//   static String? getUid() {
//     return fbAuth?.currentUser?.uid;
//   }

//   static String? getName() {
//     return fbAuth?.currentUser?.displayName;
//   }

//   static String? getEmail() {
//     return fbAuth?.currentUser?.email;
//   }

//   static Future<bool> insertDeletedItemsInFb(
//       List<DeletedItem> listOfDeletedItems) async {
//     bool isSuccessful = true;
//     var tasks = <Future>[];

//     for (var delItem in listOfDeletedItems) {
//       delItem.uid ??= gUser.uid;
//       final docRef = fbFirestore!.collection(tableNameDeletedItems).doc();

//       var task = docRef.set(delItem.toJson()).catchError((error) {
//         // print('Failed to add deleted item: $error');
//         isSuccessful = false;
//       });

//       tasks.add(task);
//     }

//     await Future.wait(tasks);
//     return isSuccessful;
//   }

//   static Future<bool> insertDeletedLooksInFb(
//       List<DeletedLook> listOfDeletedLooks) async {
//     bool isSuccessful = true;
//     var tasks = <Future>[];

//     for (var delLook in listOfDeletedLooks) {
//       delLook.uid ??= gUser.uid;
//       final docRef = fbFirestore!.collection(tableNameDeletedLooks).doc();

//       var task = docRef.set(delLook.toJson()).catchError((error) {
//         // print('Failed to add deleted look: $error');
//         isSuccessful = false;
//       });

//       tasks.add(task);
//     }

//     await Future.wait(tasks);
//     return isSuccessful;
//   }

//   //   void delItemInFb(int id) {
//   //   final collection = fbFirestore?.collection(tableNameItems);
//   //   collection
//   //       ?.doc(id.toString()) // <-- Doc ID to be deleted.
//   //       .delete()
//   //       .then((_) => print('Deleted'))
//   //       .catchError((error) => print('Delete failed: $error'));

//   //   // TODO: 08.01.2023 delete pic in Store
//   // }

// //endregion deletion
// }
