// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;

import 'db/model/GydInfoDB.dart';
import 'db/model/UserDB.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 510316671505674674),
      name: 'GydInfoDB',
      lastPropertyId: const obx_int.IdUid(5, 182684569620813022),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7061759677163194773),
            name: 'dbId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6683940702404912993),
            name: 'gydPrice',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6334980785175322591),
            name: 'gydAllVolume',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 7519195328981451723),
            name: 'gydEthSupply',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 182684569620813022),
            name: 'timeStamp',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 8577212662217132438),
      name: 'UserDB',
      lastPropertyId: const obx_int.IdUid(7, 2904244260572974894),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8005716863656036538),
            name: 'dbId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8618342731099775659),
            name: 'serverId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6917134914778632454),
            name: 'address',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 1494433874252301917),
            name: 'referredBy',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5933284226250100591),
            name: 'referredBy2nd',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 1497586912687075114),
            name: 'referrals',
            type: 30,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 2904244260572974894),
            name: 'totalPoints',
            type: 8,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(2, 8577212662217132438),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    GydInfoDB: obx_int.EntityDefinition<GydInfoDB>(
        model: _entities[0],
        toOneRelations: (GydInfoDB object) => [],
        toManyRelations: (GydInfoDB object) => {},
        getId: (GydInfoDB object) => object.dbId,
        setId: (GydInfoDB object, int id) {
          object.dbId = id;
        },
        objectToFB: (GydInfoDB object, fb.Builder fbb) {
          fbb.startTable(6);
          fbb.addInt64(0, object.dbId);
          fbb.addFloat64(1, object.gydPrice);
          fbb.addFloat64(2, object.gydAllVolume);
          fbb.addFloat64(3, object.gydEthSupply);
          fbb.addInt64(4, object.timeStamp);
          fbb.finish(fbb.endTable());
          return object.dbId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dbIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final gydPriceParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final gydAllVolumeParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final gydEthSupplyParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final object = GydInfoDB(
              dbId: dbIdParam,
              gydPrice: gydPriceParam,
              gydAllVolume: gydAllVolumeParam,
              gydEthSupply: gydEthSupplyParam)
            ..timeStamp =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);

          return object;
        }),
    UserDB: obx_int.EntityDefinition<UserDB>(
        model: _entities[1],
        toOneRelations: (UserDB object) => [],
        toManyRelations: (UserDB object) => {},
        getId: (UserDB object) => object.dbId,
        setId: (UserDB object, int id) {
          object.dbId = id;
        },
        objectToFB: (UserDB object, fb.Builder fbb) {
          final addressOffset = fbb.writeString(object.address);
          final referredByOffset = fbb.writeString(object.referredBy);
          final referredBy2ndOffset = fbb.writeString(object.referredBy2nd);
          final referralsOffset = fbb.writeList(
              object.referrals.map(fbb.writeString).toList(growable: false));
          fbb.startTable(8);
          fbb.addInt64(0, object.dbId);
          fbb.addInt64(1, object.serverId);
          fbb.addOffset(2, addressOffset);
          fbb.addOffset(3, referredByOffset);
          fbb.addOffset(4, referredBy2ndOffset);
          fbb.addOffset(5, referralsOffset);
          fbb.addFloat64(6, object.totalPoints);
          fbb.finish(fbb.endTable());
          return object.dbId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dbIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final serverIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final addressParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final referredByParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final referredBy2ndParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, '');
          final referralsParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGet(buffer, rootOffset, 14, []);
          final totalPointsParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final object = UserDB(
              dbId: dbIdParam,
              serverId: serverIdParam,
              address: addressParam,
              referredBy: referredByParam,
              referredBy2nd: referredBy2ndParam,
              referrals: referralsParam,
              totalPoints: totalPointsParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [GydInfoDB] entity fields to define ObjectBox queries.
class GydInfoDB_ {
  /// See [GydInfoDB.dbId].
  static final dbId =
      obx.QueryIntegerProperty<GydInfoDB>(_entities[0].properties[0]);

  /// See [GydInfoDB.gydPrice].
  static final gydPrice =
      obx.QueryDoubleProperty<GydInfoDB>(_entities[0].properties[1]);

  /// See [GydInfoDB.gydAllVolume].
  static final gydAllVolume =
      obx.QueryDoubleProperty<GydInfoDB>(_entities[0].properties[2]);

  /// See [GydInfoDB.gydEthSupply].
  static final gydEthSupply =
      obx.QueryDoubleProperty<GydInfoDB>(_entities[0].properties[3]);

  /// See [GydInfoDB.timeStamp].
  static final timeStamp =
      obx.QueryIntegerProperty<GydInfoDB>(_entities[0].properties[4]);
}

/// [UserDB] entity fields to define ObjectBox queries.
class UserDB_ {
  /// See [UserDB.dbId].
  static final dbId =
      obx.QueryIntegerProperty<UserDB>(_entities[1].properties[0]);

  /// See [UserDB.serverId].
  static final serverId =
      obx.QueryIntegerProperty<UserDB>(_entities[1].properties[1]);

  /// See [UserDB.address].
  static final address =
      obx.QueryStringProperty<UserDB>(_entities[1].properties[2]);

  /// See [UserDB.referredBy].
  static final referredBy =
      obx.QueryStringProperty<UserDB>(_entities[1].properties[3]);

  /// See [UserDB.referredBy2nd].
  static final referredBy2nd =
      obx.QueryStringProperty<UserDB>(_entities[1].properties[4]);

  /// See [UserDB.referrals].
  static final referrals =
      obx.QueryStringVectorProperty<UserDB>(_entities[1].properties[5]);

  /// See [UserDB.totalPoints].
  static final totalPoints =
      obx.QueryDoubleProperty<UserDB>(_entities[1].properties[6]);
}
