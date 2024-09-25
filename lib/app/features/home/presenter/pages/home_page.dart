import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:model/app/core/theme/fonts/font_manager.dart';
import 'package:model/app/core/theme/images/images.dart';
import 'package:model/app/core/theme/theme_manager/theme.dart';
import 'package:model/app/features/home/domain/entities/company_entity.dart';
import 'package:model/app/features/home/domain/helpers/enums/type_state_enum.dart';
import 'package:model/app/features/home/presenter/controllers/home_controller.dart';
import 'package:model/app/features/home/presenter/widgets/list_tile_custom_widget.dart';

import '../widgets/node_title_widget.dart';
import '../widgets/text_field_search_item_widget.dart';
import '../widgets/type_state_custom_widget.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  final CompanyEntity company;
  const HomePage({
    super.key,
    required this.homeController,
    required this.company,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.generateTreeNode(widget.company.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeManager.secondaryColor,
        title: SvgPicture.asset(ImagesManager.logoTractian),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ThemeManager.white,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.028),
        child: ScopedBuilder(
          store: widget.homeController.homeStore,
          onLoading: (loading) => const Center(
            child: CircularProgressIndicator(),
          ),
          onState: (context, state) {
            return Column(
              children: [
                Padding(
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
                        '${widget.company.name} Unit',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ThemeManager.primaryColor,
                          fontFamily: FontManager.montserratMedium,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                  ),
                  child: TextFieldSearchItemWidget(
                    onChanged: (query) {
                      widget.homeController.setSearchQuery(query);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TypeStateCustomWidget(
                        colorSelected: widget.homeController.typeState ==
                            TypeStateEnum.sensor,
                        title: 'Sensor de energia',
                        onTap: () => widget.homeController
                            .setTypeState(TypeStateEnum.sensor),
                        imageString: ImagesManager.boltSensor,
                      ),
                      TypeStateCustomWidget(
                        colorSelected: widget.homeController.typeState ==
                            TypeStateEnum.critical,
                        title: 'Estado Crítico',
                        onTap: () => widget.homeController
                            .setTypeState(TypeStateEnum.critical),
                        imageString: ImagesManager.critical,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.homeController.listTreeNode.length,
                    itemBuilder: (context, index) {
                      final itemNode =
                          widget.homeController.listTreeNode[index];

                      return Theme(
                        data: theme,
                        child: ListTileTheme(
                          data: theme.listTileTheme,
                          child: ExpansionTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            tilePadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            childrenPadding: itemNode.children.isEmpty
                                ? EdgeInsets.zero
                                : EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.height * 0.006,
                                    bottom: size.height * 0.006,
                                  ),
                            trailing: const SizedBox.shrink(),
                            leading: itemNode.children.isEmpty
                                ? const SizedBox(width: 24)
                                : null,
                            dense: false,
                            title: NodeTitleWidget(
                              treeNode: itemNode,
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: itemNode.children.length,
                                itemBuilder: (context, index) {
                                  final childItem = itemNode;
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

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
