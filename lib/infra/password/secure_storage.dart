import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/domain/password/i_secure_storage.dart';

class SecureStorage extends ISecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage(this.storage);

  @override
  Future<String?> getPassword({required String id}) async {
    return await storage.read(key: id);
  }

  @override
  Future<void> deletePassword(String id) async {
    await storage.delete(key: id);
  }

  @override
  Future<void> setPassword({
    required String id,
    required String password,
  }) async {
    await storage.write(key: id, value: password);
  }
}