import 'package:flutter/material.dart';

AppBar categoryAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    backgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}