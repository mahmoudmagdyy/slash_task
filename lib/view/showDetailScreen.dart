import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slash_task/view/widget/BulidSizeBoxCard.dart';
import 'package:slash_task/view/widget/bulidButton.dart';
import 'package:slash_task/view/widget/bulidRow.dart';
import 'package:slash_task/view/widget/bulidText.dart';
import '../control/showDetailProductController.dart';
import '../model/productDetailModel.dart';


class DetailScreen extends StatelessWidget {
  final int categoryId;


  DetailScreen({required this.categoryId,});

  Service controller = Get.put(Service());

  @override
  void initState() {
    controller.fetchData(categoryId);
  }

  List<String> images = [
    "assets/images/chaire.png",
    "assets/images/chaire.png",
    "assets/images/chaire.png",
    "assets/images/chaire.png"];

  @override
  Widget build(BuildContext context) {
    int hexToInteger(String hex) => int.parse(hex, radix: 16);
    Service service = Get.put(Service());
    service.fetchData(categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: Obx(
              () => ListView.builder(
               itemCount: service.productList.length,
              itemBuilder: (context, index) {
              final Product product = service.productList[index];
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200.0,
                          // Adjust the height based on your design
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product
                                .variations[0].productVarientImages.length,
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
                                      product.variations[0]
                                          .productVarientImages[index].imagePath
                                          .toString(),
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
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff39393b),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                product.brandImage),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              BulidRow(
                                text1:
                                "\EGP ${product.variations[0].price.toString()}",
                                text2: product.brandName,
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              SizedBox(
                                height: product.availableProperties.length!=0&&product.availableProperties[index].property == "Size"?70:0,
                                child: ListView.builder(
                                    physics: PageScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:3,
                                    itemBuilder: (context, index) {
                                      if (product.availableProperties[index]
                                          .property ==
                                          "Size") {
                                        return Column(children:[
                                          BulidSizeBoxCard(
                                            title: product.availableProperties[index].values[index].value,
                                            isSeleted: true,
                                          ),
                                        ]);
                                      }else{
                                        Container(height: 0,);
                                      }
                                    }),
                              ),
                              SizedBox(
                                height: product.availableProperties.length!=0&&product.availableProperties[index].property == "Materials"?70:0,
                                child: ListView.builder(
                                    physics: PageScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                    product.availableProperties.length,
                                    itemBuilder: (context, index) {
                                      if (product.availableProperties[index]
                                          .property ==
                                          "Materials") {
                                        return Column(children:[
                                          Text("Select Materials"),

                                          BulidSizeBoxCard(
                                            title: product
                                                .availableProperties[index]
                                                .values[index]
                                                .value,
                                            isSeleted: true,
                                          ),
                                        ]);
                                      }else{
                                        Container(height: 0,);
                                      }
                                    }),
                              ),
                              SizedBox(
                                height:product.availableProperties.length!=0&& product.availableProperties[index].property == "Color"?70:0,
                                child: ListView.builder(
                                    physics: PageScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                    product.availableProperties.length,
                                    itemBuilder: (context, index) {
                                      if (product.availableProperties[index]
                                          .property ==
                                          "Color") {
                                        return Column(children:[
                                          Text("Select Size"),

                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Color(hexToInteger(product.availableProperties[index].values[index].value)),
                                          )
                                        ]);
                                      }else{
                                        Container(height: 0,);
                                      }
                                    }),
                              ),

                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      BulidText(text: "Description"),
                                      Text(
                                        product.description,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xffb2b2b2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const BulidButton(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),

    );
  }
}
