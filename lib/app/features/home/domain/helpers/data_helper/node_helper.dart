// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:model/app/core/theme/images/images.dart';
import 'package:model/app/core/theme/theme_manager/theme.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';

class DataHelper {
  static Widget getIconItem(TypeItemEnum typeItem) {
    switch (typeItem) {
      case TypeItemEnum.asset:
        return SvgPicture.asset(
          ImagesManager.asset,
          width: 20,
          height: 20,
          color: ThemeManager.primaryColor,
        );
      case TypeItemEnum.location:
        return SvgPicture.asset(
          ImagesManager.location,
          width: 20,
          height: 20,
          color: ThemeManager.primaryColor,
        );
      case TypeItemEnum.component:
        return SvgPicture.asset(
          ImagesManager.component,
          width: 20,
          height: 20,
          color: ThemeManager.primaryColor,
        );
    }
  }

  static Widget getIconStatusComponent(TypeStateEnum typeState) {
    switch (typeState) {
      case TypeStateEnum.critical:
        return SvgPicture.asset(
          ImagesManager.critical,
          width: 16,
          height: 16,
        );
      case TypeStateEnum.sensor:
        return SvgPicture.asset(
          ImagesManager.boltSensor,
          width: 16,
          height: 16,
        );
    }
  }
}
