import 'package:flutter/material.dart';
import 'package:flutter_ipssi_chat/models/user.dart';
import 'package:flutter_ipssi_chat/screens/authenticate/authenticate_screen.dart';
import 'package:flutter_ipssi_chat/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return const AuthenticateScreen();
    } else {
      return HomeScreen();
    }
  }
}
