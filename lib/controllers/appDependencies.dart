import 'package:get/get.dart';
import 'package:halmstad/controllers/enums_controller.dart';
import 'package:halmstad/controllers/my_app_controller.dart';

class MyAppDependencies extends Bindings {
  @override
  void dependencies() {
    Get.put(EnumsController());
    Get.put(MyAppController());
  }
}
