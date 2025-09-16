part of forgot_password_page;

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: "Login to your account",
        style: AppText.headlineLarge(context),
        textAlign: TextAlign.center,
        maxLine: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
