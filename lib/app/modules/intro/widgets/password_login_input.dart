import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordLoginInput extends StatefulWidget {
  final TextEditingController controller;
  const PasswordLoginInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordLoginInput> createState() => _PasswordLoginInputState();
}

class _PasswordLoginInputState extends State<PasswordLoginInput> {
  bool _isPasswordVisible = false;
  IconData suffixIcon = Icons.visibility_outlined;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: widget.controller,
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
          hintText: "Contraseña",
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
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
