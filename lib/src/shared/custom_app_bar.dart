import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    {BuildContext? pageContext,
    GlobalKey<ScaffoldState>? scaffoldKey,
    String title = '',
    bool showBack = false}) {

    IconButton drawerButton = IconButton(
      onPressed: () {
        if (scaffoldKey != null) {
          scaffoldKey.currentState?.openDrawer();
        }
      },
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 30,
      ));

  return AppBar(
    backgroundColor: Colors.indigo,
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold),
    ),
    leading: drawerButton,
  );
}
