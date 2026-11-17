import 'package:contact_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class HomeFabs extends StatelessWidget {
  const HomeFabs({
    super.key,
    required this.contactsCount,
    required this.maxContacts,
    required this.onAdd,
    required this.onDeleteLast,
  });

  final int contactsCount;
  final int maxContacts;
  final VoidCallback onAdd;
  final VoidCallback onDeleteLast;

  @override
  Widget build(BuildContext context) {
    final canDelete = contactsCount > 0;
    final canAdd = contactsCount < maxContacts;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (canDelete)
          FloatingActionButton(
            heroTag: 'delete_last',
            backgroundColor: AppColor.redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: onDeleteLast,
            child: const Icon(Icons.delete, color:AppColor.whiteColor),
          ),
        if (canDelete && canAdd) const SizedBox(height: 12),
        if (canAdd)
          FloatingActionButton(
            heroTag: 'add_contact',
            backgroundColor: AppColor.goldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: onAdd,
            child: const Icon(Icons.add, color: AppColor.darkBlueColor),
          ),
      ],
    );
  }
}