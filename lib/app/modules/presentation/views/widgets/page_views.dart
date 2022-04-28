import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controllers/presentation_controller.dart';
import 'page_data.dart';

/// The intro screens the user has to see
class PageViews extends GetView<PresentationController> {
  const PageViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      onPageChanged: (index) => controller.currentPageIndex(index),
      children: [
        PageData(
          imageRoute: "assets/images/icon-1.png",
          title: "Hola",
          subtitle: '"La pandemia nos separó\nCUPIDUM nos unió"',
          body:
              "Te damos la bienvenida a Cupidum, la nueva forma de conocer gente dentro de la universidad.",
          colorGradient: [
            HexColor.fromHex("481380"),
            HexColor.fromHex("F688BB"),
          ],
        ),
        PageData(
          imageRoute: "assets/images/icon-2.png",
          title: "¿Quiénes somos?",
          body:
              "Cupidum es una aplicación creada especialmente para tí donde podrás encontrar nuevos amigos para charlar un buen rato y ¿Por qué no? tu media naranja.",
          colorGradient: [
            HexColor.fromHex("FD397F"),
            HexColor.fromHex("6D368D"),
          ],
        ),
        PageData(
          imageRoute: "assets/images/icon-3.png",
          title: "Recuerda",
          body:
              "Queremos crear la mejor comunidad, Respeta a todas las personas que conozcas y no olvides divertirte.",
          colorGradient: [
            HexColor.fromHex("801341"),
            HexColor.fromHex("A739FD"),
          ],
        ),
      ],
    );
  }
}
