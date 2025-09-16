part of login_page;

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButton(
          title: 'Sign in with Email',
          style: AppButtonStyle.primary,
          onPressed: () {
            Get.to(() => HomePage());
          },
        ),
        SizedBox(height: 24.h),
        AppButton(
          title: 'Sign up with Google',
          style: AppButtonStyle.secondary,
          iconName: IconsApp.google,
          onPressed: () {
            Get.to(() => ChangeLanguagePage());
          },
        )
      ],
    );
  }
}
