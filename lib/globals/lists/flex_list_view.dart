import 'package:flutter/material.dart';

class FlexListView extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  const FlexListView({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.physics,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: physics,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        )
      ],
    );
  }
}
