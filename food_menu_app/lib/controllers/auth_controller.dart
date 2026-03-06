import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final RxBool isLoading = false.obs;

  static const _kRegisteredEmail = 'auth.registeredEmail';
  static const _kRegisteredPassword = 'auth.registeredPassword';
  static const _kRememberedEmail = 'auth.rememberedEmail';

  final _box = GetStorage();

  final RxnString rememberedEmail = RxnString();
  final RxBool isLoggedIn = false.obs;

  String? _registeredEmail;
  String? _registeredPassword;

  @override
  void onInit() {
    super.onInit();
    _registeredEmail = _box.read<String>(_kRegisteredEmail);
    _registeredPassword = _box.read<String>(_kRegisteredPassword);
    rememberedEmail.value = _box.read<String>(_kRememberedEmail);
    isLoggedIn.value = (rememberedEmail.value?.isNotEmpty ?? false);
  }

  bool get hasRegisteredUser =>
      (_registeredEmail?.isNotEmpty ?? false) &&
      (_registeredPassword?.isNotEmpty ?? false);

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 700));
      _registeredEmail = email.trim();
      _registeredPassword = password;
      await _box.write(_kRegisteredEmail, _registeredEmail);
      await _box.write(_kRegisteredPassword, _registeredPassword);
      return true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 700));
      final e = email.trim();
      final p = password;

      final ok = !hasRegisteredUser
          ? (e.isNotEmpty && p.isNotEmpty)
          : (e == _registeredEmail && p == _registeredPassword);

      if (ok) {
        rememberedEmail.value = e;
        isLoggedIn.value = true;
        await _box.write(_kRememberedEmail, e);
      }

      return ok;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    rememberedEmail.value = null;
    isLoggedIn.value = false;
    await _box.remove(_kRememberedEmail);
  }
}

