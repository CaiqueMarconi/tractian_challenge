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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Remove a linha separadora
        splashColor: Colors.transparent, // Remove efeito ao clicar
        highlightColor: Colors.transparent, // Remove efeito de destaque
      ),
      child: ExpansionTile(
        title: Text('Main ExpansionTile'),
        leading: Icon(Icons.expand_more), // Seta à esquerda
        trailing: SizedBox.shrink(), // Remove seta à direita
        children: [
          ExpansionTile(
            title: Text('Sub ExpansionTile 1'),
            leading: Icon(Icons.expand_more),
            trailing: SizedBox.shrink(),
            children: [
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
            ],
          ),
          ExpansionTile(
            title: Text('Sub ExpansionTile 2'),
            leading: Icon(Icons.expand_more),
            trailing: SizedBox.shrink(),
            children: [
              ListTile(title: Text('Item 3')),
              ListTile(title: Text('Item 4')),
            ],
          ),
        ],
      ),
    ));
  }
}
