
import 'package:monkeybox_dhruvi/common/app_array.dart';
import 'package:monkeybox_dhruvi/common/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'common/app_fonts.dart';
import 'common/theme/theme_service.dart';
import 'config.dart';
import 'helper/navigation_class.dart';
export 'package:flutter/material.dart';
export '../common/theme/app_css.dart';
export '../common/extension/spacing.dart';

AppFonts appFonts = AppFonts();
NavigationClass route = NavigationClass();
AppArray appArray = AppArray();
AppCss appCss = AppCss();


AppTheme appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices.appTheme;
}