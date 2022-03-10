import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:get/get.dart';

class SettingsController extends ControllerTemplate <User>{
  final _provider = UserProvider();
  
    @override
  void refreshContent() {
    change(null,status: RxStatus.loading());
    loadData();
    super.refreshContent();
  }
  
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    await call<User>(
      httpCall: () => _provider.getUser(),
      onSuccess: (user) {
        change(user, status: RxStatus.success());
      },
      onCallError: (e) => change(null, status: e),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );
    
  }
}
