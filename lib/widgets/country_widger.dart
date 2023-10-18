import 'package:flutter/material.dart';

class CountryWidget extends StatefulWidget {
  CountryWidget({super.key, required this.isChecked});
  bool isChecked = false;

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.isChecked,
        onChanged: (value) {},
      ),
      title: const Icon(Icons.flag),
      trailing: const Text('Country Name'),
    );
  }
}
