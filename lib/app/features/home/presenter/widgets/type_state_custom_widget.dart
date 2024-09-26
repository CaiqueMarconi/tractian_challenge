import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/fonts/font_manager.dart';
import '../../../../core/theme/theme_manager/theme.dart';

class TypeStateCustomWidget extends StatelessWidget {
  final bool colorSelected;
  final String title;
  final Function() onTap;
  final String imageString;
  const TypeStateCustomWidget({
    super.key,
    required this.colorSelected,
    required this.title,
    required this.onTap,
    required this.imageString,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.006,
          horizontal: size.height * 0.01,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(
            size.height * 0.01,
          ),
          border: Border.all(
            width: 2,
            color: colorSelected
                ? ThemeManager.primaryColor
                : ThemeManager.greyLight,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              imageString,
            ),
            SizedBox(width: size.width * 0.014),
            Text(
              title,
              style: TextStyle(
                fontFamily: FontManager.montserratMedium,
                color: colorSelected
                    ? ThemeManager.primaryColor
                    : theme.textTheme.bodySmall!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
