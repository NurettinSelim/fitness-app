import 'package:flutter/material.dart';
import 'package:fitness_app/core/services/auth_service.dart';
import 'package:fitness_app/core/utils/text_config.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _user = AuthService().user;

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const Scaffold();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(TextConfig.appName),
          actions: [
            IconButton(
              onPressed: () async {
                AuthService().signOut(context);
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            const Text("Home Page"),
            const SizedBox(height: 8),
            Text("UID: ${_user!.uid}"),
            Text("Email: ${_user!.email ?? "user has no email"}"),
          ],
        ),
      );
    }
  }
}
