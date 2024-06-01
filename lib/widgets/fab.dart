// ignore: file_names
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final void Function() onPressed;

  const CustomFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
