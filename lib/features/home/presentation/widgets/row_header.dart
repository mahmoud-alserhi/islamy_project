part of home_page;

class RowHeader extends StatelessWidget {
  const RowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: ColorResource.primaryLight,
          radius: 20.r,
          child: AppSvgPicture(
            assetName: IconsApp.translate,
            color: ColorResource.white,
            width: 20.w,
            height: 20.h,
          ),
        ),
        Column(
          children: [
            AppText(
              text: "Salam Alaikum",
              style: AppText.bodyMedium(context)
                  .copyWith(color: ColorResource.white, fontSize: 14.sp),
              textAlign: TextAlign.center,
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
            ),
            AppText(
              text: "Sat, 18th Rajab",
              style: AppText.bodyMedium(context)
                  .copyWith(color: ColorResource.white, fontSize: 18.sp),
              textAlign: TextAlign.center,
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: ColorResource.primaryLight,
          radius: 20.r,
          child: AppSvgPicture(
            assetName: IconsApp.compass,
            color: ColorResource.white,
            width: 20.w,
            height: 20.h,
          ),
        )
      ],
    );
  }
}
