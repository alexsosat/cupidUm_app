import 'package:cupidum_app/globals/expandable_text.dart';
import 'package:cupidum_app/globals/hobby_pill.dart';
import 'package:flutter/material.dart';

import 'package:cupidum_app/app/models/user/hobby.dart';
import 'package:cupidum_app/app/models/user/school.dart';
import 'package:cupidum_app/utils/colors.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final int edad;
  final School? school;
  final String descripcion;
  final double? peso;
  final String? celular;
  final List<Hobby>? hobbies;
  final bool isFullScreen;
  const UserInfo({
    Key? key,
    required this.name,
    required this.edad,
    this.school,
    required this.descripcion,
    this.peso,
    this.celular,
    this.hobbies,
    this.isFullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
        width: double.infinity,
        height: (isFullScreen) ? deviceHeight * 4 / 7 : deviceHeight * 3 / 6,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            const SizedBox(height: 30),
            Text(
              name,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 5),
            Text(
              edad.toString() + ' Años',
            ),
            const SizedBox(height: 30),
            if (school != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Facultad',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    school!.fullName,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: HexColor.fromHex("E94057").withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          school!.acronym,
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            Text(
              'Sobre mí',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            ExpandableText(descripcion),
            const SizedBox(height: 30),
            if (peso != null)
              Column(
                children: [
                  Text(
                    'Peso',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    peso!.toString() + ' Kg',
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            if (peso != null)
              Column(
                children: [
                  Text(
                    'Celular',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    celular!,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            Text(
              'Intereses',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Wrap(
              direction: Axis.horizontal,
              children: hobbies!
                  .map(
                    (hobby) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HobbyPill(
                          icon: hobby.icon,
                          hobby: hobby.title,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
