import 'package:cupidum_app/app/modules/intro/utils/first_run_util.dart';
import 'package:cupidum_app/constants/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

import 'app/routes/app_pages.dart';
import 'constants/firebase_options.dart';

bool isFirstRun = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CheckFirstRun.initializeUtil();
  CheckFirstRun.assignFirstRoute();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cupidum',

      //Routing
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,

      //theme
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
