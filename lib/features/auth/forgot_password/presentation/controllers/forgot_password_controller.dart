import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  bool _validateAllFields() {
    bool isValid = true;

    // التحقق من كل حقل على حدة
    isValid &= emailController.text.isNotEmpty;

    return isValid;
  }
}
