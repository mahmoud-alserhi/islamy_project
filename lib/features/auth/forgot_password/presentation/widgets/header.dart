part of forgot_password_page;

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppSvgPicture(
            assetName: IconsApp.logoApp,
            width: 100.w,
            height: 60.h,
          ),
          SizedBox(height: 40.h),
          AppText(
            text: "Enter your email",
            style: AppText.headlineLarge(context),
            textAlign: TextAlign.center,
            maxLine: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15.h),
          AppText(
            text:
                "We will send you a verification link to\n reset your password",
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
