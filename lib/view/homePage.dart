import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slash_task/view/showDetailScreen.dart';
import 'package:slash_task/view/widget/bulidCard.dart';
import '../control/productControllerntrolller.dart';

import '../model/productModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.put(DetailController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Slash"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getProduct(),
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            DetailModel data=snapshot.data ;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:320,
                    childAspectRatio: 4 /5,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6),
                itemCount: data.data!.length,
                itemBuilder: (BuildContext ctx, index) {
                  controller.id=data.data![index].id;

                  return InkWell(
                    onTap: () {
                      Get.to(DetailScreen(
                        categoryId: snapshot.data.data![index].id,
                      )) ;
                    },

                    child: BulidCard(
                      name: data.data![index].name,
                      description:  data.data![index].description,
                      imgPathAvatar: data.data![index].brands!.brandLogoImagePath,
                      price:  "\$${data.data![index].productVariations![0].price.toString()}",
                      isFavorite:false,
                      imgPath: data.data![index].productVariations![0].productVarientImages![0].imagePath,
                    ),
                  );
                });
          }
        },
      ),


    );
  }
}
