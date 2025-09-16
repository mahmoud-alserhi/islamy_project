import 'package:get/get.dart';
import 'package:islamy/features/outBordanig/presentation/pages/out_bordaing_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.outBordaingScreen;

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.outBordaingScreen,
      page: () => OutBordaingPage(),
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: initial,
    //   page: () => const Scaffold(), // سيتم استبدالها بالصفحة الفعلية
    //   transition: Transition.fadeIn,
    // ),
  ];
}
