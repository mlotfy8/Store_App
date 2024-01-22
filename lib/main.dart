import 'package:flutter/material.dart';

import 'Screens/UpdateProductPage.dart';
import 'Screens/home_page.dart';

void main() {
  runApp( Store_App());
}

class Store_App extends StatelessWidget {
  const Store_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        UpdateProductPage.id: (context) => UpdateProductPage(),
        HomePage.id: (context) => HomePage()
      },
    );
  }
}
