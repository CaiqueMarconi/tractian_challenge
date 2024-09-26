import 'package:flutter/material.dart';

import '../../../../core/theme/fonts/font_manager.dart';
import '../../../../core/theme/theme_manager/theme.dart';
import '../../domain/entities/company_entity.dart';

class TitleCompanyHomeWidget extends StatelessWidget {
  final CompanyEntity company;
  const TitleCompanyHomeWidget({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(size.height * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                size.height * 0.01,
              ),
              color: ThemeManager.primaryColor,
            ),
            child: Icon(
              Icons.apartment,
              color: ThemeManager.white,
              size: size.height * 0.02,
            ),
          ),
          SizedBox(width: size.width * 0.02),
          Text(
            '${company.name} Unit',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: ThemeManager.primaryColor,
              fontFamily: FontManager.montserratMedium,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }
}
