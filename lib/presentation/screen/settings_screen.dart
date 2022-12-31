import 'package:bet_flutter/presentation/config/environment.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          Text(Environment()
              .config
              .apiHosts[Environment().config.apiHostSelected])
        ],
      ),
    );
  }
}
