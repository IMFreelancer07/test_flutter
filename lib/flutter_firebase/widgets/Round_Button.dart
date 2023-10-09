import 'package:flutter/material.dart';

class RoundButtonFirebase extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  final bool loading;

  const RoundButtonFirebase({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Center(
          child:
          loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white,) :
          Text(title, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
