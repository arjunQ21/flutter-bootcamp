import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      if (!userProvider.isLoggedIn()) {
        return const Center(
          child: Text("Please Login First"),
        );
      }

      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userProvider.user!.name),
            Text(userProvider.user!.email),
            Text(userProvider.user!.phone),
            TextButton(
              onPressed: () {
                userProvider.logout(context);
              },
              child: Text("logout"),
            ),
          ],
        ),
      );
    });
  }
}
