import 'package:cupidum_app/globals/buttons/select_button_list/selectable_button.dart';
import 'package:flutter/material.dart';

import 'selectable_item.dart';

class SelectableButtonList extends StatefulWidget {
  final List<SelectableItem> options;
  final Function(dynamic value) onChange;
  const SelectableButtonList({
    Key? key,
    required this.options,
    required this.onChange,
  }) : super(key: key);

  @override
  State<SelectableButtonList> createState() => _SelectableButtonListState();
}

class _SelectableButtonListState extends State<SelectableButtonList> {
  int? selectedButton;

  _buildButtons() {
    List<Widget> returnable = List<Widget>.empty(growable: true);
    for (int i = 0; i < widget.options.length; i++) {
      returnable.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: SelectableButton(
            child: Text(widget.options[i].title),
            isActive: selectedButton != null ? selectedButton == i : false,
            onPressed: () {
              setState(() {
                selectedButton = i;
                widget.onChange(widget.options[i].value);
              });
            },
          ),
        ),
      );
    }

    return returnable;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildButtons(),
    );
  }
}
