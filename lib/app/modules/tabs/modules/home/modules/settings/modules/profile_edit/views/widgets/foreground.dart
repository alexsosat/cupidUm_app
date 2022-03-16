import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Foreground extends StatelessWidget {
  const Foreground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 350,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Editar",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ),
            const Divider(height: 0),
            ListTile(
              title: const Text(
                "Datos personales",
              ),
              trailing: const Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
              onTap: () => Get.toNamed(Routes.personal_data_edit),
            ),
            ListTile(
              title: const Text(
                "Sobre mi",
              ),
              trailing: const Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
              onTap: () => Get.toNamed(Routes.about_data_edit),
            ),
            const ListTile(
              title: Text(
                "Intereses",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                "Información adicional",
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
              ),
              onTap: () => Get.toNamed(Routes.aditional_data_edit),
            ),
          ],
        ),
      ),
    );
  }
}
