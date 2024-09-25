import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:model/app/core/theme/images/images.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_item_enum.dart';

class DataHelper {
  static Widget getIconItem(TypeItemEnum typeItem) {
    switch (typeItem) {
      case TypeItemEnum.asset:
        return SvgPicture.asset(
          ImagesManager.asset,
          width: 20,
          height: 20,
        );
      case TypeItemEnum.location:
        return SvgPicture.asset(
          ImagesManager.location,
          width: 20,
          height: 20,
        );
      case TypeItemEnum.component:
        return SvgPicture.asset(
          ImagesManager.component,
          width: 20,
          height: 20,
        );
    }
  }
}
