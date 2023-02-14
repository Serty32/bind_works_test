abstract class ISecureStorage {
  Future<void> setPassword({required String id, required String password});

  Future<String?> getPassword({required String id});

  Future<void> deletePassword(String id);
}
