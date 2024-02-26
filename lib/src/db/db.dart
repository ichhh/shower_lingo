import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

import '../../main.dart';

// import 'package:get_storage/get_storage.dart';
// import 'package:path/path.dart' as p;
// import 'package:perfect_wardrobe_5/helpers/logger.dart';

// import '../main.dart';
// import '../pages/item/item_controller.dart';
// import '../pages/settings/settings_controller.dart';
// import '../utils/utils.dart';

part 'db.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner watch

var currentSchemaVersion = 1;

// TODO: 06.10.2022 https://drift.simonbinder.eu/faq/#how-do-i-insert-data-on-the-first-app-start
// TODO: 02.10.2022 l; move DAO to isolates https://drift.simonbinder.eu/docs/advanced-features/isolates/
// TODO: 03.10.2022 l; custom logging https://github.com/simolus3/drift/discussions/2034

class Users extends Table {
  TextColumn get uid => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get subscriptionStatus =>
      text().withDefault(const Constant("free"))(); // free, standard, premium)
  IntColumn get storageUsed => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get lastSynch => dateTime().nullable()();
  DateTimeColumn get paidUntil => dateTime().nullable()();

  TextColumn get signUpMethod =>
      text().nullable()(); // "Google", "Facebook", "Email", etc.)
  BoolColumn get notificationsEnabled =>
      boolean().withDefault(const Constant(false))();
  TextColumn get accountStatus => text().withDefault(
      const Constant("active"))(); //"active", "suspended", "deactivated".
  // TextColumn get preferences => text()();
}

class Items extends Table {
  TextColumn get uid => text().nullable()();
  IntColumn get id => integer().autoIncrement()();

  IntColumn get ms => integer().nullable()();

  TextColumn get deviceId => text().nullable()();

  TextColumn get localWinPath => text().nullable()();

  TextColumn get localFuchsiaPath => text().nullable()();

  TextColumn get localLinuxPath => text().nullable()();

  TextColumn get localAndroidPath => text().nullable()();

  TextColumn get localIosPath => text().nullable()();

  TextColumn get localMasIosPath => text().nullable()();

  TextColumn get firebaseFirestorePath => text().nullable()();

  TextColumn get firebaseStoragePath => text().nullable()();

  TextColumn get size => text().nullable()();

  TextColumn get brand => text().nullable()();

  TextColumn get category => text().nullable()();

  TextColumn get comment => text().nullable()();

  TextColumn get style => text().nullable()();

  TextColumn get season => text().nullable()();

  IntColumn get score => integer().nullable()();

  IntColumn get price => integer().nullable()();

  DateTimeColumn get date => dateTime().nullable()();

  DateTimeColumn get del => dateTime().nullable()();

// @override
// Set<Column> get primaryKey => {id, deviceId};
}

class DeletedItems extends Table {
  TextColumn get uid => text().nullable()();
  IntColumn get id => integer()();

  TextColumn get deviceId => text().nullable()();

  IntColumn get ms => integer()();

// @override
// Set<Column> get primaryKey => {id, deviceId};
}

class Settings extends Table {
  TextColumn get uid => text().nullable()();
  TextColumn get settingName => text()();

  IntColumn get ms => integer().nullable()();

  TextColumn get valueOfSetting => text()();
}

class Synchs extends Table {
  TextColumn get uid => text().nullable()();
  IntColumn get id => integer()();

  TextColumn get deviceId => text().nullable()();

  IntColumn get ms => integer()();

  TextColumn get type => text().nullable()(); //item, look, delItem, delLook
}

@DriftDatabase(tables: [Users, Items, DeletedItems, Settings, Synchs])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => currentSchemaVersion;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // we added the dueDate property in the change from version 1 to
          // version 2
          // await m.addColumn(todos, todos.dueDate);
        }
        if (from < 3) {}
        if (from < 5) {}
      },
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.

    if (kDebugMode) {
      print("DBG; dbFolder ${gAppDir.path}");
    }
    final file = File(p.join(
        gAppDir.path, 'db.db')); //.db extension to be able open via plugin
    return NativeDatabase(file,
        logStatements: true); //logStatements - Detailed comments
  });
}

//region metadata
// class Sizes extends Table {
//   TextColumn get size => text()();
// }
//
// class Brands extends Table {
//   TextColumn get brand => text()();
// }
//
// class Categorys extends Table {
//   TextColumn get category => text()();
// }
//endregion metadata
