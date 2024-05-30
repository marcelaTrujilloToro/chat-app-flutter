// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/helpers/show_alert.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  title: 'Register',
                ),
                _Form(),
                Labels(
                  title: '¿Ya tienes cuenta?',
                  subTitle: '¡Ingresa ahora!',
                  routeToNavigate: 'login',
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
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity_rounded,
            placeholder: 'Name',
            textController: nameController,
          ),
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
            label: 'Register',
            onPressed: authService.authenticating
                ? null
                : () async {
                    final registerOk = await authService.register(
                        emailController.text.trim(),
                        passController.text.trim(),
                        nameController.text.trim());

                    if (registerOk == true) {
                      Navigator.pushReplacementNamed(context, 'users');
                    } else {
                      showAlert(
                          context: context,
                          title: 'Registro incorrecto ',
                          subtitle: registerOk);
                    }
                  },
          )
        ],
      ),
    );
  }
}
