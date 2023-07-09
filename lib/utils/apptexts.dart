import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppTexts {
  static const String textFieldHintText = "Enter e.g 'add 7'";
  static const String appBarText = "Riverpod Counter App";
  static const settingsAppBarText = "App Settings";
  static const darkModeText = "Dark Mode";
  static const primaryColorText = "Primary Color";
}

class CustomIcons {
  static IconData redoIcon = PhosphorIcons.bold.arrowClockwise;
  static IconData solutionIcon = PhosphorIcons.bold.equals;
  static IconData settingsIcon  = PhosphorIcons.bold.gear;
  static IconData activeSwitchIcon = PhosphorIcons.bold.check;
  static IconData inactiveSwitchIcon = PhosphorIcons.bold.x;
  static IconData caretDownIcon = PhosphorIcons.bold.caretDown;
}

//Text Extensions

extension StyledTextExtension on String {
  Text txtStyled({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
    TextDecoration? textDecoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      this,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
      ),
    );
  }
}

extension CustomIcon on IconData {
  Widget iconslide({double? size, Color? color}) {
    return Icon(
      this, 
      size: size, 
      color: color);
  }
}

