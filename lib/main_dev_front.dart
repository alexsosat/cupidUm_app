import 'package:cupidum_app/app/modules/intro/bindings/authentication_binding.dart';
import 'package:cupidum_app/utils/first_run_util.dart';
import 'package:cupidum_app/constants/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';

import 'app/routes/app_pages.dart';
import 'environment/firebase_options.dart';
import 'services/authentication/strapi_authentication.dart';

bool isFirstRun = false;

void main() async {
  // Initialization of the firebase service
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize storage service
  await Strapi.initConfiguration();

  // Check if is first time use
  await CheckFirstRun.initializeUtil();
  CheckFirstRun.assignFirstRoute();

  // Get Strapi key
  await Strapi().strapiLogin();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cupidum',

      //Inital Binding
      initialBinding: AuthenticationBinding(),

      //Routing
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,

      //theme
      theme: lightTheme,
      // darkTheme: darkTheme,

      //Dev
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
