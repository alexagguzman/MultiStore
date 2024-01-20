import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app_01/views/buyers/auth/register_screen.dart';
import 'package:multi_store_app_01/views/buyers/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBAEh2kLoEp_Na25GE09O52zc7h_4JDx1A",
        appId: "1:980969221214:android:228fa5a3d3f59b88ce18cf",
        messagingSenderId: "980969221214",
        projectId: "multi-store-admin-01-9a5a9",
      storageBucket: "gs://multi-store-admin-01-9a5a9.appspot.com"
    )
  ) : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Brand-Bold',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade900),
        useMaterial3: false,
      ),
      home: RegisterScreen(),//MainScreen(),
    );
  }
}

