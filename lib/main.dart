import 'package:flutter/material.dart';
import 'package:obang/pages/splash_page.dart';

void main() {
  var app = MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: const SplashPage(),
  );
  runApp(app);
}
