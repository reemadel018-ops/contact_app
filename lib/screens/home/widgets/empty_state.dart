import 'package:contact_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
     
      children: [
        Lottie.asset(
          'assets/lottie/no_data.json',
          width: 300,
        ),
        const SizedBox(height: 8,),
        
        const Text(
          'There is No Contacts Added Here',
          style: TextStyle(
            color: AppColor.goldColor,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
