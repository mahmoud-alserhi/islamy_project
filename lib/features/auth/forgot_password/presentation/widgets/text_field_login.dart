part of forgot_password_page;

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({super.key});

  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextField(
          fieldType: AppTextFieldType.email,
          hintText: 'Email address',
          prefixIcon: IconsApp.email,
          controller: forgotPasswordController.emailController,
          focusNode: forgotPasswordController.emailFocus,
          inputAction: TextInputAction.done,
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
