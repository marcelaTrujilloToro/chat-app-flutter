// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/helpers/show_alert.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(
                  title: 'Messenger',
                ),
                _Form(),
                Labels(
                  title: '¿No tienes cuenta?',
                  subTitle: '¡Crea una ahora!',
                  routeToNavigate: 'register',
                ),
                Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline_rounded,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
          ),
          CustomInput(
            icon: Icons.lock_outline_rounded,
            placeholder: 'Password',
            textController: passController,
            isPassword: true,
          ),
          BtnBlue(
            label: 'Log-in',
            onPressed: authService.authenticating
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    final loginOk = await authService.login(
                      emailController.text.trim(),
                      passController.text.trim(),
                    );

                    if (loginOk) {
                      Navigator.pushReplacementNamed(context, 'users');
                    } else {
                      showAlert(
                        context: context,
                        title: 'Login incorrecto',
                        subtitle: 'Revise sus credenciales',
                      );
                    }
                  },
          )
        ],
      ),
    );
  }
}
