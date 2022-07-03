import 'package:flutter/material.dart';
import 'package:shop/api_service/api_service.dart';
import 'package:shop/screen/product_detail.dart';
import '../model/model.dart';
import '../widget/image_slider.dart';
import 'product_detail.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageSlider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "All Products",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      physics:
                          const ScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.data.product!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Card(
                            elevation: 7,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://electronic-ecommerce.herokuapp.com/fantechHeadset.jpg"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data.product![index].name,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data!.data.product![index].price,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                  name:
                                      snapshot.data!.data.product![index].name,
                                  price:
                                      snapshot.data!.data.product![index].price,
                                  stock:
                                      snapshot.data!.data.product![index].stock,
                                ),
                              ),
                            );
                          },
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
