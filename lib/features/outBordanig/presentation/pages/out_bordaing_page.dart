library out_bordaing_page;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamy/core/constants/icons/icons_app.dart';
import 'package:islamy/core/widgets/app_button.dart';
import 'package:islamy/core/widgets/app_svg_picture.dart';
import 'package:islamy/core/widgets/app_text.dart';
import 'package:islamy/features/auth/login/presentation/pages/login_page.dart';

import '../controllers/out_bording_controller.dart';

part '../widgets/button_out_bordaing.dart';
part '../widgets/image_view.dart';
part '../widgets/text_out_bordaing.dart';

class OutBordaingPage extends GetView<OutBordaingController> {
  const OutBordaingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.fromLTRB(54.w, 109.h, 54.w, 40.h),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageView(),
            SizedBox(height: 25.h),
            TextOutBordaing(),
            SizedBox(height: 80.h),
            ButtonOutBordaing(),
          ],
        ),
      ),
    );
  }
}
