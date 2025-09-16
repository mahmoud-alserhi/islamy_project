part of forgot_password_page;

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
              text: "Didn’t get a link? ",
              style: AppText.bodyMedium(context),
            ),
            TextSpan(
              text: "Resend again",
              style: AppText.bodyMedium(context).copyWith(
                color: ColorResource.primary, // Or your primary color
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
