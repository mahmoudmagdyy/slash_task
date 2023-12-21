import 'package:flutter/material.dart';

class BulidText extends StatelessWidget {
   BulidText({super.key,this.text});
 String ?text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: Color(0xff979797),
       fontSize: 18
      ),
    );
  }
}
