import 'package:flutter/material.dart';
import 'package:storeapp/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.keyboard,
    required this.onTapped,
    required this.forRead,
  });
  final String text;
  final TextInputType? keyboard;
  final bool forRead;
  final Function(String) onTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: (data) {
          if (forRead == false && data!.isEmpty) {
            return 'Required Field';
          }
          return null;
        },
        keyboardType: keyboard,
        readOnly: forRead,
        onChanged: onTapped,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: const BorderSide(
        color: kPrimaryColor,
      ),
    );
  }
}
