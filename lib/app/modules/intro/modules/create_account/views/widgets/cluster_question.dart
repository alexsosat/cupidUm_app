import 'package:flutter/material.dart';

import 'package:cupidum_app/globals/overlays/dialog_overlay.dart';

class ClusterQuestion extends StatefulWidget {
  final String question;
  final String hint;
  final Function(double) onChange;

  const ClusterQuestion({
    Key? key,
    required this.question,
    required this.hint,
    required this.onChange,
  }) : super(key: key);

  @override
  State<ClusterQuestion> createState() => _ClusterQuestionState();
}

class _ClusterQuestionState extends State<ClusterQuestion> {
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                widget.question,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            InkWell(
              onTap: () =>
                  openDialogWindow(title: "Ayuda", message: widget.hint),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Slider(
              min: 1.0,
              max: 5.0,
              value: _value,
              divisions: 4,
              label: '${_value.round()}',
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
                widget.onChange(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
