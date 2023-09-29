import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_flutter/mvvm/res/color.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool isLoading;
  final VoidCallback onPress;

  const RoundButton({super.key,
    required this.title,
    this.isLoading = false,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 200,
        child: Center(
            child: isLoading ? CircularProgressIndicator() : Text(title, style: TextStyle(color: AppColors.whiteColor),),
        ),
      ),
    );
  }
}
