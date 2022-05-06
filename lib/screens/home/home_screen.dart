import 'package:flutter/material.dart';
import 'package:flutter_ipssi_chat/common/loading.dart';
import 'package:flutter_ipssi_chat/models/user.dart';
import 'package:flutter_ipssi_chat/screens/home/user_list.dart';
import 'package:flutter_ipssi_chat/services/authentication.dart';
import 'package:flutter_ipssi_chat/services/database.dart';
import 'package:flutter_ipssi_chat/services/notification_service.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    NotificationService.initialize();
    final user = Provider.of<AppUser?>(context);
    if (user == null) throw Exception("user not found");
    final database = DatabaseService(user.uid);
    return StreamProvider<List<AppUserData>>.value(
      initialData: [],
      value: database.users,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
          title: const Text('IPSSIChat'),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text('logout', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: UserList(),
      ),
    );
  }
}
