import 'package:flutter/material.dart';
import 'package:maior_chance/generate_game/usercases/selected.dart';
import 'package:maior_chance/widgets/radiobox/radio_option_enum.dart';

// ignore: must_be_immutable
class RadioboxWidgets extends StatefulWidget {
  const RadioboxWidgets({super.key, required this.onClick});

  final Function(Selected) onClick;

  @override
  State<RadioboxWidgets> createState() => _RadioboxWidgetsState();
}

class _RadioboxWidgetsState extends State<RadioboxWidgets> {
  RadioOptionEnum? _radioOptionEnum = RadioOptionEnum.megasena;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Mega sena'),
          contentPadding: EdgeInsets.only(left: 0),
          leading: Radio<RadioOptionEnum>(
            value: RadioOptionEnum.megasena,
            groupValue: _radioOptionEnum,
            onChanged: (RadioOptionEnum? value) {
              setState(() {
                _radioOptionEnum = value;
                widget.onClick(Selected(id: 1, size: 60, limit: 5));
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Lotofácil'),
          contentPadding: EdgeInsets.only(left: 0),
          leading: Radio<RadioOptionEnum>(
            value: RadioOptionEnum.lotofacil,
            groupValue: _radioOptionEnum,
            onChanged: (RadioOptionEnum? value) {
              setState(() {
                _radioOptionEnum = value;
                widget.onClick(Selected(id: 2, size: 25, limit: 14));
              });
            },
          ),
        ),
      ],
    );
  }
}
