import 'package:flutter/material.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';

import 'node_title_widget.dart';

class ListTileCustomWidget extends StatelessWidget {
  final TreeEntity node;
  const ListTileCustomWidget({
    super.key,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      data: Theme.of(context).listTileTheme,
      child: ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        leading: const SizedBox(
          width: 24,
        ),
        title: NodeTitleWidget(
          treeNode: node,
        ),
      ),
    );
  }
}
