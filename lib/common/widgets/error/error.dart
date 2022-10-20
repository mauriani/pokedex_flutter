import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key, this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error ?? 'Ocorreu um erro, tente novamente!')),
    );
  }
}
