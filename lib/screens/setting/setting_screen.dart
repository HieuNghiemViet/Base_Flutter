import 'package:base_flutter/base.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Center(
        child: Text("SettingsScreen"),
      ),
    );
  }
}
