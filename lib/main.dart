import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import 'package:provider/provider.dart';
import './providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SIMPTODO',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
