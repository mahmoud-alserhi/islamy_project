library login_page;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamy/core/constants/icons/icons_app.dart';
import 'package:islamy/core/themes/color_resource.dart';
import 'package:islamy/core/widgets/app_button.dart';
import 'package:islamy/core/widgets/app_svg_picture.dart';
import 'package:islamy/core/widgets/app_text.dart';
import 'package:islamy/core/widgets/app_text_field.dart';
import 'package:islamy/features/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:islamy/features/home/presentation/pages/home_page.dart';
import 'package:islamy/features/localization/presentation/pages/change_language_page.dart';

import '../../../registration/presentation/pages/registration_page.dart';
import '../controllers/login_controller.dart';

part '../widgets/bottom_text.dart';
part '../widgets/button_login.dart';
part '../widgets/header.dart';
part '../widgets/text_field_login.dart';
part '../widgets/text_login.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.fromLTRB(28.w, 138.h, 28.w, 56.h),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Header(),
            TextFieldLogin(),
            ButtonLogin(),
            SizedBox(height: 60.h),
            BottomText()
          ],
        ),
      ),
    );
  }
}
