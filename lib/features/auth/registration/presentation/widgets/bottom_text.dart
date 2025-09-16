part of registration_page;

class BottomText extends StatelessWidget {
  BottomText({super.key});

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
              text: "Already have account? ",
              style: AppText.bodyMedium(context),
            ),
            TextSpan(
              text: "Sign in",
              style: AppText.bodyMedium(context).copyWith(
                color: ColorResource.primary, // Or your primary color
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => LoginPage());
                },
            ),
          ],
        ),
      ),
    );
  }
}
