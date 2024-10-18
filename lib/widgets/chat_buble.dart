
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/message.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({
    super.key,
    required this.message
  });
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: kPrimaryColor,
        ),
        child: Text(message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}





class ChatBubleForFriend extends StatelessWidget {
  ChatBubleForFriend({
    super.key,
    required this.message
  });
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
