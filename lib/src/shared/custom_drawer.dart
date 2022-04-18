import 'package:flutter/material.dart';

Widget customDrawer({BuildContext? pageContext}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'JakWisata',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text(
                'Ver 1.0',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          decoration: const BoxDecoration(color: Colors.indigo),
        ),
        ListTile(
          leading: const Icon(
            Icons.house,
            color: Colors.black,
          ),
          title: const Text('Beranda', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/beranda');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.next_week,
            color: Colors.black,
          ),
          title: const Text('Objek Wisata', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/objekwisata');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.refresh,
            color: Colors.black,
          ),
          title: const Text('Refresh', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/preload');
          },
        )
      ],
    ),
  );
}
