import 'package:flutter/material.dart';

class TextfieldWidgets extends StatelessWidget {
  const TextfieldWidgets({
    super.key,
    required this.controller,
    required this.vali,
    required this.hint,
  });

  final TextEditingController controller;
  final String vali;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      validator: (value) {
        if (value!.isEmpty) {
          return vali;
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            ),
          ),
      ),
    );
  }
}
