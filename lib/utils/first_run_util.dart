import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:is_first_run/is_first_run.dart';

class CheckFirstRun {
  static bool isFirstRun = false;

  static Future initializeUtil() async {
    isFirstRun = await IsFirstRun.isFirstRun();
  }

  static void assignFirstRoute() {
    AppPages.initial = isFirstRun ? Routes.presentation : Routes.login;
  }
}
