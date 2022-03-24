import 'package:cupidum_app/app/models/user/hobby.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/app/providers/hobby_provider.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:get/get.dart';

class HobbySelectController extends ControllerTemplate<List<Hobby>> {
  final HobbyProvider _provider = HobbyProvider();

  var hobbySelected = List<bool>.empty(growable: true).obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    await call<List<Hobby>>(
      httpCall: () => _provider.getHobbies(),
      onSuccess: (hobbies) {
        hobbySelected(List.filled(hobbies.length, false));
        change(hobbies, status: RxStatus.success());
      },
      onCallError: (status) => change(null, status: status),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );
  }

  selectHobby(int index, int half, bool isSecondColumn, Hobby hobby) {
    int getIndex = isSecondColumn ? index + half : index;
    hobbySelected[getIndex] = !hobbySelected[getIndex];
  }
}
