import 'package:cupidum_app/app/modules/intro/widgets/email_login_input.dart';
import 'package:cupidum_app/app/modules/intro/widgets/password_login_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailLoginInput(controller: _emailController),
          PasswordLoginInput(controller: _passwordController),
        ],
      ),
    );
  }
}
