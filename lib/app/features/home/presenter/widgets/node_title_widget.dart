import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model/app/features/home/domain/entities/tree_entity.dart';
import '../../../../core/theme/fonts/font_manager.dart';
import '../../domain/helpers/data_helper/node_helper.dart';

class NodeTitleWidget extends StatefulWidget {
  final TreeEntity treeNode;
  const NodeTitleWidget({
    super.key,
    required this.treeNode,
  });

  @override
  State<NodeTitleWidget> createState() => _NodeTitleWidgetState();
}

class _NodeTitleWidgetState extends State<NodeTitleWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(width: size.width * 0.02),
        DataHelper.getIconItem(widget.treeNode.item.typeItem),
        SizedBox(width: size.width * 0.02),
        Flexible(
          child: Text(
            widget.treeNode.item.name,
            style: TextStyle(
              fontFamily: FontManager.montserratMedium,
              fontSize: size.height * 0.018,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.02),
        if (widget.treeNode.item.status != null)
          DataHelper.getIconStatusComponent(widget.treeNode.item.status!),
      ],
    );
  }
}
