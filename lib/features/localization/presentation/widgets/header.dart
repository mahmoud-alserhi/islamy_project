part of change_language_page;

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppText(
            text: LocaleKeys.selectLanguage.tr,
            style: AppText.headlineLarge(context),
            textAlign: TextAlign.center,
            maxLine: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 48.h),
          AppSvgPicture(
            assetName: IconsApp.changeLange,
            width: 235.w,
            height: 235.h,
          ),
          SizedBox(height: 48.h),
        ],
      ),
    );
  }
}
