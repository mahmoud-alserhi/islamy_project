import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy/core/themes/color_resource.dart';
import 'package:islamy/core/widgets/app_svg_picture.dart';

import '../constants/icons/icons_app.dart';

enum AppTextFieldType { email, password, text, phone }

class AppTextField extends StatefulWidget {
  final AppTextFieldType fieldType;
  final String hintText;
  final TextEditingController controller;
  // final IconData prefixIcon;
  final String prefixIcon;
  final bool obscureText;
  final TextInputAction inputAction;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? customValidator;

  const AppTextField({
    super.key,
    required this.fieldType,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    this.obscureText = false,
    this.inputAction = TextInputAction.next,
    this.focusNode,
    this.onSubmitted,
    this.inputFormatters,
    this.customValidator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _isObscure;
  String? _errorText;
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
    widget.controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChange);
    super.dispose();
  }

  void _handleTextChange() {
    if (!_isValid) {
      validate();
    }
  }

  bool validate() {
    final validator = widget.customValidator ?? _getDefaultValidator();
    setState(() {
      _errorText = validator(widget.controller.text);
      _isValid = _errorText == null;
    });
    return _isValid;
  }

  String? Function(String?) _getDefaultValidator() {
    switch (widget.fieldType) {
      case AppTextFieldType.email:
        return (value) {
          if (value == null || value.isEmpty) return 'Email is required';
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Enter a valid email';
          }
          return null;
        };
      case AppTextFieldType.password:
        return (value) {
          if (value == null || value.isEmpty) return 'Password is required';
          if (value.length < 6) return 'Password must be at least 6 characters';
          return null;
        };
      case AppTextFieldType.phone:
        return (value) {
          if (value == null || value.isEmpty) return 'Phone number is required';
          if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
            return 'Enter a valid phone number';
          }
          return null;
        };
      case AppTextFieldType.text:
        return (value) {
          if (value == null || value.isEmpty) return 'This field is required';
          return null;
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      keyboardType: _getKeyboardType(),
      textInputAction: widget.inputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).hintColor,
            ),
        // prefixIcon: Icon(widget.prefixIcon),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: AppSvgPicture(
            assetName: widget.prefixIcon,
            width: 18.w, // تعديل حجم الأيقونة
            height: 18.h, // استخدام نفس القيمة للحفاظ على التناسب
          ),
        ),
        suffixIcon: widget.fieldType == AppTextFieldType.password
            // ? IconButton(
            //     icon:
            //         Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            //     onPressed: () => setState(() => _isObscure = !_isObscure),
            //   )
            // : null,
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GestureDetector(
                  onTap: () => setState(() => _isObscure = !_isObscure),
                  child: AppSvgPicture(
                    assetName: IconsApp.visibility,
                    color: _isObscure
                        ? ColorResource.borderGray
                        : ColorResource.black,
                    width: 16.w, // تعديل حجم الأيقونة
                    height: 14.h, // استخدام نفس القيمة للحفاظ على التناسب
                  ),
                ),
              )
            : null,
        errorText: _errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1.4,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1.4,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.4,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.fieldType) {
      case AppTextFieldType.email:
        return TextInputType.emailAddress;
      case AppTextFieldType.phone:
        return TextInputType.phone;
      case AppTextFieldType.password:
        return TextInputType.visiblePassword;
      case AppTextFieldType.text:
        return TextInputType.text;
    }
  }
}
