import 'dart:io';

import 'package:contact_app/core/theme/app_color.dart';
import 'package:contact_app/core/utils/validators.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/screens/home/widgets/contact_preview_header.dart';
import 'package:contact_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  static Future<ContactModel?> show(BuildContext context) {
    return showModalBottomSheet<ContactModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.darkBlueColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const AddContactSheet(),
    );
  }

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  File? pickedImage;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    setState(() => pickedImage = File(picked.path));
  }

  void saveContact() {
    if (!formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      ContactModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        imagePath: pickedImage?.path,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ContactPreviewHeader(
                nameController: nameController,
                emailController: emailController,
                phoneController: phoneController,
                image: pickedImage,
                onImageTap: pickImage,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hint: 'Enter User Name',
                controller: nameController,
                validator: Validators.name,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Enter User Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hint: 'Enter User Phone',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: Validators.phone,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.goldColor,
                    foregroundColor: AppColor.darkBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: saveContact,
                  child: const Text(
                    'Enter User',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}