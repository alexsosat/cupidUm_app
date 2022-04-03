import 'package:flutter/material.dart';
import 'package:flutter_icons_helper/flutter_icons_helper.dart';

class HobbyPill extends StatelessWidget {
  final String icon;
  final String hobby;

  HobbyPill({
    Key? key,
    required this.icon,
    required this.hobby,
  }) : super(key: key);

  final IconHelper _iconHelper = IconHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _iconHelper.getIconByName(icon),
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 5),
          Text(
            hobby,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
