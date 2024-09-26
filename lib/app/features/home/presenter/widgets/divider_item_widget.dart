import 'package:flutter/material.dart';

class DiverItemWidget extends StatelessWidget {
  const DiverItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      height: size.height * 0.003,
      color: theme.colorScheme.surface,
    );
  }
}
