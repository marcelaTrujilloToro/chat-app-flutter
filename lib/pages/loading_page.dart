// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/users_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          return const Center(
            child: Text('Espere...'),
          );
        },
        future: checkLoginState(context),
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final authenticated = await authService.isLoggedIn();

    if (authenticated) {
      // Navigator.pushReplacementNamed(context, 'users');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 0),
            pageBuilder: (_, __, ___) => const UsersPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 0),
            pageBuilder: (_, __, ___) => const LoginPage()),
      );
    }
  }
}
