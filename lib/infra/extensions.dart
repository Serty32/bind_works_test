
import 'dart:convert';

import 'package:crypto/crypto.dart';

const String salt = 'UVocjgjgXg8P7zIsC93kKlRU8sPbTBhsAMFLnLUPDRYFIWAk';

extension PasswordExt on String {
  String getSaltedHash(String modelId) {
    return sha256.convert(utf8.encode(modelId + salt + this)).toString();
  }
}