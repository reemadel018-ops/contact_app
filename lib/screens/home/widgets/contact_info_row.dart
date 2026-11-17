import 'package:contact_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ContactInfoRow extends StatelessWidget {
  const ContactInfoRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColor.darkBlueColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColor.darkBlueColor,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}