import 'package:cupidum_app/utils/colors.dart';
import 'package:flutter/material.dart';

class BackgroundGradientTitle extends StatelessWidget {
  const BackgroundGradientTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            HexColor.fromHex("6D368D"),
            HexColor.fromHex("FD397F"),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: kToolbarHeight + 50),
          Text(
            "CUPIDUM",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 25),
          Text(
            "‘’La pandemia nos separó\nCUPIDUM nos unió’’",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white.withOpacity(0.53),
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ),
    );
  }
}
