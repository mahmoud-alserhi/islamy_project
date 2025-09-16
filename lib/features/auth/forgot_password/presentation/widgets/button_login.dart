part of forgot_password_page;

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: 'Send Link',
      style: AppButtonStyle.primary,
      onPressed: () {
        Get.to(ResetPasswordPage());
      },
    );
  }
}
