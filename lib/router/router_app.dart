import 'package:get/get.dart';
import 'package:paprclipassignmentapp/modules/binding/home_binding.dart';
import 'package:paprclipassignmentapp/modules/view/home_screen.dart';
import 'package:paprclipassignmentapp/router/router_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: homeScreenViewRoute,
      page: () => HomeScreen(),
      binding: HomeBinding()
    )
  ];
}