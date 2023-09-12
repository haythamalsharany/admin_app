import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_admin_app/routes.dart';


import 'binding.dart';

import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      title: 'My Ecommerce',
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
      getPages: routes,
      //  routes: routes,
    );
  }
}
