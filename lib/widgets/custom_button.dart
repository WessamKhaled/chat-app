import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.textButton,this.onTap});
  String textButton;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(textButton,
            style: TextStyle(color: Color(0xff274561)),
          ),
        ),
      ),
    );
  }
}
