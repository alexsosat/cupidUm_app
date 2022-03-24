import 'package:cupidum_app/app/modules/intro/controllers/authentication_controller.dart';
import 'package:cupidum_app/app/modules/tabs/modules/account/views/widgets/datos_de_usuario.dart';
import 'package:cupidum_app/app/modules/tabs/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AccountView extends GetView<HomeController> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: controller.obx((e)=>Stack(
        
        fit: StackFit.expand,
        children: [

          Informacion(
            name: controller.user!.name,
            edad:controller.user!.age,
            descripcion:controller.user!.description,
            peso:controller.user!.weight,
            celular:controller.user!.phone,
            ),
        ],
      ),
      onError: (error) => controller.internetPage(error),
      ),
    );
  }
}
