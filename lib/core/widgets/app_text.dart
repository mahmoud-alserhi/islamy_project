import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int maxLine;
  final TextOverflow overflow;

  const AppText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLine = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  // Predefined text styles
  static TextStyle displayLarge(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge ?? const TextStyle();

  static TextStyle headlineLarge(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge ?? const TextStyle();

  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

  static TextStyle button(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ) ??
      const TextStyle();

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
    );
  }
}
