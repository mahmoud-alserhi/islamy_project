import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FocusNode fullNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    fullNameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  bool _validateAllFields() {
    bool isValid = true;

    // التحقق من كل حقل على حدة
    isValid &= fullNameController.text.isNotEmpty;
    isValid &= emailController.text.isNotEmpty;
    isValid &= passwordController.text.length >= 6;
    isValid &= phoneController.text.length >= 10;

    return isValid;
  }
}
