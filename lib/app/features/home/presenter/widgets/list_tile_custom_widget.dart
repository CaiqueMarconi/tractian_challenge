import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/tree_entity.dart';

import 'divider_item_widget.dart';
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
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            leading: const SizedBox(
              width: 24,
            ),
            title: NodeTitleWidget(
              treeNode: node,
            ),
          ),
          const DiverItemWidget()
        ],
      ),
    );
  }
}
