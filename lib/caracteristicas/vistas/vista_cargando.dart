import 'package:flutter/material.dart';

class VistaCargando extends StatelessWidget {
  const VistaCargando({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
