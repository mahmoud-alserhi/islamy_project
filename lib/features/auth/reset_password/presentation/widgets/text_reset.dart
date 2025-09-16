part of reset_password_page;

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: "Reset your Password Now",
        style: AppText.headlineLarge(context),
        textAlign: TextAlign.center,
        maxLine: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
