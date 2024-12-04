import 'package:flutter/material.dart';
import 'package:tt33/ui_kit/colors.dart';

abstract class AppStyles {
  static const displayLarge = TextStyle(
    fontFamily: 'Jost',
    height: 1.2,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static const displayMedium = TextStyle(
    fontFamily: 'Jost',
    height: 1.2,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static const displaySmall = TextStyle(
    fontFamily: 'Jost',
    height: 1.2,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static const bodyLarge = TextStyle(
    fontFamily: 'Jost',
    height: 1.2,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static const bodyMedium = TextStyle(
    fontFamily: 'Jost',
    height: 1.2,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static const bodySmall = TextStyle(
    fontFamily: 'Jost',
    height: 1.2,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
}
