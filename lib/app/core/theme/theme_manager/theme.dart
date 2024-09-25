import 'package:flutter/material.dart';

class ThemeManager {
  static Color primaryColor = const Color(0xff346fec);
  static Color secondaryColor = const Color(0xff141c2c);

  static Color greyLight = const Color(0xffF4F4F4);
  static Color greyMedium = const Color.fromARGB(255, 238, 238, 238);
  static Color greyDark = const Color.fromARGB(255, 68, 68, 68);
  static Color white = const Color(0xffffffff);
  static Color black = const Color(0xff000000);
  static Color red = const Color.fromARGB(255, 255, 0, 0);
  static Color green = const Color.fromARGB(255, 30, 160, 69);

  static final themeLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    dividerColor: Colors.transparent,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: black,
          width: 2.0,
        ),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 0,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
    ),
    appBarTheme: AppBarTheme(
      color: greyLight,
      elevation: 3,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: black,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: white,
    ),
  );

  static final themeDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: white,
          width: 2.0,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: white,
      elevation: 3,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: white,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: white,
    ),
  );

  static ThemeData whichTheme(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      return themeLight;
    } else {
      return themeDark;
    }
  }
}
