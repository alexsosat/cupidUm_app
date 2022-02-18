import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailLoginInput extends StatelessWidget {
  final TextEditingController controller;
  const EmailLoginInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
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
          } else if (!GetUtils.isEmail(value)) {
            return "Favor de ingresar un correo válido";
          } else if(!value.contains("@alumno.um.edu.mx")){
            return "Favor de ingresar con tu correo institucional";
          }

          return null;
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
