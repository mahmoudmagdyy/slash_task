import 'package:flutter/material.dart';

class BulidCard extends StatelessWidget {
  const BulidCard(
      {super.key, this.name, this.price, this.imgPath, this.isFavorite, this.imgPathAvatar, this.description});
  final String? name;
  final String?description;
  final String? price;
  final String? imgPath;
  final String? imgPathAvatar;
  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {},
            child: Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [

                    Hero(
                        tag: imgPath!,
                        child: Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(imgPath!),
                                    fit: BoxFit.cover)))

                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name!,
                            style: const TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Cairo',
                                fontSize: 16.0)),
                     Container(
                       height: 35,
                       width: 35,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(60),
                         image: DecorationImage(
                           image: NetworkImage(imgPathAvatar!),
                           fit: BoxFit.cover
                         )
                       ),
                     )
                      ],

                    ),
                    SizedBox(height: 6,),
                    Text(description!,
                        style: const TextStyle(
                            color: Color(0xFF575E67),
                            fontFamily: 'Cairo',
                            fontSize: 14.0)),
                    SizedBox(height: 8,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(price!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Cairo',
                                  fontSize: 14.0)),
                          const Spacer(),
                          isFavorite!
                              ? const Icon(Icons.favorite,
                              color: Colors.black26)
                              : const Icon(Icons.favorite_border,
                              color: Colors.black),
                          const SizedBox(width: 10,),
                          const Icon(Icons.add_shopping_cart_outlined,
                              color: Colors.black),
                        ]),
                  ]),
                ))));
  }
}
