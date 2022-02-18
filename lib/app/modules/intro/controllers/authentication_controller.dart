import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  User? _firebaseUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isUserLoggedIn {
    _firebaseUser = _auth.currentUser;
    return _firebaseUser != null;
  }

  bool get isUserConfirmed {
    return  _firebaseUser!.emailVerified;
  }

  String? get userUID => _firebaseUser?.uid;

  String? get username => _firebaseUser?.displayName;

  @override
  void onInit() {
    logUserInApp();
    super.onInit();
  }

  void logUserInApp() {
    _firebaseUser = _auth.currentUser;
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.intro);
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
