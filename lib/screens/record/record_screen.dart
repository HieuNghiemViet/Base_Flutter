import 'package:base_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Text("RecordScreen"),
      ),
    );
  }
}
