// ignore: use_string_in_part_of_directives
part of out_bordaing_page;

class TextOutBordaing extends StatelessWidget {
  const TextOutBordaing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText(
          text: "Manage your daily\nIslamic habits",
          style: AppText.headlineLarge(context),
          textAlign: TextAlign.center,
          maxLine: 2,
        ),
        SizedBox(height: 16.h),
        AppText(
          text: "Islamy let's you manage your daily\nIslamic habits with ease",
          style: AppText.bodyMedium(context),
          textAlign: TextAlign.center,
          maxLine: 2,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
