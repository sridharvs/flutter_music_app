import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_appl/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("S E T T I N G S"),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(20), margin: const EdgeInsets.all(20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //dark  mode
          const Text(
            "Drak Mode",
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          //switch for color mode setting
          CupertinoSwitch(
            value: Provider.of<ThemeProvider>(
              context,
              listen: false,
            ).isDrakMode,
            onChanged: (value) => Provider.of<ThemeProvider>(
              context,
              listen: false,
            ).toggleTheme(),
          ),
        ]),
      ),
    );
  }
}
