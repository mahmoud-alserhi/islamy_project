part of registration_page;

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButton(
          title: 'Sign up with Email',
          style: AppButtonStyle.primary,
          onPressed: () {},
        ),
        SizedBox(height: 32.h),
        AppText(
          text: "or continue with",
          style: AppText.bodyMedium(context).copyWith(
            color: ColorResource.black, // Or your primary color
          ),
          maxLine: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
        AppButton(
          title: 'Sign up with Google',
          style: AppButtonStyle.secondary,
          iconName: IconsApp.google,
          onPressed: () {},
        )
      ],
    );
  }
}
