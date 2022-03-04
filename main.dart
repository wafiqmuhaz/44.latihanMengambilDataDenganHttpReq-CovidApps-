import 'package:covid/pages/home.dart';
import "package:flutter/material.dart";

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: homePage.root,
      routes: {
        homePage.root: (context) => homePage(),
      }
    );
  }
}
