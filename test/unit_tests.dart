import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/infra/extensions.dart';

void main() {
  group('Password', () {
    test('passwordId is the same, id is the same', () {
      const password = 'password';
      const id = '1';

      final passwordId = password.getSaltedHash(id);

      const passwordSecond = 'password';
      const idSecond = '1';

      final passwordIdSecond = passwordSecond.getSaltedHash(idSecond);

      expect(passwordId, passwordIdSecond);
    });
    
    test('passwordId is the same, id is NOT the same', () {
      const password = 'password';
      const id = '1';

      final passwordId = password.getSaltedHash(id);

      const passwordSecond = 'password';
      const idSecond = '2';

      final passwordIdSecond = passwordSecond.getSaltedHash(idSecond);

      expect(passwordId, isNot(passwordIdSecond));
    });

    test('passwordId is NOT the same', () {
      const password = 'password';
      const id = '1';
      final passwordId = password.getSaltedHash(id);

      const passwordSecond = 'passwordSecond';
      const idSecond = '2';

      final passwordIdSecond = passwordSecond.getSaltedHash(idSecond);

      expect(passwordId, isNot(passwordIdSecond));
    });
  });
}
