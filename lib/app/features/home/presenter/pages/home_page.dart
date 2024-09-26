import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tractian_challenge/app/core/theme/images/images.dart';
import 'package:tractian_challenge/app/core/theme/theme_manager/theme.dart';
import 'package:tractian_challenge/app/features/home/domain/entities/company_entity.dart';
import 'package:tractian_challenge/app/features/home/presenter/controllers/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/theme/fonts/font_manager.dart';
import '../widgets/divider_item_widget.dart';
import '../widgets/expansion_tile_custom_widget.dart';
import '../widgets/list_tile_custom_widget.dart';
import '../widgets/text_field_search_item_widget.dart';
import '../widgets/title_company_home_widget.dart';
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
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.homeController.setEmptyData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final intl = AppLocalizations.of(context)!;
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
      body: Column(
        children: [
          ScopedBuilder(
            store: widget.homeController.homeStore,
            onState: (context, state) => Column(
              children: [
                TitleCompanyHomeWidget(company: widget.company),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.width * 0.028,
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
                        colorSelected: widget.homeController.typeSensorSelected,
                        title: intl.sensor_type,
                        onTap: () => widget.homeController.setSensorSelected(),
                        imageString: ImagesManager.boltSensor,
                      ),
                      TypeStateCustomWidget(
                        colorSelected: widget.homeController.typeAlertSelected,
                        title: intl.alert_type,
                        onTap: () => widget.homeController.setAlertSelected(),
                        imageString: ImagesManager.critical,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.028),
              child: ScopedBuilder(
                store: widget.homeController.homeStore,
                onLoading: (loading) => const Center(
                  child: CircularProgressIndicator(),
                ),
                onState: (context, state) {
                  if (widget.homeController.listTreeNode.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagesManager.emptyData,
                            scale: 1.4,
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            'Não há dados...',
                            style: TextStyle(
                              fontFamily: FontManager.montserratMedium,
                              color: ThemeManager.greyDark,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                widget.homeController.listTreeNode.length,
                            itemBuilder: (context, index) {
                              final itemNode =
                                  widget.homeController.listTreeNode[index];
                              if (itemNode.children.isEmpty) {
                                return ListTileCustomWidget(
                                  node: itemNode,
                                );
                              } else {
                                return Theme(
                                  data: theme,
                                  child: ListTileTheme(
                                    data: theme.listTileTheme,
                                    child: Column(
                                      children: [
                                        ExpansionTileCustomWidget(
                                          item: itemNode,
                                        ),
                                        const DiverItemWidget()
                                      ],
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
