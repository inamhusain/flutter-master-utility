import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  static final _iv = IV.fromLength(16);

  static String encrypt({
    required String value,
    required String key,
  }) {
    final encrypted = _getEncrypter(key).encrypt(value, iv: _iv);
    return encrypted.base64;
  }

  static String decrypt({
    required String value,
    required String key,
  }) {
    final decrypted = _getEncrypter(key).decrypt(Encrypted.from64(value), iv: _iv);
    return decrypted;
  }

  static Encrypter _getEncrypter(key) {
    return Encrypter(AES(Key.fromUtf8(key)));
  }
}
