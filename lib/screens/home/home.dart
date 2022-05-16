import 'package:blind_side/globals/settings/router/utils/router_utils.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_PAGE.home.routePageTitle)),
      body: const Center(child: Text("Home Page")),
    );
  }
}
