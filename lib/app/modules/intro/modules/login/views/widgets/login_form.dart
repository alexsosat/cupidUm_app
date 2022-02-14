import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(debugLabel: '_LoginFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Correo",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Get.theme.colorScheme.primary),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Favor de llenar este campo";
              } else if (GetUtils.isEmail(value)) {
                return "Favor de ingresar un correo válido";
              }
              return null;
            },
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
