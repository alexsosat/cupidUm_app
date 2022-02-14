import 'package:cupidum_app/globals/pill_button.dart';
import 'package:flutter/material.dart';

class ForeGroundSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget form;
  final GlobalKey<FormState> formKey;
  final String submitButtonText;
  final bool showRecoverPassword;
  const ForeGroundSection({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.form,
    required this.formKey,
    required this.submitButtonText,
    this.showRecoverPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.grey, padding: const EdgeInsets.all(0)),
                  onPressed: () {},
                  child: Text(
                    subtitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: form,
                ),
                PillButton(
                  child: Text(submitButtonText),
                  onPressed: () {
                    formKey.currentState!.validate();
                  },
                ),
                if (showRecoverPassword)
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.grey,
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Restablecer Contraseña",
                      ),
                    ),
                  ),
                const SizedBox(height: 55),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
