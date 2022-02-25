import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:flutter/material.dart';

class ForeGroundSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget form;
  final GlobalKey<FormState> formKey;
  final String submitButtonText;
  final bool showRecoverPassword;
  final Function() onSubmit;

  const ForeGroundSection({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.form,
    required this.formKey,
    required this.submitButtonText,
    required this.onSubmit,
    this.showRecoverPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: deviceHeight * 2 / 3,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: FlexListView(
            scrollPhysics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(35.0),
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
              form,
              SizedBox(height: deviceHeight * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PillButton(
                      child: Text(submitButtonText),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          onSubmit();
                        }
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
