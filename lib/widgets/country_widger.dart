import 'package:flutter/material.dart';
import 'package:location_widget/state/user_view_mode.dart';
import 'package:provider/provider.dart';

class CountryWidget extends StatefulWidget {
  CountryWidget({super.key, required this.isChecked, required this.country});
  bool isChecked;
  String country;

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isChecked,
          onChanged: (value) {
            Provider.of<UserViewModel>(context, listen: false).toggleCheckBox();
          },
        ),
        const Icon(Icons.flag),
        Text(widget.country),
      ],
    );
  }
}
