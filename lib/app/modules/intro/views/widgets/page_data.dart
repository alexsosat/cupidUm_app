import 'package:flutter/material.dart';

class PageData extends StatelessWidget {
  final List<Color> colorGradient;
  final String? imageRoute;
  final String title;
  final String? subtitle;
  final String body;

  const PageData({
    Key? key,
    required this.colorGradient,
    required this.title,
    required this.body,
    this.subtitle,
    this.imageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: colorGradient,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (imageRoute != null)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Image.asset(
                      imageRoute!,
                      height: 210,
                    ),
                  )
                : const SizedBox(
                    height: 270,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white.withOpacity(0.53),
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                body,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
