import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundOutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final int maxLines;
  final List<TextInputFormatter>? formatters;

  const RoundOutlinedTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
    this.hintText,
    this.inputAction,
    this.inputType,
    this.formatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Favor de llenar este campo";
          }
          return null;
        },
        textInputAction: inputAction,
        keyboardType: inputType,
        maxLines: maxLines,
        inputFormatters: formatters,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: HexColor.fromHex("E8E6EA"),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
