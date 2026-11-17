import 'dart:io';

import 'package:contact_app/core/theme/app_color.dart';
import 'package:contact_app/screens/home/widgets/preview_line.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactPreviewHeader extends StatelessWidget {
  const ContactPreviewHeader({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.onImageTap,
    this.image,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final VoidCallback onImageTap;
  final File? image;

  static const double imageBoxWidth = 143;
  static const double imageBoxHeight = 146;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onImageTap,
          child: Container(
            width: imageBoxWidth,
            height: imageBoxHeight,
            clipBehavior: Clip.antiAlias,
            padding: image == null ? const EdgeInsets.all(12) : null,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.goldColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: image == null
                ? Lottie.asset('assets/lottie/image_picker.json')
                : Image.file(image!, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SizedBox(
            height: imageBoxHeight,
            child: ListenableBuilder(
              listenable: Listenable.merge([
                nameController,
                emailController,
                phoneController,
              ]),
              builder: (context, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PreviewLine(
                      nameController.text.isEmpty
                          ? 'User Name'
                          : nameController.text,
                    ),
                    PreviewLine(
                      emailController.text.isEmpty
                          ? 'example@email.com'
                          : emailController.text,
                    ),
                    PreviewLine(
                      phoneController.text.isEmpty
                          ? '+200000000000'
                          : phoneController.text,
                      showDivider: false,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}