import 'package:flutter/material.dart';

class ForeGroundSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget form;
  const ForeGroundSection({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 275,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline3,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.grey, padding: const EdgeInsets.all(0)),
                onPressed: () {},
                child: Text(
                  subtitle,
                ),
              ),
              form,
            ],
          ),
        ),
      ),
    );
  }
}
