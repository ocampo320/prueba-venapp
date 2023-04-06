import 'package:flutter/material.dart';


import 'package:kncha_app/core/constans/constans.dart';



/// ## Parameters for design
/// ### To follow the font size from Adobe XD for the "dp" value, the ""
///     use: fontSize: 10
///
/// ### Styles for text sizes from XD Adobe
///     1.Style Medium: fontWeight: FontWeight.w500
///     2.Style SemiBold: fontWeight: FontWeight.w600
///     3.Style Bold: fontWeight: FontWeight.w700
///     4.Style ExtraBold: fontWeight: FontWeight.w900
///     5.Style Regular: fontWeight: FontWeight.normal

//region Other Styles
final styleButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
  foregroundColor: MaterialStateProperty.all(Colors.black),
  elevation: MaterialStateProperty.all(0),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      return Colors.transparent;
    },
  ),
);

final styleCheckBox = CheckboxThemeData(
  checkColor: MaterialStateProperty.all(Colors.white),
  fillColor: MaterialStateProperty.all(ColorConstants.grayLabel2),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.25)),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      return Colors.transparent;
    },
  ),
);

final styleMainButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(ColorConstants.mainColor),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  elevation: MaterialStateProperty.all(0),
  minimumSize: MaterialStateProperty.all(Size(170.15, 42)),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      return Colors.transparent;
    },
  ),
);

final styleCancelButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
  elevation: MaterialStateProperty.all(0),
  minimumSize: MaterialStateProperty.all(Size(170.15, 42)),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
      side: const BorderSide(
        color: ColorConstants.mainBlue,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
  ),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      return Colors.transparent;
    },
  ),
);

extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^.+@[a-zA-Z-]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(this);
  }
}

const styleTextSelection = TextSelectionThemeData(
  cursorColor: ColorConstants.mainColor,
  selectionHandleColor: ColorConstants.mainColor,
);

const styleInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: ColorConstants.grayInput),
);

const styleInputErrorBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: ColorConstants.mainColor),
);
//endregion

InputDecoration defaultInputDecoration({
  bool? filled,
  Color? fillColor,
  Widget? suffixIcon,
  String? hintText,
  String? labelText,
  EdgeInsets? contentPadding,
  bool showError = false,
}) {
  return InputDecoration(
    filled: filled,
    fillColor: fillColor ?? ColorConstants.grayBackground,
    contentPadding:
        contentPadding ??const  EdgeInsets.fromLTRB(10.5, 2.0, 0, 14),
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: suffixIcon,
    hintText: hintText,
    hintStyle: textThemeHintText,
    labelText: labelText,
    border: styleInputBorder,
    enabledBorder: styleInputBorder,
    focusedBorder: styleInputBorder,
    errorBorder: showError ? styleInputErrorBorder : styleInputBorder,
    focusedErrorBorder: showError ? styleInputErrorBorder : styleInputBorder,
    errorStyle:
        showError ? textThemeErrorFormCustom : const TextStyle(height: 0),
  );
}

//region fontFamily Raleway
const textBottomBarTheme = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 10,
);

const textTheme = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 10,
  color: ColorConstants.mainBlue,
);

final textThemeAppBarProfile = const TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 10,
  color: ColorConstants.grayBackground,
);

final textTheme2 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: ColorConstants.mainBlue,
);

final textTheme3 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: Colors.white,
);

final textCancelModal = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: ColorConstants.mainBlue,
);

final textTheme7 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: Colors.white,
);

final textBottomTextLogin = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: ColorConstants.mainBlue,
);

final textBottomTextLogin2 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayLabel,
);

final textItemDropdown = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayLabel2,
);

final textFormField = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.blueDark,
);

final subtitleLogoWidget = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayLabel2,
);

final textBtnFormWidget = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

final textPasswordTile = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: ColorConstants.grayText,
);

final textThemeParamsPassword = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 12,
  color: ColorConstants.grayInput,
);

final textThemeModalTarifas = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 12,
  color: ColorConstants.grayText,
);

final textThemeModalTarifasBold = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: ColorConstants.grayText,
);

