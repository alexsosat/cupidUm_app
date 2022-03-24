import 'package:flutter/material.dart';

import 'edit_image_picker.dart';

class Background extends StatelessWidget {
  final String image;
  final String name;
  const Background({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              "Editar perfil",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 15),
            UserImageEditPicker(
              image: image,
            ),
          ],
        ),
      ),
    );
  }
}
