import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tractian_challenge/app/core/theme/fonts/font_manager.dart';
import 'package:tractian_challenge/app/core/theme/images/images.dart';
import 'package:tractian_challenge/app/core/theme/theme_manager/theme.dart';
import 'package:tractian_challenge/app/features/home/presenter/controllers/home_controller.dart';

class HomeHeader extends StatefulWidget {
  final HomeController homeController;
  const HomeHeader({
    super.key,
    required this.homeController,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  void initState() {
    super.initState();
    widget.homeController.getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final intl = AppLocalizations.of(context)!;
    return Container(
      color: ThemeManager.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ThemeManager.primaryColor,
          body: ScopedBuilder(
            store: widget.homeController.homeStore,
            onState: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          intl.welcome,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ThemeManager.white,
                            fontFamily: FontManager.montserratBold,
                            fontSize: size.height * 0.038,
                          ),
                        ),
                        Text(
                          intl.info_home_header,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ThemeManager.white,
                            fontFamily: FontManager.montserratMedium,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView.builder(
                      itemCount: widget.homeController.listCompanies.length,
                      itemBuilder: (context, index) {
                        final company =
                            widget.homeController.listCompanies[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            right: size.width * 0.04,
                            bottom: size.height * 0.026,
                          ),
                          child: GestureDetector(
                            onTap: () => Modular.to.pushNamed(
                              '/home',
                              arguments: {
                                'company': company,
                              },
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.all(size.height * 0.01),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          size.height * 0.01,
                                        ),
                                        color: ThemeManager.white,
                                      ),
                                      child: Icon(
                                        Icons.apartment,
                                        color: ThemeManager.primaryColor,
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Text(
                                      '${company.name} Unit',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ThemeManager.white,
                                        fontFamily:
                                            FontManager.montserratMedium,
                                        fontSize: size.height * 0.028,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ThemeManager.white,
                                  size: size.height * 0.02,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.07),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SvgPicture.asset(
                          ImagesManager.logoTractian,
                          width: size.width * 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
