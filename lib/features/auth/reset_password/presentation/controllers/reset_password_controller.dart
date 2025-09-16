import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  bool _validateAllFields() {
    bool isValid = true;

    // التحقق من كل حقل على حدة
    isValid &= passwordController.text.isNotEmpty;
    isValid &= confirmPasswordController.text.isNotEmpty;

    return isValid;
  }
}
