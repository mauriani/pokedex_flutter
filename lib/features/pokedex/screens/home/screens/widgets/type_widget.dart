import 'package:flutter/material.dart';

class TypeyWidget extends StatelessWidget {
  const TypeyWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          )),
    );
  }
}
