import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/core/themes/color_resource.dart';
import 'package:islamy/core/widgets/app_svg_picture.dart';
import 'package:islamy/core/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final AppButtonStyle style;
  final String? iconName;
  final Color? iconColor;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
    this.iconName,
    this.iconColor,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _getButtonStyle(style);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: buttonStyle.shadow != null ? [buttonStyle.shadow!] : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark && buttonStyle.darkBackgroundColor != null
              ? buttonStyle.darkBackgroundColor
              : buttonStyle.backgroundColor,
          minimumSize: Size(isFullWidth ? double.infinity : 0, 60.h),
          foregroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: isDark && buttonStyle.darkBorderColor != null
                  ? buttonStyle.darkBorderColor!
                  : buttonStyle.borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconName != null && iconName!.isNotEmpty) ...[
              AppSvgPicture(
                assetName: iconName!,
                color: iconColor,
                width: 21.w,
                height: 22.h,
              ),
              SizedBox(width: 20.w),
            ],
            AppText(
              text: title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: buttonStyle.textWeight,
                color: isDark && buttonStyle.darkTextColor != null
                    ? buttonStyle.darkTextColor!
                    : buttonStyle.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppButtonStyleConfig _getButtonStyle(AppButtonStyle style) {
    switch (style) {
      case AppButtonStyle.primary:
        return AppButtonStyleConfig(
          backgroundColor: ColorResource.primary,
          textColor: ColorResource.white,
          textWeight: FontWeight.w700,
          shadow: BoxShadow(
            color: ColorResource.primary.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        );
      case AppButtonStyle.secondary:
        return AppButtonStyleConfig(
          backgroundColor: ColorResource.white,
          darkBackgroundColor: ColorResource.surfaceDark,
          textColor: ColorResource.darkGray,
          darkTextColor: ColorResource.darkGrayDark,
          textWeight: FontWeight.w500,
          borderColor: ColorResource.borderGray,
          darkBorderColor: ColorResource.borderGrayDark,
          shadow: BoxShadow(
            color: ColorResource.shadowGray.withOpacity(0.1),
            offset: const Offset(0, 16),
            blurRadius: 40,
          ),
        );
      // TODO: make here option for language is selected or not and change color
    }
  }
}

enum AppButtonStyle {
  primary,
  secondary, /*language*/
}

class AppButtonStyleConfig {
  final Color backgroundColor;
  final Color? darkBackgroundColor;
  final Color textColor;
  final Color? darkTextColor;
  final FontWeight textWeight;
  final Color? borderColor;
  final Color? darkBorderColor;
  final BoxShadow? shadow;

  AppButtonStyleConfig({
    required this.backgroundColor,
    this.darkBackgroundColor,
    required this.textColor,
    this.darkTextColor,
    required this.textWeight,
    this.borderColor,
    this.darkBorderColor,
    this.shadow,
  });
}
