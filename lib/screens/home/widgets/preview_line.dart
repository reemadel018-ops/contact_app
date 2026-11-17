import 'package:contact_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class PreviewLine extends StatelessWidget {
  const PreviewLine(this.text, {super.key,this.showDivider = true});

  final String text;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 12,top: 12),
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(bottom: BorderSide(color: AppColor.goldColor))
            : null,
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColor.goldColor, fontSize: 16),
      ),
    );
  }
}