part of reset_password_page;

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppText(
            text: "Reset password",
            style: AppText.headlineLarge(context),
            textAlign: TextAlign.center,
            maxLine: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15.h),
          AppText(
            text: "Please enter a new password",
            style: AppText.bodyMedium(context),
            textAlign: TextAlign.center,
            maxLine: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
