// ignore: use_string_in_part_of_directives
part of out_bordaing_page;


class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSvgPicture(assetName: IconsApp.outBordaing,width: 283.w,height: 253.h,);
  }
}