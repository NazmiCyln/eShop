import 'package:fake_store_api/services/auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){
              _authService.signOut();
            },
            child: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
    );
  }
}
