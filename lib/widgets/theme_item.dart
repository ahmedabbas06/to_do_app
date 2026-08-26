import 'package:flutter/material.dart';

class ThemeItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final bool groupValue;
  final ValueChanged<bool?> onChanged;

  const ThemeItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: Colors.deepPurpleAccent,
              size: 27,
            ),
          ),

          SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),

          Radio<bool>(
            value: value,
            groupValue: groupValue,
            activeColor: Colors.deepPurpleAccent,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}