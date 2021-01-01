import 'package:flutter/material.dart';
import 'package:movas_example/movas/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = <T>(T value) {
  //   return true;
  // };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: router.initialRoute,
      routes: router.calculateAllRoutes,
    );
  }
}
