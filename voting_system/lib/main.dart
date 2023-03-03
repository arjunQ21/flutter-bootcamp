import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/providers/user_provider.dart';
import 'package:voting_system/providers/voting_provider.dart';
import 'package:voting_system/screens/splash_screen.dart';
import 'package:voting_system/screens/verify_otp_page.dart';
import 'package:voting_system/utils/constants.dart';

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
        ChangeNotifierProvider(create: (context) => VotingProvider()),
      ],
      child: MaterialApp(
        title: 'Form Validation',
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(
        //   isAdmin: true,
        // ),
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
