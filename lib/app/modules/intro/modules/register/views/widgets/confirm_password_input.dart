import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPasswordInput extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmController;
  const ConfirmPasswordInput({
    Key? key,
    required this.passwordController,
    required this.confirmController,
  }) : super(key: key);

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  bool _isPasswordVisible = false;
  IconData suffixIcon = Icons.visibility_outlined;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: widget.confirmController,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _isPasswordVisible = !_isPasswordVisible;
              suffixIcon = _isPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined;
            }),
            icon: Icon(
              suffixIcon,
              color: Colors.black,
            ),
          ),
          hintText: "Confirmar contraseña",
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
          } else if (widget.passwordController.text !=
              widget.confirmController.text) {
            return "Las contraseñas no coinciden";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
