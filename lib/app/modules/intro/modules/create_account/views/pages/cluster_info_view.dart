import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/cluster_question.dart';
import 'package:cupidum_app/globals/buttons/pill_button.dart';
import 'package:cupidum_app/globals/lists/flex_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/create_user_controller.dart';
import '../widgets/create_appbar.dart';

class ClusterInfoView extends GetView<CreateUserController> {
  const ClusterInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CreateUserAppBar(
          showLeading: true,
          onNext: () => controller.saveClusterData(),
        ),
      ),
      body: FlexListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        children: [
          Text(
            "Preguntas",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 35),
          ClusterQuestion(
            question: "¿Qué tan religios@ eres?",
            hint: "1 -> No tanto\n5 -> Mucho",
            onChange: (val) => controller.clusterForm.religion = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Crees que las relaciones a distancia pueden funcionar?",
            hint: "1 -> Muy en Desacuerdo\n5 -> Totalmente de Acuerdo",
            onChange: (val) => controller.clusterForm.distance = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question:
                "¿Hablas de tus problemas personales con tus amigos cercanos?",
            hint: "1 -> Nunca\n5 -> Siempre",
            onChange: (val) => controller.clusterForm.personal = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Eres propenso a tomar decisiones impulsivas?",
            hint: "1 -> Nunca\n5 -> Siempre",
            onChange: (val) => controller.clusterForm.impulsive = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Quiéres casarte?",
            hint: "1 -> Muy en Desacuerdo\n5 -> Totalmente en Acuerdo",
            onChange: (val) => controller.clusterForm.marry = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Crees en los horóscopos y signos del zodiaco?",
            hint: "1 -> Muy en Desacuerdo\n5 -> Totalmente en Acuerdo",
            onChange: (val) => controller.clusterForm.zodiac = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Qué tan consciente eres de tu salud?",
            hint: "1 -> Nada\n5 -> Mucho",
            onChange: (val) => controller.clusterForm.health = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Te gusta hablar sobre tus problemas?",
            hint: "1 -> Nunca\n5 -> Siempre",
            onChange: (val) => controller.clusterForm.problems = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Tu ego te impide disculparte cuando te equivocas?",
            hint: "1 -> Nunca\n5 -> Siempre",
            onChange: (val) => controller.clusterForm.ego = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question:
                "¿Cómo resuelves los problemas con tus amigos/familiares?",
            hint:
                "1 -> Dialogando\n2 -> Violencia\n3 -> Gritando\n4 -> Pidiendo ayuda\n5 -> Internalizando tus problemas",
            onChange: (val) => controller.clusterForm.family = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Con qué tipo de personalidad te identificas?",
            hint:
                "1 -> Tipo A (Orientad@ a objetivos, Buen@ bajo estrés)\n2 -> Tipo B (orientad@ a las relaciones, entusiasta)\n3 -> Tipo C (orientad@ a los detalles, preparad@)\n4 -> Tipo D (Orientad@ a tareas, cautelos@)\n5 -> Combinación de 2 o más tipos",
            onChange: (val) => controller.clusterForm.personality = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Haces ejercicio?",
            hint: "1 -> Nunca\n5 -> Siempre",
            onChange: (val) => controller.clusterForm.gym = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question:
                "Si no estoy de acuerdo contigo en algunos temas, ¿cómo te sientes?",
            hint:
                "1 -> Me siento mal\n2 -> A veces me afecta\n3 -> Neutral\n4 -> Se me pasa después de un tiempo\n5 -> Ni me topa",
            onChange: (val) => controller.clusterForm.agree = val.toInt(),
          ),
          const SizedBox(height: 20),
          ClusterQuestion(
            question: "¿Prefieres ver películas o leer libros?",
            hint:
                "1 -> Películas\n2 -> Más ver películas que leer\n3 -> Ambos\n4 -> Más leer que ver películas	\n5 -> Leer",
            onChange: (val) => controller.clusterForm.movies = val.toInt(),
          ),
          const SizedBox(height: 40),
          const Expanded(child: SizedBox()),
          PillButton(
            child: const Text("GUARDAR"),
            onPressed: () => controller.saveClusterData(),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
