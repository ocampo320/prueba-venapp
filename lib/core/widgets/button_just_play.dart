import 'package:flutter/material.dart';
import 'package:kncha_app/core/color_manager.dart';
import 'package:kncha_app/core/utils/app_typography.dart';

class ButtonJustPlay extends StatelessWidget {
  const ButtonJustPlay(
      {Key? key,
      required this.color,
      required this.title,
      required this.onTap,
      required this.width,
      required this.height,
      required this.fontSize, required this.colorText})
      : super(key: key);
  final Color color;
  final String title;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double fontSize;
   final Color colorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Center(
          child: Text(title,
              style: AppTypography.stRaleway(
                  color: colorText??ColorManager.gradientsColorsPrimary011Opa100,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
