import 'dart:convert';

import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Foreground extends StatelessWidget {
  const Foreground({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: (MediaQuery.of(context).size.height / 3) - 50,
        right: 10,
        left: 10,
        bottom: 50,
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 2),
              )
            ]),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: MemoryImage(base64Decode(image)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(name),
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Ajustes de la cuenta",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ),
            ListTile(
              title: const Text(
                "Editar perfil",
              ),
              trailing: const Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
              onTap: () => Get.toNamed(
                Routes.profile_edit,
                arguments: {
                  "name": name,
                  "image": image,
                },
              ),
            ),
            const ListTile(
              title: Text(
                "Cambiar contraseña",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text(
                "Bloqueados",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text(
                "¿Qué buscas?",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text(
                "Notificaciones",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text(
                "Tema",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Más",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ),
            const ListTile(
              title: Text(
                "Sobre nosotros",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text(
                "Política de privacidad",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text(
                "Términos y condiciones",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                "Eliminar cuenta",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.red,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
