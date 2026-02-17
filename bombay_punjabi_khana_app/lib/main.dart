// import 'package:flutter/material.dart';
// import 'restaurant_home.dart'; // Hum screen ko alag file mein rakhenge

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Wo red tag hatane ke liye
//       title: 'Bombay Punjabi Khana',
//       theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
//       // Yahan humne apni nayi screen ko call kiya hai
//       home: const RestaurantHome(),
//     );
//   }
// }

// new one

// main.dart
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(), // Wrapper ko home banaya
    );
  }
}
