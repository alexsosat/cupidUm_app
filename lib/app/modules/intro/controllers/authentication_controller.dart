import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  User? _firebaseUser;

  bool get isUserLoggedIn {
    _firebaseUser = FirebaseAuth.instance.currentUser;
    return _firebaseUser != null;
  }

  String? get userUID => _firebaseUser?.uid;

  String? get username => _firebaseUser?.displayName;

  @override
  void onInit() {
    logUserInApp();
    super.onInit();
  }

  void logUserInApp() {
    _firebaseUser = FirebaseAuth.instance.currentUser;
  }
}
