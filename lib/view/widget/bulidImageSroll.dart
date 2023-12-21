import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class BulidImageScroll extends StatelessWidget {
   BulidImageScroll({super.key,this.images});
   List<String>? images;


  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(
        scrollPhysics: const ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        height: double.infinity,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: images!
          .map(
            (e) => Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Color(0xffb2adca).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10.0,
                offset: -Offset(0, 3),
              )
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(e),
            ),
          ),

        ),
      )
          .toList(),
    );
  }
}

