import 'package:contact_app/core/theme/app_color.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/screens/home/widgets/add_contact_sheet.dart';
import 'package:contact_app/screens/home/widgets/contacts_grid.dart';
import 'package:contact_app/screens/home/widgets/empty_state.dart';
import 'package:contact_app/screens/home/widgets/home_fabs.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int maxContacts = 6;

  final List<ContactModel> contacts = [];

  Future<void> addContact() async {
    final contact = await AddContactSheet.show(context);
    if (contact == null || !mounted) return;
    setState(() => contacts.add(contact));
  }

  void deleteContact(int index) {
    setState(() => contacts.removeAt(index));
  }

  void deleteLastContact() {
    setState(() => contacts.removeLast());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlueColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.darkBlueColor,
        title: Image.asset('assets/images/route.png', height: 40),
      ),
      body: contacts.isEmpty
          ? const Center(child: EmptyState())
          : ContactsGrid(contacts: contacts, onDelete: deleteContact),
      floatingActionButton: HomeFabs(
        contactsCount: contacts.length,
        maxContacts: maxContacts,
        onAdd: addContact,
        onDeleteLast: deleteLastContact,
      ),
    );
  }
}