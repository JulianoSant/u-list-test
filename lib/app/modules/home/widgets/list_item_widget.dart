import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final String createdAt;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  const ListItemWidget({
    super.key,
    required this.title,
    required this.createdAt,
    required this.onRemove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('Created at: $createdAt'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onRemove,
      ),
      onTap: onTap,
    );
  }
}
