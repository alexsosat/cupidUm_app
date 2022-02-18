import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> userImage = Rx<XFile?>(null);

  DateTime? bornDate;

  setBornDate(DateTime date) => bornDate = date;

  setUserProfileImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      userImage(image);
    }
  }
}
