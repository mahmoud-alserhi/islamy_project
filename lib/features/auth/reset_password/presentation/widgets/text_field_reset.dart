part of reset_password_page;

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({super.key});

  ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextField(
          fieldType: AppTextFieldType.password,
          hintText: 'Reset Password',
          prefixIcon: IconsApp.lock,
          controller: resetPasswordController.passwordController,
          focusNode: resetPasswordController.passwordFocus,
          inputAction: TextInputAction.next,
        ),
        SizedBox(height: 24.h),
        AppTextField(
          fieldType: AppTextFieldType.password,
          hintText: 'Confirm Password',
          prefixIcon: IconsApp.lock,
          controller: resetPasswordController.confirmPasswordController,
          focusNode: resetPasswordController.confirmPasswordFocus,
          inputAction: TextInputAction.done,
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
