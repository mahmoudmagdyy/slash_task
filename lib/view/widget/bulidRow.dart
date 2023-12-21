
import 'package:flutter/material.dart';

class BulidRow extends StatelessWidget {
   BulidRow({super.key,this.text1,this.text2});
 String ?text1;
  String ?text2;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1!,
          style: TextStyle(
            color: Color(0xff979797),
          ),
        ),
        Text(
          text2!,
          style: TextStyle(
            color: Color(0xff979797),
          ),
        ),
      ],
    );
  }
}
