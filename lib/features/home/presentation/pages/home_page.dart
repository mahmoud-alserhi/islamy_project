library home_page;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamy/core/constants/icons/icons_app.dart';
import 'package:islamy/core/themes/color_resource.dart';
import 'package:islamy/core/widgets/app_svg_picture.dart';
import 'package:islamy/core/widgets/app_text.dart';

import '../controllers/home_controller.dart';

part '../widgets/background.dart';
// part '../widgets/bottom_text.dart';
// part '../widgets/button_login.dart';
part '../widgets/header.dart';
part '../widgets/row_header.dart';
// part '../widgets/text_field_login.dart';
// part '../widgets/text_login.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        children: [
          Background(),
          RowHeader(),
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(28.w, 50.h, 28.w, 2.h),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // Header(),
                RowHeader(),
                RowHeader(),
                RowHeader(),
                RowHeader(),
                RowHeader(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
