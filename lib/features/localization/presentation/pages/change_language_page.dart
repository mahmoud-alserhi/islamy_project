library change_language_page;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamy/core/constants/icons/icons_app.dart';
import 'package:islamy/core/localization_app/language_constants.dart';
import 'package:islamy/core/localization_app/locale_keys.dart';
import 'package:islamy/core/widgets/app_button.dart';
import 'package:islamy/core/widgets/app_svg_picture.dart';
import 'package:islamy/core/widgets/app_text.dart';
import 'package:islamy/features/localization/presentation/controllers/localize_controller.dart';

part '../widgets/header.dart';
part '../widgets/language_list.dart';

class ChangeLanguagePage extends GetView<LocalizeController> {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(28.w, 130.h, 28.w, 56.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(),
            LanguageList(),
          ],
        ),
      ),
    );
  }
}
