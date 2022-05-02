import 'dart:convert';

import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/modules/settings/views/widgets/change_password.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:cupidum_app/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Foreground extends StatelessWidget {
  const Foreground({Key? key, required this.user}) : super(key: key);
  final User user;

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
                    image: MemoryImage(base64Decode(user.image)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(user.fullName),
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
                arguments: {"user": user},
              ),
            ),
            ListTile(
                title: const Text(
                  "Cambiar contraseña",
                ),
                trailing: const Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.black,
                ),
                onTap: () => changePassword()),
            /*const ListTile(
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
            ),*/
            const Divider(),
            ListTile(
              title: Text(
                "Más",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ),
            /*const ListTile(
              title: Text(
                "Sobre nosotros",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),*/
            ListTile(
              title: const Text(
                "Política de privacidad",
              ),
              trailing: const Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
              onTap: () =>
                  openUrl('http://cupidum.tk/Politicas%20de%20privacidad.html'),
            ),
            ListTile(
              title: const Text(
                "Términos y condiciones",
              ),
              trailing: const Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
              onTap: () =>
                  openUrl('http://cupidum.tk/Terminos%20y%20condiciones.html'),
            ),
            ListTile(
              title: Text(
                "Cerrar Sesión",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.red,
                    ),
              ),
              onTap: () => Get.find<AuthenticationController>().signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
