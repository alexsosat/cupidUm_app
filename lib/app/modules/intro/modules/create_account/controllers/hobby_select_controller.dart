import 'package:cupidum_app/app/models/user/hobby.dart';
import 'package:cupidum_app/app/providers/hobby_provider.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:get/get.dart';

class HobbySelectController extends ControllerTemplate<List<Hobby>> {
  final HobbyProvider _provider = HobbyProvider();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    await call<List<Hobby>>(
      httpCall: () => _provider.getHobbies(),
      onSuccess: (hobbies) => change(hobbies, status: RxStatus.success()),
      onCallError: (status) => change(null, status: status),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );
  }
}
