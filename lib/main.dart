import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/Screens/home.dart';

Future<void> main() async {
  //makes the status bar the same color as the app bar
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.black),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
