import 'package:flutter/material.dart';
import 'package:flutter_music_appl/pages/my_settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //home tile
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: ListTile(
              title: const Text(
                "H O M E",
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(
                Icons.home,
                size: 40,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),

          //SETTINGS TILE
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: ListTile(
              title: const Text(
                "S E T T I N G S",
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(
                Icons.settings,
                size: 40,
              ),
              onTap: () {
                Navigator.of(context);

                //naviagte to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySettings(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
