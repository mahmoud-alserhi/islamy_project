part of registration_page;

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
            text: "Create new account",
            style: AppText.headlineLarge(context),
            textAlign: TextAlign.center,
            maxLine: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
