import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckboxWidgets extends StatefulWidget {
  CheckboxWidgets({super.key, required this.onClick, this.isChecked = false});

  final Function(bool) onClick;
  bool isChecked;

  @override
  State<CheckboxWidgets> createState() => _CheckboxWidgetsState();
}

class _CheckboxWidgetsState extends State<CheckboxWidgets> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      activeColor: Colors.grey,
      value: widget.isChecked,
      onChanged: (bool? value) {
        setState(() {
          widget.isChecked = value!;
          widget.onClick(value);
        });
      },
    );
  }
}
