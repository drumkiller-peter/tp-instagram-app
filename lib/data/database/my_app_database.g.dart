// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_app_database.dart';

// ignore_for_file: type=lint
class $ProfileTable extends Profile with TableInfo<$ProfileTable, ProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _followerCountMeta =
      const VerificationMeta('followerCount');
  @override
  late final GeneratedColumn<int> followerCount = GeneratedColumn<int>(
      'follower_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _followingMeta =
      const VerificationMeta('following');
  @override
  late final GeneratedColumn<int> following = GeneratedColumn<int>(
      'following', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, email, bio, followerCount, following];
  @override
  String get aliasedName => _alias ?? 'profile';
  @override
  String get actualTableName => 'profile';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    } else if (isInserting) {
      context.missing(_bioMeta);
    }
    if (data.containsKey('follower_count')) {
      context.handle(
          _followerCountMeta,
          followerCount.isAcceptableOrUnknown(
              data['follower_count']!, _followerCountMeta));
    } else if (isInserting) {
      context.missing(_followerCountMeta);
    }
    if (data.containsKey('following')) {
      context.handle(_followingMeta,
          following.isAcceptableOrUnknown(data['following']!, _followingMeta));
    } else if (isInserting) {
      context.missing(_followingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio'])!,
      followerCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}follower_count'])!,
      following: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}following'])!,
    );
  }

  @override
  $ProfileTable createAlias(String alias) {
    return $ProfileTable(attachedDatabase, alias);
  }
}

class ProfileData extends DataClass implements Insertable<ProfileData> {
  final int id;
  final String? email;
  final String bio;
  final int followerCount;
  final int following;
  const ProfileData(
      {required this.id,
      this.email,
      required this.bio,
      required this.followerCount,
      required this.following});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['bio'] = Variable<String>(bio);
    map['follower_count'] = Variable<int>(followerCount);
    map['following'] = Variable<int>(following);
    return map;
  }

  ProfileCompanion toCompanion(bool nullToAbsent) {
    return ProfileCompanion(
      id: Value(id),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      bio: Value(bio),
      followerCount: Value(followerCount),
      following: Value(following),
    );
  }

  factory ProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String?>(json['email']),
      bio: serializer.fromJson<String>(json['bio']),
      followerCount: serializer.fromJson<int>(json['follower_count']),
      following: serializer.fromJson<int>(json['following']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String?>(email),
      'bio': serializer.toJson<String>(bio),
      'follower_count': serializer.toJson<int>(followerCount),
      'following': serializer.toJson<int>(following),
    };
  }

  ProfileData copyWith(
          {int? id,
          Value<String?> email = const Value.absent(),
          String? bio,
          int? followerCount,
          int? following}) =>
      ProfileData(
        id: id ?? this.id,
        email: email.present ? email.value : this.email,
        bio: bio ?? this.bio,
        followerCount: followerCount ?? this.followerCount,
        following: following ?? this.following,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('bio: $bio, ')
          ..write('followerCount: $followerCount, ')
          ..write('following: $following')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, bio, followerCount, following);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileData &&
          other.id == this.id &&
          other.email == this.email &&
          other.bio == this.bio &&
          other.followerCount == this.followerCount &&
          other.following == this.following);
}

class ProfileCompanion extends UpdateCompanion<ProfileData> {
  final Value<int> id;
  final Value<String?> email;
  final Value<String> bio;
  final Value<int> followerCount;
  final Value<int> following;
  const ProfileCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.bio = const Value.absent(),
    this.followerCount = const Value.absent(),
    this.following = const Value.absent(),
  });
  ProfileCompanion.insert({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    required String bio,
    required int followerCount,
    required int following,
  })  : bio = Value(bio),
        followerCount = Value(followerCount),
        following = Value(following);
  static Insertable<ProfileData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? bio,
    Expression<int>? followerCount,
    Expression<int>? following,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (bio != null) 'bio': bio,
      if (followerCount != null) 'follower_count': followerCount,
      if (following != null) 'following': following,
    });
  }

  ProfileCompanion copyWith(
      {Value<int>? id,
      Value<String?>? email,
      Value<String>? bio,
      Value<int>? followerCount,
      Value<int>? following}) {
    return ProfileCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      followerCount: followerCount ?? this.followerCount,
      following: following ?? this.following,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (followerCount.present) {
      map['follower_count'] = Variable<int>(followerCount.value);
    }
    if (following.present) {
      map['following'] = Variable<int>(following.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('bio: $bio, ')
          ..write('followerCount: $followerCount, ')
          ..write('following: $following')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ProfileTable profile = $ProfileTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [profile];
}
