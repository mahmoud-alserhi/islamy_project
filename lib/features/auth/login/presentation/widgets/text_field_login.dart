part of login_page;

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({super.key});

  LoginController authController = Get.put(LoginController());

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
          controller: authController.emailController,
          focusNode: authController.emailFocus,
          inputAction: TextInputAction.next,
          onSubmitted: (_) =>
              FocusScope.of(context).requestFocus(authController.passwordFocus),
        ),
        SizedBox(height: 24.h),
        AppTextField(
          fieldType: AppTextFieldType.password,
          hintText: 'Password',
          prefixIcon: IconsApp.lock,
          controller: authController.passwordController,
          focusNode: authController.passwordFocus,
          inputAction: TextInputAction.done,
          obscureText: true,
        ),
        SizedBox(height: 24.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Get.to(() => ForgotPasswordPage());
            },
            child: AppText(
              text: "Forget password ?",
              style: AppText.bodyMedium(context),
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(height: 94.h),
      ],
    );
  }
}
