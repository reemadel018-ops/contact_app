import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/screens/home/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class ContactsGrid extends StatelessWidget {
  const ContactsGrid({
    super.key,
    required this.contacts,
    required this.onDelete,
  });

  final List<ContactModel> contacts;
  final void Function(int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 160),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 300,
      ),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactCard(
          contact: contacts[index],
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}