// bin/setup_project_structure.dart
import 'dart:io';

void main() {
  print('جاري إنشاء هيكل المشروع...');
  setupProjectStructure();
  print('تم إنشاء هيكل المشروع بنجاح!');
}

void setupProjectStructure() {
  final directories = [
    // Core Layer
    'lib/core',
    'lib/core/constants',
    'lib/core/errors',
    'lib/core/network',
    'lib/core/themes',
    'lib/core/utils',
    'lib/core/widgets',
    'lib/core/routes',
    'lib/core/di',

    // ** Features **
    // Auth Feature
    'lib/features/auth/data/datasources',
    'lib/features/auth/data/models',
    'lib/features/auth/data/repositories',
    'lib/features/auth/domain/entities',
    'lib/features/auth/domain/repositories',
    'lib/features/auth/domain/usecases',
    'lib/features/auth/presentation/bindings',
    'lib/features/auth/presentation/controllers',
    'lib/features/auth/presentation/pages',
    'lib/features/auth/presentation/widgets',

    // Home Feature
    'lib/features/home/data/datasources',
    'lib/features/home/data/models',
    'lib/features/home/data/repositories',
    'lib/features/home/domain/entities',
    'lib/features/home/domain/repositories',
    'lib/features/home/domain/usecases',
    'lib/features/home/presentation/bindings',
    'lib/features/home/presentation/controllers',
    'lib/features/home/presentation/pages',
    'lib/features/home/presentation/widgets',

    // // Data Layer
    // 'lib/data',
    // 'lib/data/datasources',
    // 'lib/data/models',
    // 'lib/data/repositories',
    //
    // // Domain Layer
    // 'lib/domain',
    // 'lib/domain/entities',
    // 'lib/domain/repositories',
    // 'lib/domain/usecases',
    //
    // // Presentation Layer
    // 'lib/presentation',
    // 'lib/presentation/bindings',
    // 'lib/presentation/controllers',
    // 'lib/presentation/pages',
    // 'lib/presentation/widgets',
  ];

  // إنشاء المجلدات
  for (var dir in directories) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('تم إنشاء المجلد: $dir');
    }
  }

  // تحديث ملف pubspec.yaml
  File('pubspec.yaml').writeAsStringSync('''
name: islamy
description: A new Flutter project with Clean Architecture and GetX

version: 1.0.0+1

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  # BASE
  flutter_screenutil: ^5.9.3
  http: ^1.1.0
  intl: ^0.18.1
  device_info_plus: 11.3.3
  
  # STATE MANAGEMENT
  get: ^4.6.6
  get_storage: ^2.1.1
 
  equatable: ^2.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0

flutter:
  uses-material-design: true
  
    # To add assets to your application, add an assets section, like this:
  assets:
    - assets/images/
    - assets/icons/
  fonts:
    - family: Montserrat
      fonts:
        - asset: assets/fonts/Montserrat-Regular.ttf
          weight: 400
        - asset: assets/fonts/Montserrat-Medium.ttf
          weight: 500
        - asset: assets/fonts/Montserrat-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Montserrat-Bold.ttf
          weight: 700    
''');

  // إنشاء الملفات الأساسية
  _createMainFile();
  _createCoreFiles();
  _createAuthFiles();
  _createHomeFiles();

  print('تم إنشاء هيكل المشروع بنجاح!');
}

void _createMainFile() {
  File('lib/main.dart').writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/di/dependency_injection.dart';
import 'core/routes/app_pages.dart';
import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await GetStorage.init();
  await DependencyInjection.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Islamy',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
''');
}

void _createCoreFiles() {
  // الثيمات
  File('lib/core/themes/app_theme.dart').writeAsStringSync('''
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
  );

  static final ThemeData dark = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
  );
}
''');

  // حقن التبعيات
  File('lib/core/di/dependency_injection.dart').writeAsStringSync('''
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
''');

  // المسارات
  File('lib/core/routes/app_pages.dart').writeAsStringSync('''
import 'package:get/get.dart';

abstract class AppPages {
  static const String initial = '/';
  static const String home = '/home';
  static const String auth = '/auth';

  static final List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const Scaffold(), // سيتم استبدالها بالصفحة الفعلية
      transition: Transition.fadeIn,
    ),
  ];
}
''');
}

void _createAuthFiles() {
  // بيانات المصادقة
  File('lib/features/auth/data/models/auth_model.dart').writeAsStringSync('''
class AuthModel {
  final String token;
  final String userId;
  final String email;

  const AuthModel({
    required this.token,
    required this.userId,
    required this.email,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    token: json['token'],
    userId: json['userId'],
    email: json['email'],
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'userId': userId,
    'email': email,
  };
}
''');

  // واجهة المستخدم للمصادقة
  File('lib/features/auth/presentation/pages/reset_password_page.dart')
      .writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login'.tr)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: 'email'.tr),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'password'.tr),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: controller.login,
                child: Text('login'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''');
}

