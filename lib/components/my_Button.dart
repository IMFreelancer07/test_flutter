import 'dart:ui';
import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyBtn(this.title, {this.color = (const Color(0xffa5a5a5)), super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:  12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}