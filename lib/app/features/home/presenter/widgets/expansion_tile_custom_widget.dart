import 'package:flutter/material.dart';

import 'list_tile_custom_widget.dart';
import 'node_title_widget.dart';

class ExpansionTileCustomWidget extends StatelessWidget {
  final dynamic item;
  const ExpansionTileCustomWidget({
    super.key,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.leading,
      tilePadding: const EdgeInsets.symmetric(vertical: 0),
      visualDensity: VisualDensity.compact,
      childrenPadding: EdgeInsets.only(
        left: size.width * 0.04,
        top: size.height * 0.006,
        bottom: size.height * 0.006,
      ),
      leading: item.children.isEmpty ? const SizedBox(width: 24) : null,
      dense: false,
      title: NodeTitleWidget(
        treeNode: item,
      ),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: item.children.length,
          itemBuilder: (context, index) {
            final childItem = item;
            return childItem.children.isEmpty
                ? ListTileCustomWidget(
                    node: childItem.children[index],
                  )
                : ExpansionTileCustomWidget(
                    item: childItem.children[index],
                  );
          },
        ),
      ],
    );
  }
}
