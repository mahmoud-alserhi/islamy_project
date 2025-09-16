part of login_page;

class BottomText extends StatelessWidget {
  BottomText({super.key});

  LoginController authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your navigation logic here
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: AppText.bodyMedium(context),
            ),
            TextSpan(
              text: "Sign Up",
              style: AppText.bodyMedium(context).copyWith(
                color: ColorResource.primary, // Or your primary color
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => RegistrationPage());
                },
            ),
          ],
        ),
      ),
    );
  }
}
