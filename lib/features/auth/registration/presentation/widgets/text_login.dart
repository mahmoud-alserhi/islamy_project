part of registration_page;

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText(
          text: "Login to your account",
          style: AppText.headlineLarge(context),
          textAlign: TextAlign.center,
          maxLine: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
