import 'package:base_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text("MapScreen"),
      ),
    );
  }
}
