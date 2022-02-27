import 'package:cupidum_app/app/modules/intro/modules/create_account/controllers/create_user_controller.dart';
import 'package:cupidum_app/app/modules/intro/modules/create_account/views/widgets/date_picker_bottomsheet.dart';
import 'package:cupidum_app/globals/overlays/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({Key? key}) : super(key: key);

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime? _bornDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: () => openBottomSheet(
          DatePickerBottomSheet(
            onSave: (date) => setState(() {
              Get.find<CreateUserController>().setBornDate(date);
              _bornDate = date;
            }),
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.15),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // <-- Radius
          ),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.date_range_rounded),
            ),
            Text(
              _bornDate != null
                  ? DateFormat('MMMM dd, yyyy').format(_bornDate!)
                  : "Fecha de nacimiento",
            ),
          ],
        ),
      ),
    );
  }
}
