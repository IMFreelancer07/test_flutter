import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';

class socialMedia_RoundButton extends StatelessWidget {
  final String title;
  bool isLoading;
  final VoidCallback onPress;
  final Color color, textColor;

   socialMedia_RoundButton({
     super.key,
     required this.title,
     this.isLoading = false,
     required this.onPress,
     this.color = AppColors.primaryButtonColor,
     this.textColor = Colors.white,
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
            child: isLoading ? CircularProgressIndicator(color: textColor,) :
            Text(title, style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16, color: textColor),)),
      ),
    );
  }
}
