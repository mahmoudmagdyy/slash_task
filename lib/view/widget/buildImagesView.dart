import 'package:flutter/material.dart';

class BuildImages extends StatelessWidget {
  BuildImages({super.key, required this.images, required this.length});

  int length;
  String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      // Adjust the height based on your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 200.0,
              // Adjust the width based on your design
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  images,
                  width: 150.0,
                  // Adjust the width based on your design
                  height: 200.0,
                  // Adjust the height based on your design
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
