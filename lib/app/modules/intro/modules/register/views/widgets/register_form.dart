import 'package:cupidum_app/app/modules/intro/modules/register/views/widgets/confirm_password_input.dart';
import 'package:cupidum_app/app/modules/intro/widgets/email_login_input.dart';
import 'package:cupidum_app/app/modules/intro/widgets/password_login_input.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegisterForm({
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
          ConfirmPasswordInput(
            confirmController: _confirmPasswordController,
            passwordController: _passwordController,
          ),
        ],
      ),
    );
  }
}
