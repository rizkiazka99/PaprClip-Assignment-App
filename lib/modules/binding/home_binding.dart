import 'package:get/get.dart';
import 'package:paprclipassignmentapp/modules/controller/home_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}