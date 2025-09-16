import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => GetStorage.init());
    Get.put(GetStorage());
    
    // هنا نضيف باقي التبعيات
    // Get.lazyPut(() => AuthRepository());
    // Get.lazyPut(() => HomeController());
  }
}
