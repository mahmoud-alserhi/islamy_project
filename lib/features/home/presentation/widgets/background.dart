part of home_page;

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSvgPicture(
      assetName: IconsApp.homeBackground,
      width: 390.w,
      height: 311.h,
    );
  }
}
