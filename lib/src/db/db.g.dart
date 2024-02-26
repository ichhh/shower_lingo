// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subscriptionStatusMeta =
      const VerificationMeta('subscriptionStatus');
  @override
  late final GeneratedColumn<String> subscriptionStatus =
      GeneratedColumn<String>('subscription_status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant("free"));
  static const VerificationMeta _storageUsedMeta =
      const VerificationMeta('storageUsed');
  @override
  late final GeneratedColumn<int> storageUsed = GeneratedColumn<int>(
      'storage_used', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastSynchMeta =
      const VerificationMeta('lastSynch');
  @override
  late final GeneratedColumn<DateTime> lastSynch = GeneratedColumn<DateTime>(
      'last_synch', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _paidUntilMeta =
      const VerificationMeta('paidUntil');
  @override
  late final GeneratedColumn<DateTime> paidUntil = GeneratedColumn<DateTime>(
      'paid_until', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _signUpMethodMeta =
      const VerificationMeta('signUpMethod');
  @override
  late final GeneratedColumn<String> signUpMethod = GeneratedColumn<String>(
      'sign_up_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
      'notifications_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notifications_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _accountStatusMeta =
      const VerificationMeta('accountStatus');
  @override
  late final GeneratedColumn<String> accountStatus = GeneratedColumn<String>(
      'account_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("active"));
  @override
  List<GeneratedColumn> get $columns => [
        uid,
        name,
        email,
        subscriptionStatus,
        storageUsed,
        createdAt,
        lastSynch,
        paidUntil,
        signUpMethod,
        notificationsEnabled,
        accountStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('subscription_status')) {
      context.handle(
          _subscriptionStatusMeta,
          subscriptionStatus.isAcceptableOrUnknown(
              data['subscription_status']!, _subscriptionStatusMeta));
    }
    if (data.containsKey('storage_used')) {
      context.handle(
          _storageUsedMeta,
          storageUsed.isAcceptableOrUnknown(
              data['storage_used']!, _storageUsedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('last_synch')) {
      context.handle(_lastSynchMeta,
          lastSynch.isAcceptableOrUnknown(data['last_synch']!, _lastSynchMeta));
    }
    if (data.containsKey('paid_until')) {
      context.handle(_paidUntilMeta,
          paidUntil.isAcceptableOrUnknown(data['paid_until']!, _paidUntilMeta));
    }
    if (data.containsKey('sign_up_method')) {
      context.handle(
          _signUpMethodMeta,
          signUpMethod.isAcceptableOrUnknown(
              data['sign_up_method']!, _signUpMethodMeta));
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
          _notificationsEnabledMeta,
          notificationsEnabled.isAcceptableOrUnknown(
              data['notifications_enabled']!, _notificationsEnabledMeta));
    }
    if (data.containsKey('account_status')) {
      context.handle(
          _accountStatusMeta,
          accountStatus.isAcceptableOrUnknown(
              data['account_status']!, _accountStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      subscriptionStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}subscription_status'])!,
      storageUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}storage_used']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      lastSynch: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_synch']),
      paidUntil: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}paid_until']),
      signUpMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign_up_method']),
      notificationsEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}notifications_enabled'])!,
      accountStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_status'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String? uid;
  final String? name;
  final String? email;
  final String subscriptionStatus;
  final int? storageUsed;
  final DateTime? createdAt;
  final DateTime? lastSynch;
  final DateTime? paidUntil;
  final String? signUpMethod;
  final bool notificationsEnabled;
  final String accountStatus;
  const User(
      {this.uid,
      this.name,
      this.email,
      required this.subscriptionStatus,
      this.storageUsed,
      this.createdAt,
      this.lastSynch,
      this.paidUntil,
      this.signUpMethod,
      required this.notificationsEnabled,
      required this.accountStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['subscription_status'] = Variable<String>(subscriptionStatus);
    if (!nullToAbsent || storageUsed != null) {
      map['storage_used'] = Variable<int>(storageUsed);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || lastSynch != null) {
      map['last_synch'] = Variable<DateTime>(lastSynch);
    }
    if (!nullToAbsent || paidUntil != null) {
      map['paid_until'] = Variable<DateTime>(paidUntil);
    }
    if (!nullToAbsent || signUpMethod != null) {
      map['sign_up_method'] = Variable<String>(signUpMethod);
    }
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['account_status'] = Variable<String>(accountStatus);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      subscriptionStatus: Value(subscriptionStatus),
      storageUsed: storageUsed == null && nullToAbsent
          ? const Value.absent()
          : Value(storageUsed),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      lastSynch: lastSynch == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSynch),
      paidUntil: paidUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(paidUntil),
      signUpMethod: signUpMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(signUpMethod),
      notificationsEnabled: Value(notificationsEnabled),
      accountStatus: Value(accountStatus),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      uid: serializer.fromJson<String?>(json['uid']),
      name: serializer.fromJson<String?>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      subscriptionStatus:
          serializer.fromJson<String>(json['subscriptionStatus']),
      storageUsed: serializer.fromJson<int?>(json['storageUsed']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      lastSynch: serializer.fromJson<DateTime?>(json['lastSynch']),
      paidUntil: serializer.fromJson<DateTime?>(json['paidUntil']),
      signUpMethod: serializer.fromJson<String?>(json['signUpMethod']),
      notificationsEnabled:
          serializer.fromJson<bool>(json['notificationsEnabled']),
      accountStatus: serializer.fromJson<String>(json['accountStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String?>(uid),
      'name': serializer.toJson<String?>(name),
      'email': serializer.toJson<String?>(email),
      'subscriptionStatus': serializer.toJson<String>(subscriptionStatus),
      'storageUsed': serializer.toJson<int?>(storageUsed),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'lastSynch': serializer.toJson<DateTime?>(lastSynch),
      'paidUntil': serializer.toJson<DateTime?>(paidUntil),
      'signUpMethod': serializer.toJson<String?>(signUpMethod),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'accountStatus': serializer.toJson<String>(accountStatus),
    };
  }

  User copyWith(
          {Value<String?> uid = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> email = const Value.absent(),
          String? subscriptionStatus,
          Value<int?> storageUsed = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> lastSynch = const Value.absent(),
          Value<DateTime?> paidUntil = const Value.absent(),
          Value<String?> signUpMethod = const Value.absent(),
          bool? notificationsEnabled,
          String? accountStatus}) =>
      User(
        uid: uid.present ? uid.value : this.uid,
        name: name.present ? name.value : this.name,
        email: email.present ? email.value : this.email,
        subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
        storageUsed: storageUsed.present ? storageUsed.value : this.storageUsed,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        lastSynch: lastSynch.present ? lastSynch.value : this.lastSynch,
        paidUntil: paidUntil.present ? paidUntil.value : this.paidUntil,
        signUpMethod:
            signUpMethod.present ? signUpMethod.value : this.signUpMethod,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        accountStatus: accountStatus ?? this.accountStatus,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('subscriptionStatus: $subscriptionStatus, ')
          ..write('storageUsed: $storageUsed, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastSynch: $lastSynch, ')
          ..write('paidUntil: $paidUntil, ')
          ..write('signUpMethod: $signUpMethod, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('accountStatus: $accountStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uid,
      name,
      email,
      subscriptionStatus,
      storageUsed,
      createdAt,
      lastSynch,
      paidUntil,
      signUpMethod,
      notificationsEnabled,
      accountStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.email == this.email &&
          other.subscriptionStatus == this.subscriptionStatus &&
          other.storageUsed == this.storageUsed &&
          other.createdAt == this.createdAt &&
          other.lastSynch == this.lastSynch &&
          other.paidUntil == this.paidUntil &&
          other.signUpMethod == this.signUpMethod &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.accountStatus == this.accountStatus);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String?> uid;
  final Value<String?> name;
  final Value<String?> email;
  final Value<String> subscriptionStatus;
  final Value<int?> storageUsed;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> lastSynch;
  final Value<DateTime?> paidUntil;
  final Value<String?> signUpMethod;
  final Value<bool> notificationsEnabled;
  final Value<String> accountStatus;
  final Value<int> rowid;
  const UsersCompanion({
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.subscriptionStatus = const Value.absent(),
    this.storageUsed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastSynch = const Value.absent(),
    this.paidUntil = const Value.absent(),
    this.signUpMethod = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.accountStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.subscriptionStatus = const Value.absent(),
    this.storageUsed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastSynch = const Value.absent(),
    this.paidUntil = const Value.absent(),
    this.signUpMethod = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.accountStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<String>? uid,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? subscriptionStatus,
    Expression<int>? storageUsed,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastSynch,
    Expression<DateTime>? paidUntil,
    Expression<String>? signUpMethod,
    Expression<bool>? notificationsEnabled,
    Expression<String>? accountStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (subscriptionStatus != null) 'subscription_status': subscriptionStatus,
      if (storageUsed != null) 'storage_used': storageUsed,
      if (createdAt != null) 'created_at': createdAt,
      if (lastSynch != null) 'last_synch': lastSynch,
      if (paidUntil != null) 'paid_until': paidUntil,
      if (signUpMethod != null) 'sign_up_method': signUpMethod,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (accountStatus != null) 'account_status': accountStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String?>? uid,
      Value<String?>? name,
      Value<String?>? email,
      Value<String>? subscriptionStatus,
      Value<int?>? storageUsed,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? lastSynch,
      Value<DateTime?>? paidUntil,
      Value<String?>? signUpMethod,
      Value<bool>? notificationsEnabled,
      Value<String>? accountStatus,
      Value<int>? rowid}) {
    return UsersCompanion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      storageUsed: storageUsed ?? this.storageUsed,
      createdAt: createdAt ?? this.createdAt,
      lastSynch: lastSynch ?? this.lastSynch,
      paidUntil: paidUntil ?? this.paidUntil,
      signUpMethod: signUpMethod ?? this.signUpMethod,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      accountStatus: accountStatus ?? this.accountStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (subscriptionStatus.present) {
      map['subscription_status'] = Variable<String>(subscriptionStatus.value);
    }
    if (storageUsed.present) {
      map['storage_used'] = Variable<int>(storageUsed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastSynch.present) {
      map['last_synch'] = Variable<DateTime>(lastSynch.value);
    }
    if (paidUntil.present) {
      map['paid_until'] = Variable<DateTime>(paidUntil.value);
    }
    if (signUpMethod.present) {
      map['sign_up_method'] = Variable<String>(signUpMethod.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (accountStatus.present) {
      map['account_status'] = Variable<String>(accountStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('subscriptionStatus: $subscriptionStatus, ')
          ..write('storageUsed: $storageUsed, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastSynch: $lastSynch, ')
          ..write('paidUntil: $paidUntil, ')
          ..write('signUpMethod: $signUpMethod, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('accountStatus: $accountStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _msMeta = const VerificationMeta('ms');
  @override
  late final GeneratedColumn<int> ms = GeneratedColumn<int>(
      'ms', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localWinPathMeta =
      const VerificationMeta('localWinPath');
  @override
  late final GeneratedColumn<String> localWinPath = GeneratedColumn<String>(
      'local_win_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localFuchsiaPathMeta =
      const VerificationMeta('localFuchsiaPath');
  @override
  late final GeneratedColumn<String> localFuchsiaPath = GeneratedColumn<String>(
      'local_fuchsia_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localLinuxPathMeta =
      const VerificationMeta('localLinuxPath');
  @override
  late final GeneratedColumn<String> localLinuxPath = GeneratedColumn<String>(
      'local_linux_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localAndroidPathMeta =
      const VerificationMeta('localAndroidPath');
  @override
  late final GeneratedColumn<String> localAndroidPath = GeneratedColumn<String>(
      'local_android_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localIosPathMeta =
      const VerificationMeta('localIosPath');
  @override
  late final GeneratedColumn<String> localIosPath = GeneratedColumn<String>(
      'local_ios_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _localMasIosPathMeta =
      const VerificationMeta('localMasIosPath');
  @override
  late final GeneratedColumn<String> localMasIosPath = GeneratedColumn<String>(
      'local_mas_ios_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firebaseFirestorePathMeta =
      const VerificationMeta('firebaseFirestorePath');
  @override
  late final GeneratedColumn<String> firebaseFirestorePath =
      GeneratedColumn<String>('firebase_firestore_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firebaseStoragePathMeta =
      const VerificationMeta('firebaseStoragePath');
  @override
  late final GeneratedColumn<String> firebaseStoragePath =
      GeneratedColumn<String>('firebase_storage_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
      'size', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
      'style', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<String> season = GeneratedColumn<String>(
      'season', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _delMeta = const VerificationMeta('del');
  @override
  late final GeneratedColumn<DateTime> del = GeneratedColumn<DateTime>(
      'del', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uid,
        id,
        ms,
        deviceId,
        localWinPath,
        localFuchsiaPath,
        localLinuxPath,
        localAndroidPath,
        localIosPath,
        localMasIosPath,
        firebaseFirestorePath,
        firebaseStoragePath,
        size,
        brand,
        category,
        comment,
        style,
        season,
        score,
        price,
        date,
        del
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ms')) {
      context.handle(_msMeta, ms.isAcceptableOrUnknown(data['ms']!, _msMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    }
    if (data.containsKey('local_win_path')) {
      context.handle(
          _localWinPathMeta,
          localWinPath.isAcceptableOrUnknown(
              data['local_win_path']!, _localWinPathMeta));
    }
    if (data.containsKey('local_fuchsia_path')) {
      context.handle(
          _localFuchsiaPathMeta,
          localFuchsiaPath.isAcceptableOrUnknown(
              data['local_fuchsia_path']!, _localFuchsiaPathMeta));
    }
    if (data.containsKey('local_linux_path')) {
      context.handle(
          _localLinuxPathMeta,
          localLinuxPath.isAcceptableOrUnknown(
              data['local_linux_path']!, _localLinuxPathMeta));
    }
    if (data.containsKey('local_android_path')) {
      context.handle(
          _localAndroidPathMeta,
          localAndroidPath.isAcceptableOrUnknown(
              data['local_android_path']!, _localAndroidPathMeta));
    }
    if (data.containsKey('local_ios_path')) {
      context.handle(
          _localIosPathMeta,
          localIosPath.isAcceptableOrUnknown(
              data['local_ios_path']!, _localIosPathMeta));
    }
    if (data.containsKey('local_mas_ios_path')) {
      context.handle(
          _localMasIosPathMeta,
          localMasIosPath.isAcceptableOrUnknown(
              data['local_mas_ios_path']!, _localMasIosPathMeta));
    }
    if (data.containsKey('firebase_firestore_path')) {
      context.handle(
          _firebaseFirestorePathMeta,
          firebaseFirestorePath.isAcceptableOrUnknown(
              data['firebase_firestore_path']!, _firebaseFirestorePathMeta));
    }
    if (data.containsKey('firebase_storage_path')) {
      context.handle(
          _firebaseStoragePathMeta,
          firebaseStoragePath.isAcceptableOrUnknown(
              data['firebase_storage_path']!, _firebaseStoragePathMeta));
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style']!, _styleMeta));
    }
    if (data.containsKey('season')) {
      context.handle(_seasonMeta,
          season.isAcceptableOrUnknown(data['season']!, _seasonMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('del')) {
      context.handle(
          _delMeta, del.isAcceptableOrUnknown(data['del']!, _delMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ms: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ms']),
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id']),
      localWinPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_win_path']),
      localFuchsiaPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_fuchsia_path']),
      localLinuxPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_linux_path']),
      localAndroidPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_android_path']),
      localIosPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_ios_path']),
      localMasIosPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_mas_ios_path']),
      firebaseFirestorePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}firebase_firestore_path']),
      firebaseStoragePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}firebase_storage_path']),
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}size']),
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      style: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style']),
      season: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}season']),
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
      del: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}del']),
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final String? uid;
  final int id;
  final int? ms;
  final String? deviceId;
  final String? localWinPath;
  final String? localFuchsiaPath;
  final String? localLinuxPath;
  final String? localAndroidPath;
  final String? localIosPath;
  final String? localMasIosPath;
  final String? firebaseFirestorePath;
  final String? firebaseStoragePath;
  final String? size;
  final String? brand;
  final String? category;
  final String? comment;
  final String? style;
  final String? season;
  final int? score;
  final int? price;
  final DateTime? date;
  final DateTime? del;
  const Item(
      {this.uid,
      required this.id,
      this.ms,
      this.deviceId,
      this.localWinPath,
      this.localFuchsiaPath,
      this.localLinuxPath,
      this.localAndroidPath,
      this.localIosPath,
      this.localMasIosPath,
      this.firebaseFirestorePath,
      this.firebaseStoragePath,
      this.size,
      this.brand,
      this.category,
      this.comment,
      this.style,
      this.season,
      this.score,
      this.price,
      this.date,
      this.del});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || ms != null) {
      map['ms'] = Variable<int>(ms);
    }
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    if (!nullToAbsent || localWinPath != null) {
      map['local_win_path'] = Variable<String>(localWinPath);
    }
    if (!nullToAbsent || localFuchsiaPath != null) {
      map['local_fuchsia_path'] = Variable<String>(localFuchsiaPath);
    }
    if (!nullToAbsent || localLinuxPath != null) {
      map['local_linux_path'] = Variable<String>(localLinuxPath);
    }
    if (!nullToAbsent || localAndroidPath != null) {
      map['local_android_path'] = Variable<String>(localAndroidPath);
    }
    if (!nullToAbsent || localIosPath != null) {
      map['local_ios_path'] = Variable<String>(localIosPath);
    }
    if (!nullToAbsent || localMasIosPath != null) {
      map['local_mas_ios_path'] = Variable<String>(localMasIosPath);
    }
    if (!nullToAbsent || firebaseFirestorePath != null) {
      map['firebase_firestore_path'] = Variable<String>(firebaseFirestorePath);
    }
    if (!nullToAbsent || firebaseStoragePath != null) {
      map['firebase_storage_path'] = Variable<String>(firebaseStoragePath);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<String>(size);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || style != null) {
      map['style'] = Variable<String>(style);
    }
    if (!nullToAbsent || season != null) {
      map['season'] = Variable<String>(season);
    }
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || del != null) {
      map['del'] = Variable<DateTime>(del);
    }
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      id: Value(id),
      ms: ms == null && nullToAbsent ? const Value.absent() : Value(ms),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      localWinPath: localWinPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localWinPath),
      localFuchsiaPath: localFuchsiaPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localFuchsiaPath),
      localLinuxPath: localLinuxPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localLinuxPath),
      localAndroidPath: localAndroidPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localAndroidPath),
      localIosPath: localIosPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localIosPath),
      localMasIosPath: localMasIosPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localMasIosPath),
      firebaseFirestorePath: firebaseFirestorePath == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseFirestorePath),
      firebaseStoragePath: firebaseStoragePath == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseStoragePath),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      style:
          style == null && nullToAbsent ? const Value.absent() : Value(style),
      season:
          season == null && nullToAbsent ? const Value.absent() : Value(season),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      del: del == null && nullToAbsent ? const Value.absent() : Value(del),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      uid: serializer.fromJson<String?>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
      ms: serializer.fromJson<int?>(json['ms']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      localWinPath: serializer.fromJson<String?>(json['localWinPath']),
      localFuchsiaPath: serializer.fromJson<String?>(json['localFuchsiaPath']),
      localLinuxPath: serializer.fromJson<String?>(json['localLinuxPath']),
      localAndroidPath: serializer.fromJson<String?>(json['localAndroidPath']),
      localIosPath: serializer.fromJson<String?>(json['localIosPath']),
      localMasIosPath: serializer.fromJson<String?>(json['localMasIosPath']),
      firebaseFirestorePath:
          serializer.fromJson<String?>(json['firebaseFirestorePath']),
      firebaseStoragePath:
          serializer.fromJson<String?>(json['firebaseStoragePath']),
      size: serializer.fromJson<String?>(json['size']),
      brand: serializer.fromJson<String?>(json['brand']),
      category: serializer.fromJson<String?>(json['category']),
      comment: serializer.fromJson<String?>(json['comment']),
      style: serializer.fromJson<String?>(json['style']),
      season: serializer.fromJson<String?>(json['season']),
      score: serializer.fromJson<int?>(json['score']),
      price: serializer.fromJson<int?>(json['price']),
      date: serializer.fromJson<DateTime?>(json['date']),
      del: serializer.fromJson<DateTime?>(json['del']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String?>(uid),
      'id': serializer.toJson<int>(id),
      'ms': serializer.toJson<int?>(ms),
      'deviceId': serializer.toJson<String?>(deviceId),
      'localWinPath': serializer.toJson<String?>(localWinPath),
      'localFuchsiaPath': serializer.toJson<String?>(localFuchsiaPath),
      'localLinuxPath': serializer.toJson<String?>(localLinuxPath),
      'localAndroidPath': serializer.toJson<String?>(localAndroidPath),
      'localIosPath': serializer.toJson<String?>(localIosPath),
      'localMasIosPath': serializer.toJson<String?>(localMasIosPath),
      'firebaseFirestorePath':
          serializer.toJson<String?>(firebaseFirestorePath),
      'firebaseStoragePath': serializer.toJson<String?>(firebaseStoragePath),
      'size': serializer.toJson<String?>(size),
      'brand': serializer.toJson<String?>(brand),
      'category': serializer.toJson<String?>(category),
      'comment': serializer.toJson<String?>(comment),
      'style': serializer.toJson<String?>(style),
      'season': serializer.toJson<String?>(season),
      'score': serializer.toJson<int?>(score),
      'price': serializer.toJson<int?>(price),
      'date': serializer.toJson<DateTime?>(date),
      'del': serializer.toJson<DateTime?>(del),
    };
  }

  Item copyWith(
          {Value<String?> uid = const Value.absent(),
          int? id,
          Value<int?> ms = const Value.absent(),
          Value<String?> deviceId = const Value.absent(),
          Value<String?> localWinPath = const Value.absent(),
          Value<String?> localFuchsiaPath = const Value.absent(),
          Value<String?> localLinuxPath = const Value.absent(),
          Value<String?> localAndroidPath = const Value.absent(),
          Value<String?> localIosPath = const Value.absent(),
          Value<String?> localMasIosPath = const Value.absent(),
          Value<String?> firebaseFirestorePath = const Value.absent(),
          Value<String?> firebaseStoragePath = const Value.absent(),
          Value<String?> size = const Value.absent(),
          Value<String?> brand = const Value.absent(),
          Value<String?> category = const Value.absent(),
          Value<String?> comment = const Value.absent(),
          Value<String?> style = const Value.absent(),
          Value<String?> season = const Value.absent(),
          Value<int?> score = const Value.absent(),
          Value<int?> price = const Value.absent(),
          Value<DateTime?> date = const Value.absent(),
          Value<DateTime?> del = const Value.absent()}) =>
      Item(
        uid: uid.present ? uid.value : this.uid,
        id: id ?? this.id,
        ms: ms.present ? ms.value : this.ms,
        deviceId: deviceId.present ? deviceId.value : this.deviceId,
        localWinPath:
            localWinPath.present ? localWinPath.value : this.localWinPath,
        localFuchsiaPath: localFuchsiaPath.present
            ? localFuchsiaPath.value
            : this.localFuchsiaPath,
        localLinuxPath:
            localLinuxPath.present ? localLinuxPath.value : this.localLinuxPath,
        localAndroidPath: localAndroidPath.present
            ? localAndroidPath.value
            : this.localAndroidPath,
        localIosPath:
            localIosPath.present ? localIosPath.value : this.localIosPath,
        localMasIosPath: localMasIosPath.present
            ? localMasIosPath.value
            : this.localMasIosPath,
        firebaseFirestorePath: firebaseFirestorePath.present
            ? firebaseFirestorePath.value
            : this.firebaseFirestorePath,
        firebaseStoragePath: firebaseStoragePath.present
            ? firebaseStoragePath.value
            : this.firebaseStoragePath,
        size: size.present ? size.value : this.size,
        brand: brand.present ? brand.value : this.brand,
        category: category.present ? category.value : this.category,
        comment: comment.present ? comment.value : this.comment,
        style: style.present ? style.value : this.style,
        season: season.present ? season.value : this.season,
        score: score.present ? score.value : this.score,
        price: price.present ? price.value : this.price,
        date: date.present ? date.value : this.date,
        del: del.present ? del.value : this.del,
      );
  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('ms: $ms, ')
          ..write('deviceId: $deviceId, ')
          ..write('localWinPath: $localWinPath, ')
          ..write('localFuchsiaPath: $localFuchsiaPath, ')
          ..write('localLinuxPath: $localLinuxPath, ')
          ..write('localAndroidPath: $localAndroidPath, ')
          ..write('localIosPath: $localIosPath, ')
          ..write('localMasIosPath: $localMasIosPath, ')
          ..write('firebaseFirestorePath: $firebaseFirestorePath, ')
          ..write('firebaseStoragePath: $firebaseStoragePath, ')
          ..write('size: $size, ')
          ..write('brand: $brand, ')
          ..write('category: $category, ')
          ..write('comment: $comment, ')
          ..write('style: $style, ')
          ..write('season: $season, ')
          ..write('score: $score, ')
          ..write('price: $price, ')
          ..write('date: $date, ')
          ..write('del: $del')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        uid,
        id,
        ms,
        deviceId,
        localWinPath,
        localFuchsiaPath,
        localLinuxPath,
        localAndroidPath,
        localIosPath,
        localMasIosPath,
        firebaseFirestorePath,
        firebaseStoragePath,
        size,
        brand,
        category,
        comment,
        style,
        season,
        score,
        price,
        date,
        del
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.uid == this.uid &&
          other.id == this.id &&
          other.ms == this.ms &&
          other.deviceId == this.deviceId &&
          other.localWinPath == this.localWinPath &&
          other.localFuchsiaPath == this.localFuchsiaPath &&
          other.localLinuxPath == this.localLinuxPath &&
          other.localAndroidPath == this.localAndroidPath &&
          other.localIosPath == this.localIosPath &&
          other.localMasIosPath == this.localMasIosPath &&
          other.firebaseFirestorePath == this.firebaseFirestorePath &&
          other.firebaseStoragePath == this.firebaseStoragePath &&
          other.size == this.size &&
          other.brand == this.brand &&
          other.category == this.category &&
          other.comment == this.comment &&
          other.style == this.style &&
          other.season == this.season &&
          other.score == this.score &&
          other.price == this.price &&
          other.date == this.date &&
          other.del == this.del);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<String?> uid;
  final Value<int> id;
  final Value<int?> ms;
  final Value<String?> deviceId;
  final Value<String?> localWinPath;
  final Value<String?> localFuchsiaPath;
  final Value<String?> localLinuxPath;
  final Value<String?> localAndroidPath;
  final Value<String?> localIosPath;
  final Value<String?> localMasIosPath;
  final Value<String?> firebaseFirestorePath;
  final Value<String?> firebaseStoragePath;
  final Value<String?> size;
  final Value<String?> brand;
  final Value<String?> category;
  final Value<String?> comment;
  final Value<String?> style;
  final Value<String?> season;
  final Value<int?> score;
  final Value<int?> price;
  final Value<DateTime?> date;
  final Value<DateTime?> del;
  const ItemsCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.ms = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.localWinPath = const Value.absent(),
    this.localFuchsiaPath = const Value.absent(),
    this.localLinuxPath = const Value.absent(),
    this.localAndroidPath = const Value.absent(),
    this.localIosPath = const Value.absent(),
    this.localMasIosPath = const Value.absent(),
    this.firebaseFirestorePath = const Value.absent(),
    this.firebaseStoragePath = const Value.absent(),
    this.size = const Value.absent(),
    this.brand = const Value.absent(),
    this.category = const Value.absent(),
    this.comment = const Value.absent(),
    this.style = const Value.absent(),
    this.season = const Value.absent(),
    this.score = const Value.absent(),
    this.price = const Value.absent(),
    this.date = const Value.absent(),
    this.del = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.ms = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.localWinPath = const Value.absent(),
    this.localFuchsiaPath = const Value.absent(),
    this.localLinuxPath = const Value.absent(),
    this.localAndroidPath = const Value.absent(),
    this.localIosPath = const Value.absent(),
    this.localMasIosPath = const Value.absent(),
    this.firebaseFirestorePath = const Value.absent(),
    this.firebaseStoragePath = const Value.absent(),
    this.size = const Value.absent(),
    this.brand = const Value.absent(),
    this.category = const Value.absent(),
    this.comment = const Value.absent(),
    this.style = const Value.absent(),
    this.season = const Value.absent(),
    this.score = const Value.absent(),
    this.price = const Value.absent(),
    this.date = const Value.absent(),
    this.del = const Value.absent(),
  });
  static Insertable<Item> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<int>? ms,
    Expression<String>? deviceId,
    Expression<String>? localWinPath,
    Expression<String>? localFuchsiaPath,
    Expression<String>? localLinuxPath,
    Expression<String>? localAndroidPath,
    Expression<String>? localIosPath,
    Expression<String>? localMasIosPath,
    Expression<String>? firebaseFirestorePath,
    Expression<String>? firebaseStoragePath,
    Expression<String>? size,
    Expression<String>? brand,
    Expression<String>? category,
    Expression<String>? comment,
    Expression<String>? style,
    Expression<String>? season,
    Expression<int>? score,
    Expression<int>? price,
    Expression<DateTime>? date,
    Expression<DateTime>? del,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (ms != null) 'ms': ms,
      if (deviceId != null) 'device_id': deviceId,
      if (localWinPath != null) 'local_win_path': localWinPath,
      if (localFuchsiaPath != null) 'local_fuchsia_path': localFuchsiaPath,
      if (localLinuxPath != null) 'local_linux_path': localLinuxPath,
      if (localAndroidPath != null) 'local_android_path': localAndroidPath,
      if (localIosPath != null) 'local_ios_path': localIosPath,
      if (localMasIosPath != null) 'local_mas_ios_path': localMasIosPath,
      if (firebaseFirestorePath != null)
        'firebase_firestore_path': firebaseFirestorePath,
      if (firebaseStoragePath != null)
        'firebase_storage_path': firebaseStoragePath,
      if (size != null) 'size': size,
      if (brand != null) 'brand': brand,
      if (category != null) 'category': category,
      if (comment != null) 'comment': comment,
      if (style != null) 'style': style,
      if (season != null) 'season': season,
      if (score != null) 'score': score,
      if (price != null) 'price': price,
      if (date != null) 'date': date,
      if (del != null) 'del': del,
    });
  }

  ItemsCompanion copyWith(
      {Value<String?>? uid,
      Value<int>? id,
      Value<int?>? ms,
      Value<String?>? deviceId,
      Value<String?>? localWinPath,
      Value<String?>? localFuchsiaPath,
      Value<String?>? localLinuxPath,
      Value<String?>? localAndroidPath,
      Value<String?>? localIosPath,
      Value<String?>? localMasIosPath,
      Value<String?>? firebaseFirestorePath,
      Value<String?>? firebaseStoragePath,
      Value<String?>? size,
      Value<String?>? brand,
      Value<String?>? category,
      Value<String?>? comment,
      Value<String?>? style,
      Value<String?>? season,
      Value<int?>? score,
      Value<int?>? price,
      Value<DateTime?>? date,
      Value<DateTime?>? del}) {
    return ItemsCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      ms: ms ?? this.ms,
      deviceId: deviceId ?? this.deviceId,
      localWinPath: localWinPath ?? this.localWinPath,
      localFuchsiaPath: localFuchsiaPath ?? this.localFuchsiaPath,
      localLinuxPath: localLinuxPath ?? this.localLinuxPath,
      localAndroidPath: localAndroidPath ?? this.localAndroidPath,
      localIosPath: localIosPath ?? this.localIosPath,
      localMasIosPath: localMasIosPath ?? this.localMasIosPath,
      firebaseFirestorePath:
          firebaseFirestorePath ?? this.firebaseFirestorePath,
      firebaseStoragePath: firebaseStoragePath ?? this.firebaseStoragePath,
      size: size ?? this.size,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      comment: comment ?? this.comment,
      style: style ?? this.style,
      season: season ?? this.season,
      score: score ?? this.score,
      price: price ?? this.price,
      date: date ?? this.date,
      del: del ?? this.del,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ms.present) {
      map['ms'] = Variable<int>(ms.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (localWinPath.present) {
      map['local_win_path'] = Variable<String>(localWinPath.value);
    }
    if (localFuchsiaPath.present) {
      map['local_fuchsia_path'] = Variable<String>(localFuchsiaPath.value);
    }
    if (localLinuxPath.present) {
      map['local_linux_path'] = Variable<String>(localLinuxPath.value);
    }
    if (localAndroidPath.present) {
      map['local_android_path'] = Variable<String>(localAndroidPath.value);
    }
    if (localIosPath.present) {
      map['local_ios_path'] = Variable<String>(localIosPath.value);
    }
    if (localMasIosPath.present) {
      map['local_mas_ios_path'] = Variable<String>(localMasIosPath.value);
    }
    if (firebaseFirestorePath.present) {
      map['firebase_firestore_path'] =
          Variable<String>(firebaseFirestorePath.value);
    }
    if (firebaseStoragePath.present) {
      map['firebase_storage_path'] =
          Variable<String>(firebaseStoragePath.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (season.present) {
      map['season'] = Variable<String>(season.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (del.present) {
      map['del'] = Variable<DateTime>(del.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('ms: $ms, ')
          ..write('deviceId: $deviceId, ')
          ..write('localWinPath: $localWinPath, ')
          ..write('localFuchsiaPath: $localFuchsiaPath, ')
          ..write('localLinuxPath: $localLinuxPath, ')
          ..write('localAndroidPath: $localAndroidPath, ')
          ..write('localIosPath: $localIosPath, ')
          ..write('localMasIosPath: $localMasIosPath, ')
          ..write('firebaseFirestorePath: $firebaseFirestorePath, ')
          ..write('firebaseStoragePath: $firebaseStoragePath, ')
          ..write('size: $size, ')
          ..write('brand: $brand, ')
          ..write('category: $category, ')
          ..write('comment: $comment, ')
          ..write('style: $style, ')
          ..write('season: $season, ')
          ..write('score: $score, ')
          ..write('price: $price, ')
          ..write('date: $date, ')
          ..write('del: $del')
          ..write(')'))
        .toString();
  }
}

class $DeletedItemsTable extends DeletedItems
    with TableInfo<$DeletedItemsTable, DeletedItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeletedItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _msMeta = const VerificationMeta('ms');
  @override
  late final GeneratedColumn<int> ms = GeneratedColumn<int>(
      'ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uid, id, deviceId, ms];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deleted_items';
  @override
  VerificationContext validateIntegrity(Insertable<DeletedItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    }
    if (data.containsKey('ms')) {
      context.handle(_msMeta, ms.isAcceptableOrUnknown(data['ms']!, _msMeta));
    } else if (isInserting) {
      context.missing(_msMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DeletedItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeletedItem(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id']),
      ms: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ms'])!,
    );
  }

  @override
  $DeletedItemsTable createAlias(String alias) {
    return $DeletedItemsTable(attachedDatabase, alias);
  }
}

class DeletedItem extends DataClass implements Insertable<DeletedItem> {
  final String? uid;
  final int id;
  final String? deviceId;
  final int ms;
  const DeletedItem(
      {this.uid, required this.id, this.deviceId, required this.ms});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['ms'] = Variable<int>(ms);
    return map;
  }

  DeletedItemsCompanion toCompanion(bool nullToAbsent) {
    return DeletedItemsCompanion(
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      id: Value(id),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      ms: Value(ms),
    );
  }

  factory DeletedItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeletedItem(
      uid: serializer.fromJson<String?>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      ms: serializer.fromJson<int>(json['ms']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String?>(uid),
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String?>(deviceId),
      'ms': serializer.toJson<int>(ms),
    };
  }

  DeletedItem copyWith(
          {Value<String?> uid = const Value.absent(),
          int? id,
          Value<String?> deviceId = const Value.absent(),
          int? ms}) =>
      DeletedItem(
        uid: uid.present ? uid.value : this.uid,
        id: id ?? this.id,
        deviceId: deviceId.present ? deviceId.value : this.deviceId,
        ms: ms ?? this.ms,
      );
  @override
  String toString() {
    return (StringBuffer('DeletedItem(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('ms: $ms')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, id, deviceId, ms);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeletedItem &&
          other.uid == this.uid &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.ms == this.ms);
}

class DeletedItemsCompanion extends UpdateCompanion<DeletedItem> {
  final Value<String?> uid;
  final Value<int> id;
  final Value<String?> deviceId;
  final Value<int> ms;
  final Value<int> rowid;
  const DeletedItemsCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.ms = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeletedItemsCompanion.insert({
    this.uid = const Value.absent(),
    required int id,
    this.deviceId = const Value.absent(),
    required int ms,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        ms = Value(ms);
  static Insertable<DeletedItem> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<int>? ms,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (ms != null) 'ms': ms,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeletedItemsCompanion copyWith(
      {Value<String?>? uid,
      Value<int>? id,
      Value<String?>? deviceId,
      Value<int>? ms,
      Value<int>? rowid}) {
    return DeletedItemsCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      ms: ms ?? this.ms,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (ms.present) {
      map['ms'] = Variable<int>(ms.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeletedItemsCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('ms: $ms, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _settingNameMeta =
      const VerificationMeta('settingName');
  @override
  late final GeneratedColumn<String> settingName = GeneratedColumn<String>(
      'setting_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _msMeta = const VerificationMeta('ms');
  @override
  late final GeneratedColumn<int> ms = GeneratedColumn<int>(
      'ms', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _valueOfSettingMeta =
      const VerificationMeta('valueOfSetting');
  @override
  late final GeneratedColumn<String> valueOfSetting = GeneratedColumn<String>(
      'value_of_setting', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uid, settingName, ms, valueOfSetting];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('setting_name')) {
      context.handle(
          _settingNameMeta,
          settingName.isAcceptableOrUnknown(
              data['setting_name']!, _settingNameMeta));
    } else if (isInserting) {
      context.missing(_settingNameMeta);
    }
    if (data.containsKey('ms')) {
      context.handle(_msMeta, ms.isAcceptableOrUnknown(data['ms']!, _msMeta));
    }
    if (data.containsKey('value_of_setting')) {
      context.handle(
          _valueOfSettingMeta,
          valueOfSetting.isAcceptableOrUnknown(
              data['value_of_setting']!, _valueOfSettingMeta));
    } else if (isInserting) {
      context.missing(_valueOfSettingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      settingName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}setting_name'])!,
      ms: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ms']),
      valueOfSetting: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}value_of_setting'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String? uid;
  final String settingName;
  final int? ms;
  final String valueOfSetting;
  const Setting(
      {this.uid,
      required this.settingName,
      this.ms,
      required this.valueOfSetting});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    map['setting_name'] = Variable<String>(settingName);
    if (!nullToAbsent || ms != null) {
      map['ms'] = Variable<int>(ms);
    }
    map['value_of_setting'] = Variable<String>(valueOfSetting);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      settingName: Value(settingName),
      ms: ms == null && nullToAbsent ? const Value.absent() : Value(ms),
      valueOfSetting: Value(valueOfSetting),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      uid: serializer.fromJson<String?>(json['uid']),
      settingName: serializer.fromJson<String>(json['settingName']),
      ms: serializer.fromJson<int?>(json['ms']),
      valueOfSetting: serializer.fromJson<String>(json['valueOfSetting']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String?>(uid),
      'settingName': serializer.toJson<String>(settingName),
      'ms': serializer.toJson<int?>(ms),
      'valueOfSetting': serializer.toJson<String>(valueOfSetting),
    };
  }

  Setting copyWith(
          {Value<String?> uid = const Value.absent(),
          String? settingName,
          Value<int?> ms = const Value.absent(),
          String? valueOfSetting}) =>
      Setting(
        uid: uid.present ? uid.value : this.uid,
        settingName: settingName ?? this.settingName,
        ms: ms.present ? ms.value : this.ms,
        valueOfSetting: valueOfSetting ?? this.valueOfSetting,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('uid: $uid, ')
          ..write('settingName: $settingName, ')
          ..write('ms: $ms, ')
          ..write('valueOfSetting: $valueOfSetting')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, settingName, ms, valueOfSetting);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.uid == this.uid &&
          other.settingName == this.settingName &&
          other.ms == this.ms &&
          other.valueOfSetting == this.valueOfSetting);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String?> uid;
  final Value<String> settingName;
  final Value<int?> ms;
  final Value<String> valueOfSetting;
  final Value<int> rowid;
  const SettingsCompanion({
    this.uid = const Value.absent(),
    this.settingName = const Value.absent(),
    this.ms = const Value.absent(),
    this.valueOfSetting = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.uid = const Value.absent(),
    required String settingName,
    this.ms = const Value.absent(),
    required String valueOfSetting,
    this.rowid = const Value.absent(),
  })  : settingName = Value(settingName),
        valueOfSetting = Value(valueOfSetting);
  static Insertable<Setting> custom({
    Expression<String>? uid,
    Expression<String>? settingName,
    Expression<int>? ms,
    Expression<String>? valueOfSetting,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (settingName != null) 'setting_name': settingName,
      if (ms != null) 'ms': ms,
      if (valueOfSetting != null) 'value_of_setting': valueOfSetting,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith(
      {Value<String?>? uid,
      Value<String>? settingName,
      Value<int?>? ms,
      Value<String>? valueOfSetting,
      Value<int>? rowid}) {
    return SettingsCompanion(
      uid: uid ?? this.uid,
      settingName: settingName ?? this.settingName,
      ms: ms ?? this.ms,
      valueOfSetting: valueOfSetting ?? this.valueOfSetting,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (settingName.present) {
      map['setting_name'] = Variable<String>(settingName.value);
    }
    if (ms.present) {
      map['ms'] = Variable<int>(ms.value);
    }
    if (valueOfSetting.present) {
      map['value_of_setting'] = Variable<String>(valueOfSetting.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('uid: $uid, ')
          ..write('settingName: $settingName, ')
          ..write('ms: $ms, ')
          ..write('valueOfSetting: $valueOfSetting, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SynchsTable extends Synchs with TableInfo<$SynchsTable, Synch> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SynchsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _msMeta = const VerificationMeta('ms');
  @override
  late final GeneratedColumn<int> ms = GeneratedColumn<int>(
      'ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [uid, id, deviceId, ms, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'synchs';
  @override
  VerificationContext validateIntegrity(Insertable<Synch> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    }
    if (data.containsKey('ms')) {
      context.handle(_msMeta, ms.isAcceptableOrUnknown(data['ms']!, _msMeta));
    } else if (isInserting) {
      context.missing(_msMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Synch map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Synch(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id']),
      ms: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ms'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
    );
  }

  @override
  $SynchsTable createAlias(String alias) {
    return $SynchsTable(attachedDatabase, alias);
  }
}

class Synch extends DataClass implements Insertable<Synch> {
  final String? uid;
  final int id;
  final String? deviceId;
  final int ms;
  final String? type;
  const Synch(
      {this.uid, required this.id, this.deviceId, required this.ms, this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['ms'] = Variable<int>(ms);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    return map;
  }

  SynchsCompanion toCompanion(bool nullToAbsent) {
    return SynchsCompanion(
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      id: Value(id),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      ms: Value(ms),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory Synch.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Synch(
      uid: serializer.fromJson<String?>(json['uid']),
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      ms: serializer.fromJson<int>(json['ms']),
      type: serializer.fromJson<String?>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String?>(uid),
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String?>(deviceId),
      'ms': serializer.toJson<int>(ms),
      'type': serializer.toJson<String?>(type),
    };
  }

  Synch copyWith(
          {Value<String?> uid = const Value.absent(),
          int? id,
          Value<String?> deviceId = const Value.absent(),
          int? ms,
          Value<String?> type = const Value.absent()}) =>
      Synch(
        uid: uid.present ? uid.value : this.uid,
        id: id ?? this.id,
        deviceId: deviceId.present ? deviceId.value : this.deviceId,
        ms: ms ?? this.ms,
        type: type.present ? type.value : this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Synch(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('ms: $ms, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, id, deviceId, ms, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Synch &&
          other.uid == this.uid &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.ms == this.ms &&
          other.type == this.type);
}

class SynchsCompanion extends UpdateCompanion<Synch> {
  final Value<String?> uid;
  final Value<int> id;
  final Value<String?> deviceId;
  final Value<int> ms;
  final Value<String?> type;
  final Value<int> rowid;
  const SynchsCompanion({
    this.uid = const Value.absent(),
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.ms = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SynchsCompanion.insert({
    this.uid = const Value.absent(),
    required int id,
    this.deviceId = const Value.absent(),
    required int ms,
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        ms = Value(ms);
  static Insertable<Synch> custom({
    Expression<String>? uid,
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<int>? ms,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (ms != null) 'ms': ms,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SynchsCompanion copyWith(
      {Value<String?>? uid,
      Value<int>? id,
      Value<String?>? deviceId,
      Value<int>? ms,
      Value<String?>? type,
      Value<int>? rowid}) {
    return SynchsCompanion(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      ms: ms ?? this.ms,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (ms.present) {
      map['ms'] = Variable<int>(ms.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SynchsCompanion(')
          ..write('uid: $uid, ')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('ms: $ms, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $DeletedItemsTable deletedItems = $DeletedItemsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $SynchsTable synchs = $SynchsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, items, deletedItems, settings, synchs];
}
