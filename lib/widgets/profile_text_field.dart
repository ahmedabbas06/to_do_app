import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),

      decoration: InputDecoration(
        labelText: label,

        prefixIcon: Icon(
          icon,
          color: Colors.deepPurpleAccent,
        ),

        filled: true,

        fillColor: Theme.of(context).colorScheme.surface,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outline
                .withOpacity(0.2),
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .outline
                .withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}