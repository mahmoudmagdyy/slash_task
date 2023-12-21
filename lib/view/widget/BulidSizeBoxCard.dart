
import 'package:flutter/material.dart';

class BulidSizeBoxCard extends StatelessWidget {
   BulidSizeBoxCard({super.key,this.title,this.isSeleted});
     String ? title;
      bool ?isSeleted;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      height: 40,
      minWidth: 40,
      elevation: 0,
      color: isSeleted! ? Color(0xff8f7fc4) : Color(0xffe8e8e8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          title!,
          style: TextStyle(
            color: isSeleted! ? Colors.white : const Color(0xff727274),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
