import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/create_appbar.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/date_picker_button.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/image_picker.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/round_outlined_textfields.dart';
import 'package:cupidum_app/globals/pill_button.dart';
import 'package:flutter/material.dart';

class MainInfoView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  MainInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: CreateUserAppBar(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        children: [
          Text(
            "Perfil",
            style: Theme.of(context).textTheme.headline2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: UserImagePicker(),
          ),
          RoundOutlinedTextField(
            controller: _controller,
            labelText: "Nombre",
            hintText: "Ej. Javier",
          ),
          RoundOutlinedTextField(
            controller: _controller,
            labelText: "Apellidos",
            hintText: "Ej. Ramon Gonzalez",
          ),
          const DatePickerButton(),
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: PillButton(child: const Text("GUARDAR"), onPressed: () {}),
          )
        ],
      ),
    );
  }
}