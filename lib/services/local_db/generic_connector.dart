import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as pb;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../../models/serializable_base.dart';

class GenericConnector<T extends ISerializable<T>> {
  GenericConnector({this.key, this.defaultInstanceGenerator});

  Database? databaseClient;
  final String? key;
  final T Function()? defaultInstanceGenerator;

  static const String _dbName = 'employee_machine_test.db';
  static const int _dbVersion = 1;

  Future<Database> _createOrOpenDatabase() async {
    final dir = await pb.getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, _dbName);
    return databaseFactoryIo.openDatabase(dbPath, version: _dbVersion, mode: DatabaseMode.create);
  }

  Future<bool> setData(ISerializable<T> value, {bool merge = true}) async {
    try {
      databaseClient ??= await _createOrOpenDatabase();
      final store = StoreRef<String?, dynamic>.main();

      if (await exists()) {
        return await store.record(key).update(databaseClient!, value.toJson()) != null;
      }

      return await store.record(key).put(databaseClient!, value.toJson(), merge: merge) != null;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> exists() async {
    try {
      databaseClient ??= await _createOrOpenDatabase();
      final store = StoreRef<String?, dynamic>.main();
      return await store.record(key).exists(databaseClient!);
    } catch (e) {
      return false;
    }
  }

  Future<T?> getData() async {
    try {
      databaseClient ??= await _createOrOpenDatabase();
      final store = StoreRef<String?, dynamic>.main();
      final jsonMap = await store.record(key).get(databaseClient!) as Map<String, dynamic>?;

      if (jsonMap == null) {
        return null;
      }

      return defaultInstanceGenerator!().fromJson(jsonMap);
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteData() async {
    try {
      databaseClient ??= await _createOrOpenDatabase();
      final store = StoreRef<String?, dynamic>.main();
      return await store.record(key).delete(databaseClient!) != null;
    } catch (e) {
      return false;
    }
  }
}