final textThemeLabelForm = TextStyle(
  decorationStyle: TextDecorationStyle.dashed,
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: ColorConstants.grayLabel2,
);

final textThemeHintText = TextStyle(
  height: 2,
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayInput,
);

final textThemeHintTextDropdown = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayInput,
);

final textThemeTermAndConditionNormal = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayText,
);

final textThemeTermAndCondition = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  decoration: TextDecoration.underline,
  color: ColorConstants.grayText,
);

final textThemeHomeCards = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: ColorConstants.blueDark,
);

final textThemeErrorFormCustom = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.mainColor,
);

final textThemeModalTime = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: ColorConstants.mainColor,
);

final textTheme10 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: ColorConstants.blueDark,
);

final textTheme11 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: Colors.white,
);

final textOverlay = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: Colors.white,
);

final textTheme12 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: ColorConstants.grayText,
);

final textThemeDrawer = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: ColorConstants.grayText);

final profileNameTheme = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: ColorConstants.grayText,
);

final subtitleAlert = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: ColorConstants.grayText,
);

final textTheme15 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: ColorConstants.grayText,
);

final textTheme18 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: ColorConstants.grayText,
);

final textTheme20 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: ColorConstants.grayText,
);

final textBodyVinculate = TextStyle(
  height: 1.5,
  fontWeight: FontWeight.w300,
  fontFamily: 'Raleway',
  fontSize: 14,
  color: ColorConstants.grayLabel,
);
final textFirstFotterVinculate = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 18,
  color: ColorConstants.white,
);
final textSecondFotterVinculate = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Raleway',
  fontSize: 18,
  color: ColorConstants.mainColor,
);
final textBlackBtnFormWidget = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: Colors.black,
);

final textThemeLinkCard = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: ColorConstants.mainColor,
);

final textThemeForExpansion = TextStyle(
  height: 1.3,
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: ColorConstants.grayText,
);

final textTheme22 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 10,
  color: ColorConstants.grayText,
);

final textTheme23 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 10,
  color: ColorConstants.mainColor,
);

final textTheme25 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: ColorConstants.grayLabel,
);

final textTheme26 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: ColorConstants.grayLabel2,
);

final textTheme27 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: ColorConstants.blueDark,
);

final textTheme28 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayText,
);

final textTheme29 = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: ColorConstants.grayText,
);
//endregion

//region fontFamily Gradual
final textTheme4 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: ColorConstants.mainColor,
);

final textTheme5 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: ColorConstants.grayLabel,
);

final textTheme6 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: ColorConstants.grayText,
);

final titleLogoWidget = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: ColorConstants.grayText,
);

final titleTermsAndCondition = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w700,
  fontSize: 18,
  color: ColorConstants.grayText,
);

final textTheme8 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.normal,
  fontSize: 16,
  color: Colors.white,
);

final textTheme9 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: Colors.white,
);

final textTheme13 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w900,
  fontSize: 32,
  color: ColorConstants.mainColor,
);

final textTheme14 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w800,
  fontSize: 24,
  color: ColorConstants.grayText,
);

final textTheme16 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: Colors.white,
);

final textTheme17 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.normal,
  fontSize: 18,
  color: ColorConstants.grayText,
);

final textTheme19 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w900,
  fontSize: 18,
  color: ColorConstants.mainColor,
);

final textThemeFirstCardVinculate = TextStyle(
  height: 1.5,
  fontFamily: 'Gradual',
  fontSize: 11,
  color: ColorConstants.grayText,
);

final textTheme21 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: ColorConstants.grayText,
);

final textTheme24 = TextStyle(
  fontFamily: 'Gradual',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: ColorConstants.grayText,
);
//endregion

final styleScrollbar = ScrollbarThemeData(
  thumbVisibility: MaterialStateProperty.all(true),
  thumbColor: MaterialStateProperty.all(ColorConstants.grayInput),
  radius: Radius.circular(4),
);
final textThemeLastentry = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: ColorConstants.grayInput);

final textTypeNews = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: ColorConstants.grayInput);

final textResumenNews = TextStyle(
    height: 1.5,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: ColorConstants.grayText);
