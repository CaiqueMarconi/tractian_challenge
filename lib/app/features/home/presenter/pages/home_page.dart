import 'package:flutter/material.dart';
import 'package:model/app/features/home/presenter/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({super.key, required this.homeController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.getLocation();
    widget.homeController.getAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.homeController.listLocation.length,
        itemBuilder: (context, index) {
          final location = widget.homeController.listLocation[index];

          return Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ListTileTheme(
              data: const ListTileThemeData(
                horizontalTitleGap: 0,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
              ),
              child: ExpansionTile(
                controlAffinity: ListTileControlAffinity.leading,
                tilePadding: const EdgeInsets.symmetric(vertical: 6),
                visualDensity: VisualDensity.compact,
                childrenPadding:
                    const EdgeInsets.only(left: 16, top: 6, bottom: 6),
                dense: false,
                title: Text(location.name),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: location.locationChildren?.length,
                    itemBuilder: (context, index) {
                      final childNode = location.locationChildren?[index];
                      return Text(childNode!.name);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
