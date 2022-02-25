import 'package:cupidum_app/app/models/user/school.dart';
import 'package:cupidum_app/app/providers/school_provider.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:get/get.dart';

class SchoolSelectController extends ControllerTemplate<List<School>> {
  final SchoolProvider _provider = SchoolProvider();

  School? selectedSchool;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    await call<List<School>>(
      httpCall: () => _provider.getSchools(),
      onSuccess: (schools) => change(schools, status: RxStatus.success()),
      onCallError: (status) => change(null, status: status),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );
  }
}
