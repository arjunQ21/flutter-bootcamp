import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/providers/user_provider.dart';

// screens
import 'package:voting_system/screens/home_screen.dart';
import 'package:voting_system/screens/splash_screen.dart';
// import 'package:voting_system/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MaterialApp(
        title: 'Form Validation',
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(
        //   isAdmin: true,
        // ),
        home: SplashScreen(),
      ),
    );
  }
}
