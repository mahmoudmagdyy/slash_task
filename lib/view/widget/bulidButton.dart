
import 'package:flutter/material.dart';

class BulidButton extends StatelessWidget {
  const BulidButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {},
        height: 66,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
          height: 66,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: const LinearGradient(
              colors: [
                Color(0xff9f91cc),
                Color(0xff8471bb),
              ],
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: const Center(
            child: Text(
              "Add to Cart\t\t\t\$120",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
