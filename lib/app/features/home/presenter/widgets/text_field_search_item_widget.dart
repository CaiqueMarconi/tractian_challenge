import 'package:flutter/material.dart';

import '../../../../core/theme/fonts/font_manager.dart';
import '../../../../core/theme/theme_manager/theme.dart';

class TextFieldSearchItemWidget extends StatelessWidget {
  const TextFieldSearchItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Buscar ativo ou local',
        hintStyle: TextStyle(
          color: ThemeManager.greyDark,
          fontFamily: FontManager.montserratMedium,
        ),
        filled: true,
        fillColor: ThemeManager.greyMedium,
        prefixIcon: Icon(Icons.search, color: ThemeManager.greyDark),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(
              size.height * 0.01,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(
              size.height * 0.01,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(
              size.height * 0.01,
            ),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: size.height * 0.010,
        ),
      ),
      style: TextStyle(color: ThemeManager.black),
    );
  }
}
