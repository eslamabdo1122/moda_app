import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moda/models/product_model.dart';
import 'package:moda/pages/product_detailes.dart';
import 'package:moda/widgets/category_filter.dart';
import 'package:moda/widgets/custom_appbar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<ProductModel> products = [
    ProductModel(
      image: 'assets/images/models/model1.png',
      name: 'Top Man Black',
      price: '20',
      
    ),
    ProductModel(
      image: 'assets/images/models/model2.png',
      name: 'Top Man Black',
      price: '40',
    ),
    ProductModel(
      image: 'assets/images/models/model3.png',
      name: 'Top Man Black',
      price: '16',
    ),
    ProductModel(
      image: 'assets/images/models/model4.png',
      name: 'Top Man Black',
      price: '54',
    ),
    ProductModel(
      image: 'assets/images/models/model1.png',
      name: 'Top Man Black',
      price: '20',
    ),
    ProductModel(
      image: 'assets/images/models/model2.png',
      name: 'Top Man Black',
      price: '40',
    ),
    ProductModel(
      image: 'assets/images/models/model3.png',
      name: 'Top Man Black',
      price: '16',
    ),
    ProductModel(
      image: 'assets/images/models/model4.png',
      name: 'Top Man Black',
      price: '54',
    ),
  ];

  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppbar(
        title: "Men",
        action: 'assets/svgs/cart.svg',
        leading: 'assets/svgs/arrow-left.svg',
      ),
      body: Column(
        children: [
          CategoryFilter(),
          Gap(13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    isGridView ? Icons.list : Icons.grid_view,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child:
                isGridView
                    ? GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final item = products[index];
                        return ProductCard(
                          item: item,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ProductDetailes(item: item),
                              ),
                            );
                          },
                        );
                      },
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final item = products[index];
                        return ProductCard(
                          item: item,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ProductDetailes(item: item),
                              ),
                            );
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel item;
  final VoidCallback onTap;

  const ProductCard({required this.item, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[500]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Center(child: Image.asset(item.image)),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Image.asset('assets/images/shadow.png'),
                  ),
                ],
              ),
            ),
          ),
          Text(
            item.name,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
          Gap(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${item.price}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.favorite_border),
            ],
          ),
        ],
      ),
    );
  }
}
