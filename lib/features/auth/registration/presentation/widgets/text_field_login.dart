part of registration_page;

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({super.key});

  RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextField(
          fieldType: AppTextFieldType.text,
          hintText: 'Full name',
          prefixIcon: IconsApp.person,
          controller: registrationController.fullNameController,
          focusNode: registrationController.fullNameFocus,
          inputAction: TextInputAction.next,
          onSubmitted: (_) => FocusScope.of(context)
              .requestFocus(registrationController.emailFocus),
        ),
        SizedBox(height: 24.h),
        AppTextField(
          fieldType: AppTextFieldType.email,
          hintText: 'Email address',
          prefixIcon: IconsApp.email,
          controller: registrationController.emailController,
          focusNode: registrationController.emailFocus,
          inputAction: TextInputAction.next,
          onSubmitted: (_) => FocusScope.of(context)
              .requestFocus(registrationController.passwordFocus),
        ),
        SizedBox(height: 24.h),
        AppTextField(
          fieldType: AppTextFieldType.password,
          hintText: 'Password',
          prefixIcon: IconsApp.lock,
          controller: registrationController.passwordController,
          focusNode: registrationController.passwordFocus,
          inputAction: TextInputAction.done,
          obscureText: true,
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
