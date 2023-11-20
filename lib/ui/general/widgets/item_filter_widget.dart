import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/general/colors.dart';

class ItemFilterWidgets extends StatelessWidget {
  String text;
  bool isSelected;
  ItemFilterWidgets({
    required this.text,
    required this.isSelected,
  });

  get kBrandPrimaryColors => null;

  get kBrandSecondaryColors => null;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: Chip(
          backgroundColor: isSelected ? Colors.white : kBrandSecondaryColors,
          labelStyle: TextStyle(
            color: isSelected ? kBrandPrimaryColors : Colors.white,
          ),
          label: Text(text),
        ));
  }
}
