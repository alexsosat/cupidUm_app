import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  User? _firebaseUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _dynamicFirebaseUser;

  bool get isUserLoggedIn {
    _firebaseUser = _auth.currentUser;
    return _firebaseUser != null;
  }

  String? get userUID => _firebaseUser?.uid;

  String? get username => _firebaseUser?.displayName;

  @override
  void onInit() {
    logUserInApp();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _dynamicFirebaseUser = Rx<User?>(_auth.currentUser);
    _dynamicFirebaseUser.bindStream(_auth.userChanges());
  }

  void logUserInApp() {
    _firebaseUser = _auth.currentUser;
  }

  void register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Error al crear cuenta",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
