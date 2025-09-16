// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgPicture extends StatelessWidget {
  AppSvgPicture(
      {super.key,
      required this.assetName,
      this.color,
      this.width,
      this.height,
      this.fit = BoxFit.contain});

  final String assetName;
  Color? color;
  double? height;
  double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      matchTextDirection: true,
      height: height,
      width: width,
      color: color,
      fit: fit,
    );
  }
}
