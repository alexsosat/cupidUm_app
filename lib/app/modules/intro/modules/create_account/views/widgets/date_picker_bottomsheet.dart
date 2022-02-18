import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerBottomSheet extends StatelessWidget {
  final Function(DateTime date) onSave;
  const DatePickerBottomSheet({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      showNavigationArrow: true,
      allowViewNavigation: true,
      initialSelectedDate: DateTime.now(),
      maxDate: DateTime.now(),
      headerHeight: 60,
      headerStyle: DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      confirmText: "Guardar",
      cancelText: "Cancelar",
      showActionButtons: true,
      onSubmit: (e) {
        onSave(DateTime.parse(e.toString()));
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }
}
