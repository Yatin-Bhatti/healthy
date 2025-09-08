import 'package:flutter/material.dart';

class LanguageSubScreen extends StatelessWidget {
  const LanguageSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language'), centerTitle: true),
      body: const Center(
        child: Text('Welcome to Language!', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
