import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final ValueChanged<bool?>? onChanged;
  final bool showEdit;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
    this.onEdit,
    this.onDelete,
    this.onChanged,
    this.showEdit = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),

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

      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),

        leading: Checkbox(
          activeColor: Colors.deepPurpleAccent,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),

          value: isCompleted,

          onChanged: onChanged,
        ),

        title: Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
            decoration: isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),

        subtitle: Padding(
          padding: EdgeInsets.only(top: 5),

          child: Text(
            description,
            style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .onSurfaceVariant,
              fontSize: 14,
            ),
          ),
        ),

        trailing: PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: Theme.of(context)
                .colorScheme
                .onSurfaceVariant,
          ),

          itemBuilder: (BuildContext context) {

            return [
              if (showEdit == true)
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      color: Colors.deepPurpleAccent,
                    ),
                    SizedBox(width: 10),
                    Text("Edit"),
                  ],
                ),
              ),

              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text("Delete"),
                  ],
                ),
              ),

            ];
          },

          onSelected: (value) {
            if (value == 1 && onEdit != null) {
              onEdit!();
            }

            if (value == 2 && onDelete != null) {
              onDelete!();
            }
          },
        ),
      ),
    );
  }
}