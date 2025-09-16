part of reset_password_page;

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: 'Reset Password',
      style: AppButtonStyle.primary,
      onPressed: () {
        Get.back();
      },
    );
  }
}
