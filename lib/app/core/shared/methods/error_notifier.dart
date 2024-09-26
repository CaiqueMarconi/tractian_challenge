import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_manager/theme.dart';

class ErrorNotifier {
  static bool displayErrorIfExists({required dynamic store}) {
    if (store.error != null) {
      Asuka.showSnackBar(
        SnackBar(
          content: Text(store.error.message),
          duration: const Duration(seconds: 2),
          backgroundColor: ThemeManager.red,
        ),
      );
      return true;
    } else {
      return false;
    }
  }
}
