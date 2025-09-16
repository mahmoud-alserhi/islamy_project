part of out_bordaing_page;

class ButtonOutBordaing extends StatelessWidget {
  const ButtonOutBordaing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButton(
          title: 'Sign up with Email',
          style: AppButtonStyle.primary,
          onPressed: () {
            Get.to(() => LoginPage());
          },
        ),
        SizedBox(height: 24.h),
        AppButton(
          title: 'Sign up with Google',
          style: AppButtonStyle.secondary,
          iconName: IconsApp.google,
          // iconColor: Colors.white, // اختياري

          onPressed: () {},
        )
      ],
    );
  }
}
