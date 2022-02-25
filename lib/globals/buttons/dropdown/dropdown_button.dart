import 'package:cupidum_app/globals/buttons/dropdown/dropdown_item.dart';
import 'package:flutter/material.dart';

class DropDownButtonOutlined extends StatefulWidget {
  final Function(DropDownItem selectedValue) onChange;
  final List<DropDownItem> values;
  final String hintText;
  const DropDownButtonOutlined({
    Key? key,
    required this.onChange,
    required this.values,
    required this.hintText,
  }) : super(key: key);

  @override
  State<DropDownButtonOutlined> createState() => _DropDownButtonOutlinedState();
}

class _DropDownButtonOutlinedState extends State<DropDownButtonOutlined> {
  int? selectedIndex;

  List<DropdownMenuItem<int>> _buildTiles() {
    List<DropdownMenuItem<int>> returnable =
        List<DropdownMenuItem<int>>.empty(growable: true);
    for (int i = 0; i < widget.values.length; i++) {
      returnable.add(
        DropdownMenuItem<int>(
          value: i,
          child: Text(widget.values[i].title),
        ),
      );
    }

    return returnable;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            spreadRadius: 0,
            blurRadius: 14,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedIndex,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          hint: Text(
            widget.hintText,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).hintColor),
          ),
          onChanged: (int? newValue) {
            setState(() {
              selectedIndex = newValue!;
              widget.onChange(widget.values[newValue]);
            });
          },
          items: _buildTiles(),
        ),
      ),
    );
  }
}
