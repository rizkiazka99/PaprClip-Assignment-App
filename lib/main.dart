import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:paprclipassignmentapp/router/router_app.dart';
import 'package:paprclipassignmentapp/router/router_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaprClip Assignment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeScreenViewRoute,
      getPages: AppPages.pages,
    );
  }
}
