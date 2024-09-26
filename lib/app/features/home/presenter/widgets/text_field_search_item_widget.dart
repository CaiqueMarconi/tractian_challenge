import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/theme/fonts/font_manager.dart';

class TextFieldSearchItemWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const TextFieldSearchItemWidget({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final intl = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: intl.search_field,
        hintStyle: TextStyle(
          color: theme.textTheme.bodySmall!.color,
          fontFamily: FontManager.montserratMedium,
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        prefixIcon: Icon(Icons.search, color: theme.textTheme.bodySmall!.color),
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
      style: theme.textTheme.bodySmall!.copyWith(fontSize: size.height * 0.018),
    );
  }
}
