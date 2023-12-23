import 'package:flutter/material.dart';

class SuitmediaAppBar extends AppBar {
  SuitmediaAppBar({super.key, required this.appbarTitle});
  final String appbarTitle;
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          const Icon(Icons.arrow_back_ios, color: Color(0xFF554AF0), size: 24),
      title: Text(
        appbarTitle,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
    );
  }
}