void _createHomeFiles() {
  // واجهة المستخدم للصفحة الرئيسية
  File('lib/features/home/presentation/pages/change_language_page.dart')
      .writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: Center(
        child: Obx(() => Text(controller.welcomeMessage.value)),
      ),
    );
  }
}
''');
}

// void _createDataFiles() {
//   // datasources
//   File('lib/data/datasources/local_data_source.dart').writeAsStringSync('''
// import 'package:get_storage/get_storage.dart';
//
// class LocalDataSource {
//   final GetStorage _storage;
//
//   LocalDataSource(this._storage);
//
//   Future<void> cacheData(String key, dynamic value) async {
//     await _storage.write(key, value);
//   }
//
//   dynamic getCachedData(String key) {
//     return _storage.read(key);
//   }
// }
// ''');
//
//   // models
//   File('lib/data/models/user_model.dart').writeAsStringSync('''
// class UserModel {
//   final String id;
//   final String name;
//   final String email;
//
//   UserModel({required this.id, required this.name, required this.email});
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//     };
//   }
// }
// ''');
//
//   // repositories
//   File('lib/data/repositories/user_repository_impl.dart').writeAsStringSync('''
// import 'package:dartz/dartz.dart';
// import '../../core/errors/failures.dart';
// import '../../domain/entities/user.dart';
// import '../../domain/repositories/user_repository.dart';
// import '../datasources/local_data_source.dart';
// import '../models/user_model.dart';
//
// class UserRepositoryImpl implements UserRepository {
//   final LocalDataSource localDataSource;
//
//   UserRepositoryImpl({required this.localDataSource});
//
//   @override
//   Future<Either<Failure, User>> getUser(String id) async {
//     try {
//       final userData = localDataSource.getCachedData('user_\$id');
//       if (userData != null) {
//         return Right(UserModel.fromJson(userData));
//       }
//       return Left(CacheFailure('User not found'));
//     } catch (e) {
//       return Left(CacheFailure(e.toString()));
//     }
//   }
// }
// ''');
// }
//
// void _createDomainFiles() {
//   // entities
//   File('lib/domain/entities/user.dart').writeAsStringSync('''
// class User {
//   final String id;
//   final String name;
//   final String email;
//
//   User({required this.id, required this.name, required this.email});
// }
// ''');
//
//   // repositories
//   File('lib/domain/repositories/user_repository.dart').writeAsStringSync('''
// import 'package:dartz/dartz.dart';
// import '../entities/user.dart';
// import '../../core/errors/failures.dart';
//
// abstract class UserRepository {
//   Future<Either<Failure, User>> getUser(String id);
// }
// ''');
//
//   // usecases
//   File('lib/domain/usecases/get_user.dart').writeAsStringSync('''
// import 'package:dartz/dartz.dart';
// import '../../core/errors/failures.dart';
// import '../entities/user.dart';
// import '../repositories/user_repository.dart';
//
// class GetUser {
//   final UserRepository repository;
//
//   GetUser(this.repository);
//
//   Future<Either<Failure, User>> call(String id) async {
//     return await repository.getUser(id);
//   }
// }
// ''');
// }
//
// void _createPresentationFiles() {
//   // routes
//   File('lib/core/routes/app_pages.dart').writeAsStringSync('''
// import 'package:get/get.dart';
// import '../../presentation/pages/change_language_page.dart';
// import '../../presentation/pages/auth/reset_password_page.dart';
// import '../../presentation/pages/auth/register_page.dart';
//
// abstract class AppPages {
//   static const String initial = '/';
//   static const String login = '/login';
//   static const String register = '/register';
//   static const String home = '/home';
//
//   static final List<GetPage> routes = [
//     GetPage(
//       name: initial,
//       page: () => const LoginPage(),
//     ),
//     GetPage(
//       name: login,
//       page: () => const LoginPage(),
//     ),
//     GetPage(
//       name: register,
//       page: () => const RegisterPage(),
//     ),
//     GetPage(
//       name: home,
//       page: () => const HomePage(),
//       binding: HomeBinding(),
//     ),
//   ];
// }
// ''');
//
//   // home feature
//   File('lib/features/home/presentation/pages/change_language_page.dart')
//       .writeAsStringSync('''
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/home_controller.dart';
//
// class HomePage extends GetView<HomeController> {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text(controller.welcomeMessage.value)),
//             ElevatedButton(
//               onPressed: () => controller.logout(),
//               child: const Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ''');
//
//   File('lib/features/home/presentation/controllers/home_controller.dart')
//       .writeAsStringSync('''
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class HomeController extends GetxController {
//   final welcomeMessage = 'Welcome'.obs;
//   final _storage = GetStorage();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadUserData();
//   }
//
//   void _loadUserData() {
//     final userName = _storage.read('user_name');
//     if (userName != null) {
//       welcomeMessage.value = 'Welcome, \$userName';
//     }
//   }
//
//   void logout() {
//     _storage.remove('user_token');
//     _storage.remove('user_name');
//     Get.offAllNamed(AppPages.login);
//   }
// }
// ''');
//
//   File('lib/features/home/presentation/bindings/home_binding.dart')
//       .writeAsStringSync('''
// import 'package:get/get.dart';
// import '../controllers/home_controller.dart';
//
// class HomeBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => HomeController());
//   }
// }
// ''');
// }
