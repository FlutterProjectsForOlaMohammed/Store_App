import 'package:flutter/material.dart';
import 'package:storeapp/constants.dart';

class SelectLanguageDropBox extends StatelessWidget {
  const SelectLanguageDropBox({
    super.key,
    required this.droppedValue,
    required this.onChanged,
  });

  final String droppedValue;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 180,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffD0AB99),
                kPrimaryColor,
              ]),
          borderRadius: BorderRadius.circular(3),
        ),
        child: DropdownButton<String>(
            alignment: AlignmentDirectional.center,
            isDense: true,
            isExpanded: true,
            padding: const EdgeInsets.all(16),
            iconSize: 35,
            underline: Container(),
            dropdownColor: const Color(0xffD0AB99),
            iconDisabledColor: Colors.black,
            iconEnabledColor: Colors.black,
            style: const TextStyle(
              fontSize: 24,
            ),
            value: droppedValue,
            items: languages.map((i) {
              return DropdownMenuItem(
                value: i,
                child: Text(
                  i,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: onChanged),
      ),
    );
  }
}
