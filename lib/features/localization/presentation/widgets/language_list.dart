part of change_language_page;

class LanguageList extends GetView<LocalizeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: LanguageConstants.getLanguageOptions().entries.map((entry) {
        final languageCode = entry.key;
        final languageName = entry.value;

        return AppButton(
          title: languageName,
          style: AppButtonStyle.primary,
          iconName: IconsApp.uea,
          onPressed: () async {
            await controller.changeLocale(languageCode);
            Get.back();
          },
        );
      }).toList(),
    );
  }
}
