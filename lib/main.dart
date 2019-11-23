import 'package:flutter/material.dart';
import 'package:bolha_musical/pages/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Bolha(),
    );
  }
}

class Bolha extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
   return MaterialApp(
     initialRoute: '/',
     routes: {
       '/': (context) => Login(),
     },
   );
 }
}
